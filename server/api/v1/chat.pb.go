// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.27.1
// 	protoc        v3.17.3
// source: chat.proto

package v1

import (
	context "context"
	grpc "google.golang.org/grpc"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	emptypb "google.golang.org/protobuf/types/known/emptypb"
	wrapperspb "google.golang.org/protobuf/types/known/wrapperspb"
	reflect "reflect"
	sync "sync"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

// Message is response for ChatService.Subscribe method
type Message struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	// message body
	RoomName string  `protobuf:"bytes,1,opt,name=roomName,proto3" json:"roomName,omitempty"`
	Text     string  `protobuf:"bytes,2,opt,name=text,proto3" json:"text,omitempty"`
	Size     float64 `protobuf:"fixed64,3,opt,name=size,proto3" json:"size,omitempty"`
	Speed    float64 `protobuf:"fixed64,4,opt,name=speed,proto3" json:"speed,omitempty"`
	ColorR   int32   `protobuf:"varint,5,opt,name=colorR,proto3" json:"colorR,omitempty"`
	ColorG   int32   `protobuf:"varint,6,opt,name=colorG,proto3" json:"colorG,omitempty"`
	ColorB   int32   `protobuf:"varint,7,opt,name=colorB,proto3" json:"colorB,omitempty"`
	Top      float64 `protobuf:"fixed64,8,opt,name=top,proto3" json:"top,omitempty"`
}

func (x *Message) Reset() {
	*x = Message{}
	if protoimpl.UnsafeEnabled {
		mi := &file_chat_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *Message) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*Message) ProtoMessage() {}

