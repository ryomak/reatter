
import 'package:flutter/cupertino.dart';
import 'package:reatter/model/message.dart';

class RoomArguments {
  final String name;

  RoomArguments(this.name);
}

class RoomData {
  String name;
  List<Message> messages;
  RoomData(this.messages, this.name);
}
