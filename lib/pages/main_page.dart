import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_chat_app/bloc/auth_bloc.dart';
import 'package:minimal_chat_app/components/constants.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              CustomHeader(),
              SizedBox(
                height: 24,
              ),
              Column(
                children: [
                  ListTile(
                    title: Text(
                      'HOME',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    leading: Padding(
                      padding: const EdgeInsets.only(left: defaultPaddingH),
                      child: Icon(
                        CupertinoIcons.house_alt_fill,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text(
                      'SETTINGS',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    leading: Padding(
                      padding: const EdgeInsets.only(left: defaultPaddingH),
                      child: Icon(
                        CupertinoIcons.gear_alt_fill,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    onTap: () {},
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text(
                            'LOG OUT',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          leading: Padding(
                            padding:
                                const EdgeInsets.only(left: defaultPaddingH),
                            child: Icon(
                              CupertinoIcons.square_arrow_left_fill,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('In App'),
            ElevatedButton(
                onPressed: () {
                  context.read<AuthBloc>().signOut();
                },
                child: const Text('logout'))
          ],
        ),
      ),
    );
  }
}

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 15,
                    bottom: MediaQuery.of(context).size.height / 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Theme.of(context).colorScheme.surface,
                        child: Icon(
                          appIcon,
                          color: Theme.of(context).colorScheme.primary,
                          size: 50,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: Theme.of(context).colorScheme.primary,
              )
            ],
          )
        : const SizedBox.shrink();
  }
}
