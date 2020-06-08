import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:invite_party/models/friend.dart';

class Invites extends ChangeNotifier {
  final List<Friend> _invited = [];

  UnmodifiableListView<Friend> get invited => UnmodifiableListView(_invited);

  numberOfFriendsInvited() => _invited.length;

  void add(Friend friend) {
    _invited.add(friend);

    notifyListeners();
  }

  void remove(Friend friend) {
    _invited.remove(friend);

    notifyListeners();
  }
}
