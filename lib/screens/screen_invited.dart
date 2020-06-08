import 'package:flutter/material.dart';
import 'package:invite_party/providers/invites.dart';
import 'package:provider/provider.dart';

class InvitedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title:
            Text("Sounds like a party!", style: TextStyle(color: Colors.white)),
      ),
      body: Consumer<Invites>(
        builder: (context, invites, child) => ListView.builder(
            itemCount: invites.invited.length,
            itemBuilder: (context, idx) {
              return ListTile(
                title: Text(invites.invited[idx].name),
                subtitle: Text(invites.invited[idx].email),
                trailing: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () => invites.remove(invites.invited[idx]),
                ),
              );
            }),
      ),
    );
  }
}
