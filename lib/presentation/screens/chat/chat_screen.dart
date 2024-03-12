import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_chat/domain/entities/message.dart';
import 'package:yes_no_chat/presentation/providers/chat_provider.dart';
import 'package:yes_no_chat/presentation/shared/message_field_box.dart';
import 'package:yes_no_chat/presentation/widgets/her_message_bubble.dart';
import 'package:yes_no_chat/presentation/widgets/my_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(5),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://assets.vogue.com/photos/58dedeaaa6df677eb9f7df72/master/w_2240,c_limit/00-holding-scarlett-johansson-5-things.jpg'),
            ),
          ),
          title: const Text("My love <3"),
          centerTitle: false,
        ),
        body: const _ChatView());
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatProvider chatProvider = context.watch<ChatProvider>();
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: chatProvider.messageList.length,
                  itemBuilder: ((context, index) {
                    return (chatProvider.messageList[index].fromWho ==
                            FromWho.hers)
                        ? HerMessageBubble(
                            message: chatProvider.messageList[index].text,
                            imageUrl: chatProvider.messageList[index].imageURl,
                          )
                        : MyMessageBubble(
                            message: chatProvider.messageList[index].text);
                  }))),
          MessageFieldBox(
            onValue: (value) => chatProvider.sendMessage(value),
          )
        ],
      ),
    ));
  }
}
