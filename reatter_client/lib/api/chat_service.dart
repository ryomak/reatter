import 'package:grpc/grpc.dart';
import 'package:reatter/model/message.dart';

import 'v1/chat.pbgrpc.dart' as grpc;
import 'v1/google/protobuf/wrappers.pb.dart';

const prodServerIP = "reatter-wrk5pd3voa-an.a.run.app";
const prodServerPort = 443;

const serverIP = "192.168.0.6";
const serverPort = 8080;

const isProd = false;

/// ChatService client implementation
class ChatService {
  String roomName;

  grpc.ChatServiceClient client;

  /// Constructor
  ChatService({this.roomName})
      : client = grpc.ChatServiceClient(isProd
            ? ClientChannel(prodServerIP, // Your IP here or localhost
                port: prodServerPort,
                options: ChannelOptions(
                  idleTimeout: Duration(seconds: 3),
                ))
            : ClientChannel(serverIP, // Your IP here or localhost
                port: serverPort,
                options: ChannelOptions(
                  credentials: ChannelCredentials.insecure(),
                  idleTimeout: Duration(seconds: 3),
                )));

  /// Send message to the server
  void send(Message message) async {
    client.send(grpc.Message(
      roomName: message.roomName,
      text: message.text,
      size: message.size,
      speed: message.speed,
      colorR: message.colorR,
      colorG: message.colorG,
      colorB: message.colorB,
      top: message.top,
    ));
  }

  Stream<Message> receive() async* {
    var request = StringValue.create();
    request.value = roomName;
    var stream = client.subscribe(request);
    await for (var msg in stream) {
      yield Message(
        roomName: msg.roomName,
        text: msg.text,
        speed: msg.speed,
        size: msg.size,
        colorR: msg.colorR,
        colorG: msg.colorG,
        colorB: msg.colorB,
        top: msg.top,
      );
    }
  }
}
