import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_chat_app/bloc/collection_type.dart';

import 'model/user.dart';

const options = GetOptions(source: Source.server);

class SearchUserBloc extends Cubit<ChatStatus> {
  SearchUserBloc() : super(InitStatus());

  final _fireStore = FirebaseFirestore.instance;

  ChatStatus chatStatus = InitStatus();

  void setState(ChatStatus status) {
    chatStatus = status;
    emit(chatStatus);
  }

  Future<void> searchUser(String text) async {
    late final QuerySnapshot<Map<String, dynamic>> snapshot;
    try {
      snapshot = await _fireStore
          .collection(CollectionType.users.name)
          .where(UserFields.email.name, isEqualTo: text)
          .get(options);
      if (snapshot.docs.isEmpty) {
        emit(NoUserFound());
      } else {
        emit(
          UserSearchSuccess(
            snapshot.docs.first.data(),
          ),
        );
      }
    } on FirebaseException catch (e) {
      emit(ChatError(e.message!));
    } catch (e) {
      emit(ChatError(e.toString()));
    }

    // try {
    //   QuerySnapshot querySnapshot = await _fireStore
    //       .collection('test')
    //       .get(const GetOptions(source: Source.server));  // Принудительно запрос с сервера
    //
    //   if (querySnapshot.docs.isEmpty) {
    //     print('No documents found.');
    //   } else {
    //     print('Data: ${querySnapshot.docs}');
    //   }
    // } on FirebaseException catch (e) {
    //   if (e.code == 'unavailable') {
    //     print('!!--------------------------No internet connection or Firestore service is unavailable.');
    //   } else {
    //     print('Firestore error: $e');
    //   }
    // } catch (e) {
    //   print('General error: $e');
    // }

    // try {
    //   await _fireStore.runTransaction((transaction) async {
    //     // Выполняем запрос внутри транзакции
    //     DocumentSnapshot snapshot = await transaction.get(_fireStore.collection('test').doc('someDocument'));
    //
    //
    //
    //     // Обработка данных
    //     if (snapshot.exists) {
    //       print('Document data: ${snapshot.data()}');
    //     } else {
    //       print('No document found.');
    //     }
    //   });
    // } on FirebaseException catch (e) {
    //   if (e.code == 'unavailable') {
    //     print('!!!!----------------------  ${e.message} code ----${e.code}');
    //   } else {
    //     print('Firestore error: $e');
    //   }
    // } catch (e) {
    //   print('General error: $e');
    // }
  }
}

sealed class ChatStatus {}

class InitStatus extends ChatStatus {}

class ChatError extends ChatStatus {
  final String message;

  ChatError(this.message);
}

class UserSearchSuccess extends ChatStatus {
  final Map<String, dynamic> data;

  UserSearchSuccess(this.data);
}

class NoUserFound extends ChatStatus {}
