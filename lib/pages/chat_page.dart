import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_chat_app/bloc/chat_bloc.dart';
import 'package:minimal_chat_app/bloc/model/message.dart';
import 'package:minimal_chat_app/components/custom_text_field.dart';

class ChatPage extends StatefulWidget {
  const ChatPage(
      {super.key, required this.receiverEmail, required this.receiverId});

  final String receiverEmail;
  final String receiverId;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            StreamBuilder(
              stream: context.read<ChatBloc>().getMessages(
                  FirebaseAuth.instance.currentUser!.uid, widget.receiverId),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (ctx, index) {
                        final messageData = snapshot.data!.docs[index].data();
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(messageData[MessageFields.message.name]),
                        );
                      }),
                );
              },
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                      maxLines: 5,
                      rightPadding: 0,
                      controller: controller,
                      hintText: 'hintText',
                      textInputType: TextInputType.text),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: IconButton(
                    onPressed: () {
                      context.read<ChatBloc>().sendMessage(
                            widget.receiverId,
                            controller.text,
                          );
                    },
                    icon: Icon(
                      CupertinoIcons.arrow_up_circle_fill,
                      size: 40,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
