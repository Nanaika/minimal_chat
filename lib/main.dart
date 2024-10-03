import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_chat_app/bloc/auth_bloc.dart';
import 'package:minimal_chat_app/bloc/chat_bloc.dart';
import 'package:minimal_chat_app/bloc/search_user_bloc.dart';
import 'package:minimal_chat_app/bloc/login_or_reg_bloc.dart';
import 'package:minimal_chat_app/bloc/theme_bloc.dart';
import 'package:minimal_chat_app/components/constants.dart';
import 'package:minimal_chat_app/pages/auth_gates.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final sp = await SharedPreferences.getInstance();
  final isDark = sp.getBool(spIsDarkKey) ?? false;

  runApp(MyApp(isDark: isDark,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isDark});

  final bool isDark;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => LoginOrRegBloc()),
        BlocProvider(create: (ctx) => AuthBloc()),
        BlocProvider(create: (ctx) => ThemeBloc(isDark)),
        BlocProvider(create: (ctx) => SearchUserBloc()),
        BlocProvider(create: (ctx) => ChatBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (BuildContext context, theme) { return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: '',
          theme: theme,
          home: const AuthGates(),
        ); },

      ),
    );
  }
}
