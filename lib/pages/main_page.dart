import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_chat_app/bloc/auth_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('In App'),
            ElevatedButton(onPressed: () {
              context.read<AuthBloc>().signOut();

            }, child: const Text('logout'))
          ],
        ),
      ),
    );
  }
}
