import 'dart:math';

import 'package:flutter/material.dart';
import 'package:reatter/api/chat_service.dart';
import 'package:reatter/component/scroll_text.dart';
import 'package:reatter/model/message.dart';
import 'package:reatter/screen/init_screen.dart';

class RoomStore extends ChangeNotifier {
  String roomName;
  ChatService chatService;
  List<ScrollingText> messages = [];
  TextEditingController inputMessageController = TextEditingController();

  // todo
  final bottomInputHeight = 60;
  final headerHeight = 80;

  RoomStore(
    this.roomName,
  ) : chatService = ChatService(roomName: roomName);

  @override
  void dispose() {
    inputMessageController.dispose();
    super.dispose();
  }

  double getTop(BuildContext context, double per) {
    if (context == null) return 150;
    // sizeが変わって自動で位置が変更される
    //return (context.size.height - bottomInputHeight) * per;
    return per *
            (MediaQuery.of(context).size.height -
                bottomInputHeight -
                headerHeight) +
        headerHeight;
  }

  Stream<List<ScrollingText>> listen(BuildContext context) async* {
    try {
      var stream = chatService.receive();

      await for (var message in stream) {
        final t = ScrollingText(
          text: message.text,
          top: getTop(context, message.top),
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
    } catch (e) {
      print(e);
      if (context != null) {
        Navigator.pushNamed(context, InitScreen.id);
      }
    }
  }

  void sendMessage() {
    if (inputMessageController.text == "") {
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
      top: Random().nextDouble(),
      colorR: Random().nextInt(255),
      colorG: Random().nextInt(255),
      colorB: Random().nextInt(255),
    );
    try {
      chatService.send(message);
      inputMessageController.clear();
    } catch (e) {
      print(e);
    }
  }
}
