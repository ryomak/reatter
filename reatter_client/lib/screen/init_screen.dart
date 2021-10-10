import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:reatter/component/constant.dart';
import 'package:reatter/model/room.dart';
import 'package:reatter/component/rounded_button.dart';
import 'package:reatter/screen/room_screen.dart';

class InitScreen extends StatefulWidget {

  static String id = 'init_screen';

  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen>
    with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(seconds: 3),
        vsync: this
    );

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);


    controller.forward();

    controller.addListener((){
      setState(() {});
      //print(animation.value);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: null,
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text : ['Reatter'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                title: "All Channel",
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RoomScreen.id,
                    arguments: RoomArguments("default"),
                  );
                }
            ),
            Text(
              "Private Channel"
            ),
            RoomJoinButton(),
          ],
        ),
      ),
    );
  }
}

class RoomJoinButton extends StatefulWidget {

  @override
  _RoomJoinButtonState createState() => _RoomJoinButtonState();
}
class _RoomJoinButtonState extends State<RoomJoinButton> {

  final messageTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String messageText;
    return  Column(
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: messageTextController,
                    onChanged: (value) {
                      messageText = value;
                    },
                    decoration: kMessageTextFieldDecoration,
                  ),
                ),
              ],
            ),
          ),
          RoundedButton(
              title: "JOIN",
              color: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RoomScreen.id,
                  arguments: RoomArguments(messageText),
                );
              }),
        ],
    );
  }

}