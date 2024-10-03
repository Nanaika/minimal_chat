import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_chat_app/bloc/collection_type.dart';
import 'package:minimal_chat_app/components/constants.dart';
import 'package:minimal_chat_app/pages/main_page/search_user_page_view.dart';

import '../../bloc/auth_bloc.dart';
import '../../components/custom_app_bar.dart';
import '../../components/custom_drawer.dart';
import '../../components/custom_fab.dart';
import '../../components/utils.dart';
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
            const CustomAppBar(title: chatsText,),
            const SizedBox(
              height: 8,
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
