import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_chat_app/bloc/collection_type.dart';
import 'package:minimal_chat_app/bloc/model/user.dart';
import 'package:minimal_chat_app/components/constants.dart';

class AuthBloc extends Cubit<AuthState> {
  AuthBloc() : super(AuthLoading()) {
    if (FirebaseAuth.instance.currentUser != null) {
      emit(AuthSuccess());
    } else {
      emit(AuthLogout());
    }
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> signInWithEmailPass(String email, pass) async {
    emit(AuthLoading());
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: pass);
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthError(message: e.message ?? noErrorMessageText));
    }
  }

  Future<void> registerWithEmailAndPass(String email, String pass) async {
    emit(AuthLoading());
    try {
      final credentials = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: pass);
      final user = ChatUser(credentials.user!.email!, credentials.user!.uid);
      await _firebaseFirestore.collection(CollectionType.users.name).add(user.toJson());
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthError(message: e.message ?? noErrorMessageText));
    }
  }

  Future<void> signOut() async {
    emit(AuthLoading());
    await _firebaseAuth.signOut();
    emit(AuthLogout());
  }
}

sealed class AuthState {}

class AuthSuccess extends AuthState {}

class AuthLogout extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}
