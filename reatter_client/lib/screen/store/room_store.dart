import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reatter/api/chat_service.dart';
import 'package:reatter/component/scroll_text.dart';
import 'package:reatter/model/message.dart';

final GlobalKey roomScreenKey = GlobalKey();

final roomProvider = ChangeNotifierProvider((ref) => RoomStore());

class RoomStore extends ChangeNotifier {
  ChatService chatService;
  String _roomName;
  List<ScrollingText> _messages = [];
  TextEditingController inputMessageController = TextEditingController();

  // todo
  final bottomInputHeight = 60;
  final headerHeight = 80;

  RoomStore() : chatService = ChatService();

  @override
  void dispose() {
    inputMessageController.dispose();
    super.dispose();
  }

  void setRoomName(String name) {
    _roomName = name;
  }

  void reset() {
    _messages = [];
    _roomName = "";
    inputMessageController.text = "";
  }

  double getTop(double per) {
    if (roomScreenKey.currentContext == null) return 150;
    // sizeが変わって自動で位置が変更される
    //return (context.size.height - bottomInputHeight) * per;
    return per *
            (MediaQuery.of(roomScreenKey.currentContext).size.height -
                bottomInputHeight -
                headerHeight) +
        headerHeight;
  }

  get messages => _messages;
  get roomName => _roomName;

  Stream<List<ScrollingText>> listen() async* {
    try {
      var stream = chatService.receive(_roomName);

      await for (var message in stream) {
        final t = ScrollingText(
          text: message.text,
          top: getTop(message.top),
          speed: message.speed,
          textStyle: TextStyle(
            fontSize: 23 * message.size,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(
                message.colorR, message.colorG, message.colorB, 1),
          ),
        );
        _messages.add(t);
        yield _messages;
      }
    } catch (e) {
      print(e);
      if (roomScreenKey.currentContext != null) {
        if (Navigator.of(roomScreenKey.currentContext).canPop()) {
          reset();
          Navigator.of(roomScreenKey.currentContext).pop();
        }
      }
    }
  }

  void sendMessage(String roomName) {
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
