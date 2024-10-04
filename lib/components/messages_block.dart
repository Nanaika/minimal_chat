import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../bloc/model/message.dart';
import 'constants.dart';

class MessagesBlock extends StatelessWidget {
  const MessagesBlock({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot;

  @override
  Widget build(BuildContext context) {
    print('SNAPSHOT FROM MESSAGES ------------------------  ${snapshot.data!.docs.length}');
    return Expanded(
      child: ListView.builder(
          reverse: true,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (ctx, index) {
            final date = (snapshot.data!.docs[index]
                .data()[MessageFields.timestamp.name] as Timestamp)
                .toDate();
            String customDate =
            DateFormat('dd MMMM yyyy, hh:mm:ss').format(date);

            bool isCurrentUser = snapshot.data!.docs[index]
                .data()[MessageFields.senderId.name] ==
                FirebaseAuth.instance.currentUser!.uid;
            final messageData = snapshot.data!.docs[index].data();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPaddingH),
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
                            : Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(defBorderRadius),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: isCurrentUser
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            Text(
                              messageData[MessageFields.message.name],
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
  }
}