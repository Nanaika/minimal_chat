import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_chat_app/bloc/login_or_reg_bloc.dart';
import 'package:minimal_chat_app/pages/login_or_reg_page.dart';
import 'package:minimal_chat_app/pages/main_page.dart';

class AuthGates extends StatelessWidget {
  const AuthGates({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, state) {
          if (state.hasData) {
            return const MainPage();
          } else {
            return BlocBuilder<LoginOrRegBloc, bool>(
              builder: (BuildContext context, showLogin) {
                return LoginOrRegPage(showLogin: showLogin);
              },
            );
          }
        });
  }
}
