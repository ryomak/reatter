import 'package:flutter/material.dart';
import 'package:reatter/component/constant.dart';
import 'package:reatter/component/scroll_text.dart';
import 'package:reatter/model/room.dart';
import 'package:reatter/screen/store/room_store.dart';
import 'dart:math';


class RoomScreen extends StatefulWidget {

  static String id = 'chat_screen';
  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<RoomScreen> {
  @override
  Widget build(BuildContext context) {
    final RoomArguments args = ModalRoute.of(context).settings.arguments;
    var store = RoomStore(args.name);


    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
        title: Text(args.name??"error"),
        backgroundColor: Colors.lightBlue.withOpacity(0.1),
      ),
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(child: MessagesStream(store)),
              Container(
                decoration: kMessageContainerDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: store.inputMessageController,
                        decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        store.sendMessage();
                      },
                      child: Text(
                        'Send',
                        style: kSendButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}

class MessagesStream extends StatefulWidget {

  RoomStore store;

  MessagesStream(this.store);

  @override
  _MessagesStreamState createState() => _MessagesStreamState();
}

class _MessagesStreamState extends State<MessagesStream> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
          stream: widget.store.listen(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return  Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.lightBlueAccent,
                  ),
              );
            }
            final messages = snapshot.data;
            return Stack(
              children: messages,
            );
          },
    );
  }
}

