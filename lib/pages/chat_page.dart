import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:minimal_chat_app/bloc/chat_bloc.dart';
import 'package:minimal_chat_app/bloc/model/message.dart';
import 'package:minimal_chat_app/components/constants.dart';
import 'package:minimal_chat_app/components/custom_app_bar.dart';
import 'package:minimal_chat_app/components/custom_text_field.dart';

import '../components/loading_block.dart';

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
        child: Column(
          children: [
            CustomAppBar(
              title: widget.receiverEmail,
              icon: CupertinoIcons.chevron_back,
              onLeadingPress: () {
                Navigator.of(context).pop();
              },
              showActions: false,
            ),
            StreamBuilder(
              stream: context.read<ChatBloc>().getMessages(
                  FirebaseAuth.instance.currentUser!.uid, widget.receiverId),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingBlock();
                }
                return Expanded(
                  child: ListView.builder(
                      reverse: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (ctx, index) {
                        final date = (snapshot.data!.docs[index]
                                    .data()[MessageFields.timestamp.name]
                                as Timestamp)
                            .toDate();
                        String customDate =
                            DateFormat('dd MMMM yyyy, hh:mm:ss').format(date);

                        bool isCurrentUser = snapshot.data!.docs[index]
                                .data()[MessageFields.senderId.name] ==
                            FirebaseAuth.instance.currentUser!.uid;
                        final messageData = snapshot.data!.docs[index].data();
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPaddingH),
                          child: Row(
                            mainAxisAlignment: isCurrentUser
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Container(
                                  margin: EdgeInsets.only(
                                      bottom: 2,
                                      right: isCurrentUser ? 0 : 50,
                                      left: isCurrentUser ? 50 : 0),
                                  decoration: BoxDecoration(
                                    color: isCurrentUser
                                        ? Colors.green
                                        : Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                    borderRadius:
                                        BorderRadius.circular(defBorderRadius),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment: isCurrentUser
                                          ? CrossAxisAlignment.end
                                          : CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          messageData[
                                              MessageFields.message.name],
                                          textAlign: isCurrentUser
                                              ? TextAlign.right
                                              : TextAlign.left,
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .inversePrimary,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          customDate,
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .inversePrimary,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                      hintText: 'message',
                      textInputType: TextInputType.text),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: IconButton(
                    onPressed: () {
                      context.read<ChatBloc>().sendMessage(
                            widget.receiverEmail,
                            widget.receiverId,
                            controller.text,
                          );
                      controller.clear();
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
