package main

import (
	"context"
	"fmt"
	"log"
	"os"

	"github.com/ryomak/reatter/server/grpc"
	v1 "github.com/ryomak/reatter/server/grpc/service/v1"
)

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
		log.Printf("defaulting to port %s", port)
	}

	serv := v1.NewChatServiceServer()

	go serv.Control()

	if err := grpc.RunServer(context.Background(), serv, port); err != nil {
		fmt.Fprintf(os.Stderr, "%v\n", err)
		os.Exit(1)
	}
}
