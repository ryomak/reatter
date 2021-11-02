import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reatter/screen/init_screen.dart';
import 'package:reatter/screen/room_screen.dart';

void main() => runApp(ProviderScope(child: Reatter()));

class Reatter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black54),
        ),
      ),
      */
      initialRoute: InitScreen.id,
      routes: {
        InitScreen.id: (context) => InitScreen(),
        RoomScreen.id: (context) => RoomScreen(),
      },
    );
  }
}
