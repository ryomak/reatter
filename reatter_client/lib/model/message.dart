import 'package:flutter/material.dart';

/// Message is class defining message data (id and text)
class Message {
  /// id is unique ID of message
  final String id;

  final String roomName ;

  /// text is content of message
  final String text;

  /// Class constructor
  Message({String id, @required String roomName,@required String text})
      : this.id = id ?? UniqueKey().toString(),
        this.roomName = roomName,
        this.text = text;
}