import 'package:flutter/material.dart';
import 'package:yes_no_chat/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Homa mi vida', fromWho: FromWho.me),
    Message(text: 'Saca para los tacos!!!!', fromWho: FromWho.me),
    Message(text: 'nel pastel me debes una feria codo', fromWho: FromWho.hers),
    Message(text: 'pero te pongo las cocas', fromWho: FromWho.hers)
  ];
}
