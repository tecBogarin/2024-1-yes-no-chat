import 'package:flutter/material.dart';
import 'package:yes_no_chat/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'hola mi vida', fromWho: FromWho.me),
    Message(text: 'Saca para los tacos!!!!', fromWho: FromWho.me),
    Message(
        text: 'nel pastel me debes una feria codo',
        fromWho: FromWho.hers,
        imageURl:
            "https://yesno.wtf/assets/no/14-cb78bf7104f848794808d61b9cd83eba.gif"),
    Message(
        text: 'pero te pongo las cocas',
        fromWho: FromWho.hers,
        imageURl:
            "https://yesno.wtf/assets/no/14-cb78bf7104f848794808d61b9cd83eba.gif"),
    Message(text: 'pero tu aflojas para la gasolina?', fromWho: FromWho.me),
    Message(
        text: 'no bb!',
        fromWho: FromWho.hers,
        imageURl:
            'https://yesno.wtf/assets/no/13-755222c98795431aa2e7d453ab1e75a1.gif'),
  ];

  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
    notifyListeners();
  }
}
