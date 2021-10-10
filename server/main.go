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

	if err := grpc.RunServer(context.Background(), v1.NewChatServiceServer(), port); err != nil {
		fmt.Fprintf(os.Stderr, "%v\n", err)
		os.Exit(1)
	}
}
