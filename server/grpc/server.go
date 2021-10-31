package grpc

import (
	"context"
	"log"
	"net"
	"time"

	"google.golang.org/grpc"
	"google.golang.org/grpc/keepalive"

	v1 "github.com/ryomak/reatter/server/api/v1"
)

// RunServer registers gRPC service and run server
func RunServer(ctx context.Context, srv v1.ChatServiceServer, port string) error {
	listen, err := net.Listen("tcp", ":"+port)
	if err != nil {
		return err
	}

	// register service
	server := grpc.NewServer(
		grpc.KeepaliveParams(keepalive.ServerParameters{
			MaxConnectionIdle: 3 * time.Minute,
		}),
	)
	v1.RegisterChatServiceServer(server, srv)

	// start gRPC server
	log.Println("starting gRPC server...")
	return server.Serve(listen)
}
