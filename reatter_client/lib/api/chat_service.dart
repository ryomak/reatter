import 'package:grpc/grpc.dart';

import 'package:reatter/model/message.dart';

import 'v1/chat.pbgrpc.dart' as grpc;
import 'v1/google/protobuf/wrappers.pb.dart';



/// CHANGE TO IP ADDRESS OF YOUR SERVER IF IT IS NECESSARY
const serverIP = "localhost";
const serverPort = 8080;

/// ChatService client implementation
class ChatService {

  String roomName;

  ClientChannel client;

  /// Constructor
  ChatService(
      { this.roomName})
      :
        client = ClientChannel(
          serverIP, // Your IP here or localhost
          port: serverPort,
          options: ChannelOptions(
            credentials: ChannelCredentials.insecure(),
            idleTimeout: Duration(seconds: 1),
          )
        );

  /// Send message to the server
  void send(Message message){
    grpc.ChatServiceClient(client)
        .send(grpc.Message(
          roomName: message.roomName,
          text: message.text,
          size: message.size,
          speed: message.speed,
          colorR: message.colorR,
          colorG: message.colorG,
          colorB: message.colorB,
    ));
  }

  Stream<Message> receive() async* {
    var request = StringValue.create();
    request.value = roomName;
    var stream = grpc.ChatServiceClient(client).subscribe(request);
    await for (var msg in stream) {
      yield Message(
          roomName: msg.roomName,
          text: msg.text,
          speed: msg.speed,
          size: msg.size,
          colorR: msg.colorR,
          colorG: msg.colorG,
          colorB: msg.colorB,
      );
    }
  }
}