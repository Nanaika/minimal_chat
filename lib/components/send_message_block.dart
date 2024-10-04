import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/chat_bloc.dart';
import 'custom_text_field.dart';

// class SendMessageBlock extends StatelessWidget {
//   const SendMessageBlock({
//     super.key,
//     required this.controller,
//     required this.receiverId,
//   });
//
//   final TextEditingController controller;
//   final String receiverId;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: CustomTextField(
//               maxLines: 5,
//               rightPadding: 0,
//               controller: controller,
//               hintText: 'message',
//               textInputType: TextInputType.text),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//           child: IconButton(
//             onPressed: () {
//               context.read<ChatBloc>().sendMessage(
//                 receiverId,
//                 controller.text,
//               );
//               controller.clear();
//             },
//             icon: Icon(
//               CupertinoIcons.arrow_up_circle_fill,
//               size: 40,
//               color: Theme.of(context).colorScheme.primary,
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }