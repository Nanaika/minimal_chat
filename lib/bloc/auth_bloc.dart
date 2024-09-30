import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Cubit<AuthState> {
  AuthBloc() : super(AuthIdle());
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> signInWithEmailPass(String email, pass) async {
    try {
      final credentials = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: pass);
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthError(message: e.message!));
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    emit(AuthLogout());
  }
}

sealed class AuthState {}

class AuthSuccess extends AuthState {}

class AuthLogout extends AuthState {}

class AuthUserNotExist extends AuthState {}

class AuthPassIncorrect extends AuthState {}

class AuthLoading extends AuthState {}

class AuthIdle extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}
