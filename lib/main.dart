import 'package:flutter/material.dart';
import 'package:invite_party/providers/invites.dart';
import 'package:invite_party/screens/screen_invited.dart';
import 'package:provider/provider.dart';

import 'models/friend.dart';

void main() => runApp(
    ChangeNotifierProvider(create: (context) => Invites(), child: MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {"invited": (context) => InvitedScreen()},
        home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  final List<Friend> friends = [
    Friend("Mary", "asdasd@as.com"),
    Friend("Olse", "dsds@as.com"),
    Friend("Morek", "werwer@as.com"),
    Friend("Asdd", "asd@as.com"),
    Friend("Lsdna", "sdfs@as.com"),
    Friend("Uasd", "werw@as.com"),
    Friend("Ndasd", "yrty@as.com"),
    Friend("Rasd", "yiu@as.com"),
    Friend("PASD", "kh@as.com"),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final invites = Provider.of<Invites>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My awesome friend'),
      ),
      body: ListView.builder(
          itemCount: friends.length,
          itemBuilder: (context, idx) {
            return ListTile(
                title: Text(friends[idx].name),
                subtitle: Text(friends[idx].email),
                onTap: () => invites.add(friends[idx]));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed("invited"),
        tooltip: 'Invite',
        child: Text("${invites.numberOfFriendsInvited()}"),
      ),
    );
  }
}
