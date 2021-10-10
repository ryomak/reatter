package v1

import (
	"context"
	"log"

	"github.com/golang/protobuf/ptypes/empty"
	"github.com/golang/protobuf/ptypes/wrappers"

	v1 "github.com/ryomak/reatter/server/api/v1"
)

// chatServiceServer is implementation of v1.ChatServiceServer proto interface
type chatServiceServer struct {
	msg chan *Message
}

type Message struct {
	Text     string
	RoomName string
	Size     float64
	Speed    float64
	ColorR   int32
	ColorG   int32
	ColorB   int32
}

// NewChatServiceServer creates Chat service object
func NewChatServiceServer() v1.ChatServiceServer {
	return &chatServiceServer{msg: make(chan *Message, 1000)}
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
		}
	} else {
		log.Print("Send requested: message=<empty>")
	}

	return &empty.Empty{}, nil
}

// Subscribe is streaming method to get echo messages from the server
func (s *chatServiceServer) Subscribe(roomName *wrappers.StringValue, stream v1.ChatService_SubscribeServer) error {
	log.Print("Subscribe requested")
	stream.Send(&v1.Message{
		Text:     "test",
		RoomName: roomName.GetValue(),
	})
	for {
		m := <-s.msg
		if roomName.GetValue() != m.RoomName {
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

		n := v1.Message{
			Text:     m.Text,
			RoomName: m.RoomName,
			Size:     m.Size,
			Speed:    m.Speed,
			ColorR:   m.ColorR,
			ColorG:   m.ColorG,
			ColorB:   m.ColorB,
		}
		if err := stream.Send(&n); err != nil {
			// put message back to the channel
			s.msg <- m
			log.Printf("Stream connection failed: %v", err)
			return err
		}
		log.Printf("Message sent: %+v", n)
	}
}
