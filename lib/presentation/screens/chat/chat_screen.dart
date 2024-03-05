import 'package:flutter/material.dart';
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
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: 101,
                  itemBuilder: ((context, index) {
                    return (index % 2 == 0)
                        ? const HerMessageBubble()
                        : const MyMessageBubble();
                  }))),
          const Text("hola"),
          const Text("hola2"),
        ],
      ),
    ));
  }
}
