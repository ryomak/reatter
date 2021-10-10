import 'package:flutter/material.dart';

/// Message is class defining message data (id and text)
class Message {
  /// id is unique ID of message
  final String id;

  final String roomName ;

  /// text is content of message
  final String text;
  final double speed;
  final double size;
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
    @required int colorR,
    @required int colorG,
    @required int colorB,
  })
      : this.id = id ?? UniqueKey().toString(),
        this.roomName = roomName,
        this.speed = speed,
        this.size = size,
        this.colorR = colorR,
        this.colorG = colorG,
        this.colorB = colorB,
        this.text = text;
}