import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_chat_app/components/constants.dart';
import 'package:minimal_chat_app/pages/main_page/search_user_page_view.dart';

import '../../bloc/auth_bloc.dart';
import '../../bloc/chat_bloc.dart';
import '../../components/custom_app_bar.dart';
import '../../components/custom_drawer.dart';
import '../../components/custom_fab.dart';
import '../../components/user_tile.dart';
import '../../components/utils.dart';
import '../chat_page.dart';
import '../settings_page.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({
    super.key,
  });

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

final TextEditingController searchController = TextEditingController();

class _MainPageViewState extends State<MainPageView> {
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
      floatingActionButton: CustomFab(
        onPress: () {
          Navigator.of(context).push(
            createRoute(
              const SearchUserPageView(),
            ),
          );
        },
      ),
      body: Column(
        children: [
          const SafeArea(
            bottom: false,
            child: CustomAppBar(
              showActions: false,
              title: chatsText,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          StreamBuilder(
              stream: context.read<ChatBloc>().getChatRooms(),
              builder: (ctx, state) {
                if (state.connectionState == ConnectionState.waiting) {
                  return Expanded(
                    child: Center(
                      child: CupertinoActivityIndicator(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  );
                }
                return Expanded(
                  child: ListView.separated(
                      itemCount: state.data!.docs.length,
                      itemBuilder: (ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: defaultPaddingH),
                          child: UserTile(
                            email:
                                state.data!.docs[index].data()['receiverEmail'],
                            onPress: () {
                              Navigator.of(context).push(
                                createRoute(
                                  ChatPage(
                                    receiverEmail: state.data!.docs[index]
                                        .data()['receiverEmail']
                                        .toString(),
                                    receiverId: state.data!.docs[index]
                                        .data()['receiverId']
                                        .toString(),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }, separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 4,);
                  },),
                );
              }),
        ],
      ),
    );
  }
}
