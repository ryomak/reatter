import 'package:reatter/api/chat_service.dart';
import 'package:reatter/component/scroll_text.dart';
import 'package:reatter/model/message.dart';
import 'package:flutter/material.dart';
import 'dart:math';


class RoomStore extends ChangeNotifier {

  String roomName;
  ChatService chatService;

  List<ScrollingText> messages = [];

  TextEditingController inputMessageController = TextEditingController();


  RoomStore(
      this.roomName,
  ):chatService = ChatService(roomName: roomName);

  @override
  void dispose() {
    inputMessageController.dispose();
    super.dispose();
  }

  Stream<List<ScrollingText>>listen(BuildContext context) async*{
    try {
      var stream = chatService.receive();

      await for (var message in stream) {
        final t = ScrollingText(
          text: message.text,
          top: Random().nextDouble(),
          speed: message.speed,
          textStyle: TextStyle(
            fontSize: 20 * message.size,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(
                message.colorR, message.colorG, message.colorB, 1),
          ),
        );
        messages.add(t);
        yield messages;
      }
    } catch(e) {
        print(e);
        if (context != null){
          Navigator.pop(context);
        }
    }
  }

  void sendMessage() {
    if (inputMessageController.text == ""){
      return;
    }
    var sizeSpeed = Random().nextDouble();
    if (sizeSpeed < 0.3) {
      sizeSpeed = sizeSpeed + 0.5;
    }
    final message = Message(
        roomName: roomName,
        text: inputMessageController.text,
        size: sizeSpeed,
        speed: 1 - sizeSpeed,
        colorR: Random().nextInt(255),
        colorG: Random().nextInt(255),
        colorB: Random().nextInt(255),
    );
    try {
      chatService.send(message);
      inputMessageController.clear();
    } catch(e) {
      print(e);
    }
  }

}