func (x *Message) ProtoReflect() protoreflect.Message {
	mi := &file_chat_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use Message.ProtoReflect.Descriptor instead.
func (*Message) Descriptor() ([]byte, []int) {
	return file_chat_proto_rawDescGZIP(), []int{0}
}

func (x *Message) GetRoomName() string {
	if x != nil {
		return x.RoomName
	}
	return ""
}

func (x *Message) GetText() string {
	if x != nil {
		return x.Text
	}
	return ""
}

func (x *Message) GetSize() float64 {
	if x != nil {
		return x.Size
	}
	return 0
}

func (x *Message) GetSpeed() float64 {
	if x != nil {
		return x.Speed
	}
	return 0
}

func (x *Message) GetColorR() int32 {
	if x != nil {
		return x.ColorR
	}
	return 0
}

func (x *Message) GetColorG() int32 {
	if x != nil {
		return x.ColorG
	}
	return 0
}

func (x *Message) GetColorB() int32 {
	if x != nil {
		return x.ColorB
	}
	return 0
}

func (x *Message) GetTop() float64 {
	if x != nil {
		return x.Top
	}
	return 0
}

var File_chat_proto protoreflect.FileDescriptor

var file_chat_proto_rawDesc = []byte{
	0x0a, 0x0a, 0x63, 0x68, 0x61, 0x74, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x02, 0x76, 0x31,
	0x1a, 0x1b, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2f, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75,
	0x66, 0x2f, 0x65, 0x6d, 0x70, 0x74, 0x79, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x1a, 0x1e, 0x67,
	0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2f, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2f, 0x77,
	0x72, 0x61, 0x70, 0x70, 0x65, 0x72, 0x73, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x22, 0xbd, 0x01,
	0x0a, 0x07, 0x4d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x12, 0x1a, 0x0a, 0x08, 0x72, 0x6f, 0x6f,
	0x6d, 0x4e, 0x61, 0x6d, 0x65, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x08, 0x72, 0x6f, 0x6f,
	0x6d, 0x4e, 0x61, 0x6d, 0x65, 0x12, 0x12, 0x0a, 0x04, 0x74, 0x65, 0x78, 0x74, 0x18, 0x02, 0x20,
	0x01, 0x28, 0x09, 0x52, 0x04, 0x74, 0x65, 0x78, 0x74, 0x12, 0x12, 0x0a, 0x04, 0x73, 0x69, 0x7a,
	0x65, 0x18, 0x03, 0x20, 0x01, 0x28, 0x01, 0x52, 0x04, 0x73, 0x69, 0x7a, 0x65, 0x12, 0x14, 0x0a,
	0x05, 0x73, 0x70, 0x65, 0x65, 0x64, 0x18, 0x04, 0x20, 0x01, 0x28, 0x01, 0x52, 0x05, 0x73, 0x70,
	0x65, 0x65, 0x64, 0x12, 0x16, 0x0a, 0x06, 0x63, 0x6f, 0x6c, 0x6f, 0x72, 0x52, 0x18, 0x05, 0x20,
	0x01, 0x28, 0x05, 0x52, 0x06, 0x63, 0x6f, 0x6c, 0x6f, 0x72, 0x52, 0x12, 0x16, 0x0a, 0x06, 0x63,
	0x6f, 0x6c, 0x6f, 0x72, 0x47, 0x18, 0x06, 0x20, 0x01, 0x28, 0x05, 0x52, 0x06, 0x63, 0x6f, 0x6c,
	0x6f, 0x72, 0x47, 0x12, 0x16, 0x0a, 0x06, 0x63, 0x6f, 0x6c, 0x6f, 0x72, 0x42, 0x18, 0x07, 0x20,
	0x01, 0x28, 0x05, 0x52, 0x06, 0x63, 0x6f, 0x6c, 0x6f, 0x72, 0x42, 0x12, 0x10, 0x0a, 0x03, 0x74,
	0x6f, 0x70, 0x18, 0x08, 0x20, 0x01, 0x28, 0x01, 0x52, 0x03, 0x74, 0x6f, 0x70, 0x32, 0x78, 0x0a,
	0x0b, 0x43, 0x68, 0x61, 0x74, 0x53, 0x65, 0x72, 0x76, 0x69, 0x63, 0x65, 0x12, 0x2d, 0x0a, 0x04,
	0x53, 0x65, 0x6e, 0x64, 0x12, 0x0b, 0x2e, 0x76, 0x31, 0x2e, 0x4d, 0x65, 0x73, 0x73, 0x61, 0x67,
	0x65, 0x1a, 0x16, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f,
	0x62, 0x75, 0x66, 0x2e, 0x45, 0x6d, 0x70, 0x74, 0x79, 0x22, 0x00, 0x12, 0x3a, 0x0a, 0x09, 0x53,
	0x75, 0x62, 0x73, 0x63, 0x72, 0x69, 0x62, 0x65, 0x12, 0x1c, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c,
	0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x53, 0x74, 0x72, 0x69, 0x6e,
	0x67, 0x56, 0x61, 0x6c, 0x75, 0x65, 0x1a, 0x0b, 0x2e, 0x76, 0x31, 0x2e, 0x4d, 0x65, 0x73, 0x73,
	0x61, 0x67, 0x65, 0x22, 0x00, 0x30, 0x01, 0x42, 0x29, 0x5a, 0x27, 0x67, 0x69, 0x74, 0x68, 0x75,
	0x62, 0x2e, 0x63, 0x6f, 0x6d, 0x2f, 0x72, 0x79, 0x6f, 0x6d, 0x61, 0x6b, 0x2f, 0x72, 0x65, 0x61,
	0x74, 0x74, 0x65, 0x72, 0x2f, 0x73, 0x65, 0x72, 0x76, 0x65, 0x72, 0x2f, 0x61, 0x70, 0x69, 0x2f,
	0x76, 0x31, 0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_chat_proto_rawDescOnce sync.Once
	file_chat_proto_rawDescData = file_chat_proto_rawDesc
)

func file_chat_proto_rawDescGZIP() []byte {
	file_chat_proto_rawDescOnce.Do(func() {
		file_chat_proto_rawDescData = protoimpl.X.CompressGZIP(file_chat_proto_rawDescData)
	})
	return file_chat_proto_rawDescData
}

var file_chat_proto_msgTypes = make([]protoimpl.MessageInfo, 1)
var file_chat_proto_goTypes = []interface{}{
	(*Message)(nil),                // 0: v1.Message
	(*wrapperspb.StringValue)(nil), // 1: google.protobuf.StringValue
	(*emptypb.Empty)(nil),          // 2: google.protobuf.Empty
}
var file_chat_proto_depIdxs = []int32{
	0, // 0: v1.ChatService.Send:input_type -> v1.Message
	1, // 1: v1.ChatService.Subscribe:input_type -> google.protobuf.StringValue
	2, // 2: v1.ChatService.Send:output_type -> google.protobuf.Empty
	0, // 3: v1.ChatService.Subscribe:output_type -> v1.Message
	2, // [2:4] is the sub-list for method output_type
	0, // [0:2] is the sub-list for method input_type
	0, // [0:0] is the sub-list for extension type_name
	0, // [0:0] is the sub-list for extension extendee
	0, // [0:0] is the sub-list for field type_name
}

func init() { file_chat_proto_init() }
func file_chat_proto_init() {
	if File_chat_proto != nil {
		return
	}
	if !protoimpl.UnsafeEnabled {
		file_chat_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*Message); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
	}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_chat_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   1,
			NumExtensions: 0,
			NumServices:   1,
		},
		GoTypes:           file_chat_proto_goTypes,
		DependencyIndexes: file_chat_proto_depIdxs,
		MessageInfos:      file_chat_proto_msgTypes,
	}.Build()
	File_chat_proto = out.File
	file_chat_proto_rawDesc = nil
	file_chat_proto_goTypes = nil
	file_chat_proto_depIdxs = nil
}

