import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:reatter/app_theme.dart';
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
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.kAccentColorVariant,
      body: Padding(
        padding: EdgeInsets.only(top: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Hero(
                        tag: 'logo',
                        child: Container(
                          child:  Image.asset(
                            'images/top.png',
                          ),
                          height: 60.0,
                        ),
                      ),
                      AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'Reatter',
                              textStyle: TextStyle(
                                fontSize: 45.0,
                                fontWeight: FontWeight.w900,
                              ),
                              speed: const Duration(milliseconds: 200),
                            ),
                          ]
                      )
                    ],
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                ],
              ),
            ),
             Container(
                padding: EdgeInsets.symmetric(vertical: 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 1.0,
                      blurRadius: 10.0,
                      offset: Offset(10, 10),
                    ),
                  ],
                ),
                 child:ClipRRect(
                   borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(30),
                     topRight: Radius.circular(30),
                   ),
                   child: Column(
                     children: [
                       PrivateRoomJoinButton(),
                       RoundedButton(
                           title: "OPEN CHANNEL",
                           color: MyTheme.kPrimaryColor,
                           onPressed: () {
                             Navigator.pushNamed(
                               context,
                               RoomScreen.id,
                               arguments: RoomArguments("default"),
                             );
                           }
                       ),
                     ],
                 ),
               ),
            )
          ],
        ),
      ),
    );
  }
}

class PrivateRoomJoinButton extends StatefulWidget {

  @override
  _PrivateRoomJoinButtonState createState() => _PrivateRoomJoinButtonState();
}
class _PrivateRoomJoinButtonState extends State<PrivateRoomJoinButton> {

  final messageTextController = TextEditingController();

  @override
  void dispose() {
    messageTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 48,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                        ),
                      ),
                      child:TextField(
                          controller: messageTextController,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                                color: Colors.grey[500],
                            ),
                            hintText: 'PRIVATE CHANNEL',
                            border: InputBorder.none,
                          ),
                        ),

                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    elevation: 5.0,
                    color: MyTheme.kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        if (messageTextController.text == "") {
                          return;
                        }
                        Navigator.pushNamed(
                          context,
                          RoomScreen.id,
                          arguments: RoomArguments(messageTextController.text),
                        );
                        messageTextController.clear();
                      },
                      height: 48,
                      child: Text(
                        "JOIN",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
    );
  }

}

class RightButton extends StatelessWidget {
  const RightButton({
    this.title, this.color, @required this.onPressed
  });

  final Color color;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}