import 'package:flutter/material.dart';

/// Message is class defining message data (id and text)
class Message {
  /// id is unique ID of message
  final String id;

  final String roomName;

  /// text is content of message
  final String text;
  final double speed;
  final double size;
  final double top;
  final int colorR;
  final int colorG;
  final int colorB;

  /// Class constructor
  Message({
    String id,
    @required String roomName,
    @required String text,
    @required double speed,
    @required double size,
    @required double top,
    @required int colorR,
    @required int colorG,
    @required int colorB,
  })  : this.id = id ?? UniqueKey().toString(),
        this.roomName = roomName,
        this.speed = speed,
        this.size = size,
        this.top = top,
        this.colorR = colorR,
        this.colorG = colorG,
        this.colorB = colorB,
        this.text = text;
}
