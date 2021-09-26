protoc empty.proto timestamp.proto wrappers.proto \
    --proto_path=../third_party/google/protobuf \
    --dart_out=grpc:../reatter_client/lib/api/v1/google/protobuf

protoc -I ../api/proto/v1 chat.proto \
    --go_opt=module=github.com/ryomak/reatter/server/api/v1 \
    --go_out=plugins=grpc:../server/api/v1

protoc chat.proto \
    --proto_path=../api/proto/v1 \
    --proto_path=. \
    --dart_out=grpc:../reatter_client/lib/api/v1
