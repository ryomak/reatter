import 'package:reatter/api/chat_service.dart';
import 'package:reatter/component/scroll_text.dart';
import 'package:reatter/model/message.dart';
import 'package:flutter/material.dart';
import 'package:reatter/model/room.dart';
import 'dart:math';


class RoomStore extends ChangeNotifier {

  String roomName;
  ChatService chatService;

  List<ScrollingText> messages = [];

  TextEditingController inputMessageController = TextEditingController();


  RoomStore(
      this.roomName,
  ):chatService = ChatService(roomName: roomName);

  Stream<List<ScrollingText>>listen() async*{
      var stream = chatService.receive();
      await for(var message in stream){
        final t = ScrollingText(
          text:  message.text,
          ratioOfBlankToScreen: Random().nextDouble(),
        );
        messages.add(t);
        yield messages;
      }
  }

  Stream<Message>listenSingle() {
    return chatService.receive();
  }

  void sendMessage() {
    final message = Message(roomName: roomName, text: inputMessageController.text);
    inputMessageController.clear();
    return chatService.send(message);
  }

}