// Reference imports to suppress errors if they are not otherwise used.
var _ context.Context
var _ grpc.ClientConnInterface

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
const _ = grpc.SupportPackageIsVersion6

// ChatServiceClient is the client API for ChatService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://godoc.org/google.golang.org/grpc#ClientConn.NewStream.
type ChatServiceClient interface {
	// Send sends message to the server
	Send(ctx context.Context, in *Message, opts ...grpc.CallOption) (*emptypb.Empty, error)
	// Subscribe is streaming method to get echo messages from the server
	Subscribe(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (ChatService_SubscribeClient, error)
}

type chatServiceClient struct {
	cc grpc.ClientConnInterface
}

func NewChatServiceClient(cc grpc.ClientConnInterface) ChatServiceClient {
	return &chatServiceClient{cc}
}

func (c *chatServiceClient) Send(ctx context.Context, in *Message, opts ...grpc.CallOption) (*emptypb.Empty, error) {
	out := new(emptypb.Empty)
	err := c.cc.Invoke(ctx, "/v1.ChatService/Send", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *chatServiceClient) Subscribe(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (ChatService_SubscribeClient, error) {
	stream, err := c.cc.NewStream(ctx, &_ChatService_serviceDesc.Streams[0], "/v1.ChatService/Subscribe", opts...)
	if err != nil {
		return nil, err
	}
	x := &chatServiceSubscribeClient{stream}
	if err := x.ClientStream.SendMsg(in); err != nil {
		return nil, err
	}
	if err := x.ClientStream.CloseSend(); err != nil {
		return nil, err
	}
	return x, nil
}

type ChatService_SubscribeClient interface {
	Recv() (*Message, error)
	grpc.ClientStream
}

type chatServiceSubscribeClient struct {
	grpc.ClientStream
}

func (x *chatServiceSubscribeClient) Recv() (*Message, error) {
	m := new(Message)
	if err := x.ClientStream.RecvMsg(m); err != nil {
		return nil, err
	}
	return m, nil
}

// ChatServiceServer is the server API for ChatService service.
type ChatServiceServer interface {
	// Send sends message to the server
	Send(context.Context, *Message) (*emptypb.Empty, error)
	// Subscribe is streaming method to get echo messages from the server
	Subscribe(*wrapperspb.StringValue, ChatService_SubscribeServer) error
}

// UnimplementedChatServiceServer can be embedded to have forward compatible implementations.
type UnimplementedChatServiceServer struct {
}

func (*UnimplementedChatServiceServer) Send(context.Context, *Message) (*emptypb.Empty, error) {
	return nil, status.Errorf(codes.Unimplemented, "method Send not implemented")
}
func (*UnimplementedChatServiceServer) Subscribe(*wrapperspb.StringValue, ChatService_SubscribeServer) error {
	return status.Errorf(codes.Unimplemented, "method Subscribe not implemented")
}

func RegisterChatServiceServer(s *grpc.Server, srv ChatServiceServer) {
	s.RegisterService(&_ChatService_serviceDesc, srv)
}

func _ChatService_Send_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(Message)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ChatServiceServer).Send(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/v1.ChatService/Send",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ChatServiceServer).Send(ctx, req.(*Message))
	}
	return interceptor(ctx, in, info, handler)
}

func _ChatService_Subscribe_Handler(srv interface{}, stream grpc.ServerStream) error {
	m := new(wrapperspb.StringValue)
	if err := stream.RecvMsg(m); err != nil {
		return err
	}
	return srv.(ChatServiceServer).Subscribe(m, &chatServiceSubscribeServer{stream})
}

type ChatService_SubscribeServer interface {
	Send(*Message) error
	grpc.ServerStream
}

type chatServiceSubscribeServer struct {
	grpc.ServerStream
}

func (x *chatServiceSubscribeServer) Send(m *Message) error {
	return x.ServerStream.SendMsg(m)
}

var _ChatService_serviceDesc = grpc.ServiceDesc{
	ServiceName: "v1.ChatService",
	HandlerType: (*ChatServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "Send",
			Handler:    _ChatService_Send_Handler,
		},
	},
	Streams: []grpc.StreamDesc{
		{
			StreamName:    "Subscribe",
			Handler:       _ChatService_Subscribe_Handler,
			ServerStreams: true,
		},
	},
	Metadata: "chat.proto",
}
