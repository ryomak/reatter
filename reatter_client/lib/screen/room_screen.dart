import 'package:flutter/material.dart';
import 'package:reatter/model/room.dart';
import 'package:reatter/screen/init_screen.dart';
import 'package:reatter/screen/store/room_store.dart';
import '../app_theme.dart';



class RoomScreen extends StatefulWidget {

  static String id = 'chat_screen';
  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<RoomScreen> {
  @override
  Widget build(BuildContext context) {
    final RoomArguments args = ModalRoute.of(context).settings.arguments;
    if (args == null || args.name == "") {
      Navigator.pushNamed(context, InitScreen.id);
    }
    var store = RoomStore(args.name);

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          centerTitle: false,
          //title: Text(args.name??"error"),
          title: Row(
            children: [
              CircleAvatar(
                radius:26,
                backgroundColor: Colors.black38,
                child: (args.name == "default")?
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                    child: Hero(
                        tag: 'logo',
                        child: Image.asset('images/top.png')
                    )
                ):
                Text(
                  args.name?.substring(0,1)??"error",
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child:Text(
                  (args.name == "default")?"OPEN CHANNEL": args.name??"error",
                  style: MyTheme.chatSenderName,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          backgroundColor: MyTheme.kPrimaryColor,
          elevation: 0,

        ),
        backgroundColor: MyTheme.kPrimaryColor,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                      child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              spreadRadius: 1.0,
                              blurRadius: 20.0,
                              offset: Offset(10, 10),
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                      ),
                      child:ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          child: MessagesStream(store)
                      ),
                    ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.white,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    margin: EdgeInsets.only(bottom: 24),
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child:Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: store.inputMessageController,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.grey[500]),
                              hintText: 'Type your message ...',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                             store.sendMessage();
                          },
                          child: Icon(
                            Icons.send_sharp,
                            size: 28,
                            color: MyTheme.kPrimaryColor,
                          )
                        ),
                      ],
                    ),
                )
              ),
            ],
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
          stream: widget.store.listen(context),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return  Center(
                  child: CircularProgressIndicator(
                    backgroundColor: MyTheme.kPrimaryColor,
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

