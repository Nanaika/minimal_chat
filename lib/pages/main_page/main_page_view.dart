import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_chat_app/bloc/chat_bloc.dart';

import '../../bloc/auth_bloc.dart';
import '../../components/custom_drawer.dart';
import '../../components/utils.dart';
import '../settings_page.dart';

class MainPageView extends StatelessWidget {
  const MainPageView({
    super.key,
  });

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
      body: Center(
        child: TextButton(onPressed: () {
          context.read<ChatBloc>().test();
        }, child: Text('test')),
      ),
    );
  }
}
