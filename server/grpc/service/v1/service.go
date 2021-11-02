package v1

import (
	"context"
	"fmt"
	"log"
	"math/rand"

	"github.com/golang/protobuf/ptypes/empty"
	"github.com/golang/protobuf/ptypes/wrappers"
	"github.com/rs/xid"

	"github.com/greymd/ojichat/generator"
	v1 "github.com/ryomak/reatter/server/api/v1"
)

// chatServiceServer is implementation of v1.ChatServiceServer proto interface
type chatServiceServer struct {
	msg   chan *Message
	rooms map[string]*Room
}

type Room struct {
	users map[string]v1.ChatService_SubscribeServer
}

type Message struct {
	Text     string
	RoomName string
	Size     float64
	Speed    float64
	ColorR   int32
	ColorG   int32
	ColorB   int32
	Top      float64
}

type ChatServer interface {
	v1.ChatServiceServer
	Control()
}

// NewChatServiceServer creates Chat service object
func NewChatServiceServer() ChatServer {
	c := &chatServiceServer{
		msg:   make(chan *Message, 1000),
		rooms: map[string]*Room{},
	}
	return c
}

// Send sends message to the server
func (s *chatServiceServer) Send(ctx context.Context, message *v1.Message) (*empty.Empty, error) {
	if message != nil {
		//log.Printf("Send requested: message=%v", *message.RoomName)
		s.msg <- &Message{
			Text:     message.Text,
			RoomName: message.RoomName,
			Size:     message.Size,
			Speed:    message.Speed,
			ColorR:   message.ColorR,
			ColorG:   message.ColorG,
			ColorB:   message.ColorB,
			Top:      message.Top,
		}
	} else {
		log.Print("Send requested: message=<empty>")
	}

	return &empty.Empty{}, nil
}

// Subscribe is streaming method to get echo messages from the server
func (s *chatServiceServer) Subscribe(roomName *wrappers.StringValue, stream v1.ChatService_SubscribeServer) error {
	if room := s.rooms[roomName.GetValue()]; room == nil {
		s.rooms[roomName.GetValue()] = &Room{
			users: map[string]v1.ChatService_SubscribeServer{},
		}
		s.rooms[roomName.GetValue()].users[xid.New().String()] = stream
	} else {
		room.users[xid.New().String()] = stream
	}
	log.Print("Subscribe requested")
	if text, _ := generator.Start(generator.Config{
		TargetName:       "",
		EmojiNum:         1,
		PunctuationLevel: 1,
	}); text != "" {
		stream.Send(&v1.Message{
			Text:     text,
			RoomName: roomName.GetValue(),
			Size:     0.2,
			Speed:    0.3,
			Top:      rand.Float64(),
		})
	}

	// block
LOOP:
	for {
		stream.Context().Done()
		select {
		case <-stream.Context().Done():
			break LOOP
		}
	}
	return nil
}

func (s *chatServiceServer) Control() {
	for {
		m := <-s.msg
		room := s.rooms[m.RoomName]
		if room == nil {
			continue
		}
		switch {
		case m.Size < 0.4:
			m.Size = m.Size + 0.5
		case 1 < m.Size:
			m.Size = 1
		}
		switch {
		case m.Speed < 0.4:
			m.Speed = m.Speed + 0.5
		case 1 < m.Speed:
			m.Speed = 1
		}

		message := v1.Message{
			Text:     m.Text,
			RoomName: m.RoomName,
			Size:     m.Size,
			Speed:    m.Speed,
			ColorR:   m.ColorR,
			ColorG:   m.ColorG,
			ColorB:   m.ColorB,
			Top:      m.Top,
		}
		for k, v := range room.users {
			if err := v.Send(&message); err != nil {
				fmt.Println(k, err.Error())
				v.Context().Deadline()
				delete(room.users, k)
			}
		}
	}
}
