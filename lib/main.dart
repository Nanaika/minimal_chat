import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_chat_app/bloc/auth_bloc.dart';
import 'package:minimal_chat_app/bloc/login_or_reg_bloc.dart';
import 'package:minimal_chat_app/pages/login_or_reg_page.dart';
import 'package:minimal_chat_app/theme/theme.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setLightSystemBars();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => LoginOrRegBloc()),
        BlocProvider(create: (ctx) => AuthBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '',
        theme: lightTheme,
        home: BlocBuilder<LoginOrRegBloc, bool>(
          builder: (BuildContext context, showLogin) {
            return LoginOrRegPage(
              showLogin: showLogin,
            );
          },
        ),
      ),
    );
  }
}
