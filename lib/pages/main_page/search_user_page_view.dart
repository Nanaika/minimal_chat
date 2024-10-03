import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_chat_app/bloc/model/user.dart';
import 'package:minimal_chat_app/bloc/search_user_bloc.dart';
import 'package:minimal_chat_app/components/custom_search_field.dart';
import 'package:minimal_chat_app/components/user_tile.dart';

import '../../bloc/auth_bloc.dart';
import '../../components/constants.dart';
import '../../components/custom_app_bar.dart';
import '../../components/custom_drawer.dart';
import '../../components/utils.dart';
import '../chat_page.dart';
import '../settings_page.dart';

class SearchUserPageView extends StatefulWidget {
  const SearchUserPageView({
    super.key,
  });

  @override
  State<SearchUserPageView> createState() => _SearchUserPageViewState();
}

final TextEditingController searchController = TextEditingController();

class _SearchUserPageViewState extends State<SearchUserPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(
          onHomePress: () {},
          onSettingsPress: () {
            Navigator.of(context).push(
              createRoute(
                const SettingsPage(),
              ),
            );
          },
          onLogOutPress: () {
            context.read<AuthBloc>().signOut();
          },
        ),
        body: Column(
          children: [
            CustomAppBar(
              showActions: false,
              title: searchText.replaceRange(
                0,
                1,
                searchText[0].toUpperCase(),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            CustomSearchField(
                onSubmitted: (text) {
                  if (text.isNotEmpty) {
                    context.read<SearchUserBloc>().searchUser(text);
                  }
                },
                controller: searchController,
                hintText: '$searchText $userText',
                textInputType: TextInputType.emailAddress),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: BlocBuilder<SearchUserBloc, ChatStatus>(
                builder: (BuildContext context, ChatStatus status) {
                  switch (status) {
                    case InitStatus():
                      {
                        return CupertinoActivityIndicator(
                          color: Theme.of(context).colorScheme.primary,
                        );
                      }
                    case ChatError():
                      {
                        return Center(
                            child: Text(
                          status.message,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                        ));
                      }
                    case UserSearchSuccess():
                      {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPaddingH),
                          child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (ctx, index) {
                                return UserTile(
                                  email: status.data[UserFields.email.name],
                                  onPress: () {
                                    Navigator.of(context).push(
                                      createRoute(
                                        ChatPage(
                                          receiverEmail: status
                                              .data[UserFields.email.name]
                                              .toString(),
                                          receiverId: status
                                              .data[UserFields.uid.name]
                                              .toString(),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }),
                        );
                      }
                    case NoUserFound():
                      {
                        return Center(
                            child: Text(
                          'User not found',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                        ));
                      }
                  }
                },
              ),
            ),
          ],
        )
        // StreamBuilder(
        //     stream: context.read<ChatBloc>().test(),
        //     builder: (ctx, snapshots) {
        //       print('ENTERE BUILDER---------------------------');
        //
        //       if(snapshots.data!.metadata.isFromCache) {
        //           print('NOINTERNET --------------------');
        //       } else {
        //         print('INTERNET --------------------');
        //       }
        //
        //       if (snapshots.hasError) {
        //
        //         return Text('ERROR -- ${snapshots.error.toString()}');
        //       }
        //       if (!snapshots.hasData) {
        //         return Text('NO data');
        //       }
        //       if (snapshots.connectionState == ConnectionState.waiting) {
        //         return Text('loading ...');
        //       }
        //       print('LENGTH ----------------------  ${snapshots.data!.docs.length}');
        //       return ListView.builder(
        //           itemCount: snapshots.data!.docs.length,
        //           itemBuilder: (ctx, index) {
        //             return ListTile(
        //               // title: Text(snapshots.data!.docs[index].get('user')),
        //               title: Text('wwwwццццццццццццццццццццццццццццц'),
        //             );
        //           });
        //     }),
        );
  }
}
