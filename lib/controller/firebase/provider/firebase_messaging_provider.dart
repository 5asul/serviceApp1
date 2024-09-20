import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_for_all/models/message_model.dart';
import 'package:project_for_all/models/requests_model.dart';
import 'package:project_for_all/models/users_model.dart';

class FirebaseMessagingProvider with ChangeNotifier {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  // static FirebaseStorage storage = FirebaseStorage.instance;

  static late UserModel me;

  static User get user => auth.currentUser!;

  // useful for getting conversation id

  static String getConversationID(String id) => user.uid.hashCode <= id.hashCode
      ? '${user.uid}_$id'
      : '${id}_${user.uid}';

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessages(
      RequestsModel requestsModel) {
    return firestore
        .collection('requests')
        .doc(requestsModel.docid)
        .collection(
            'chats/${getConversationID(requestsModel.requestId!)}/messages/')
        .snapshots();
  }

  // static Stream<QuerySnapshot<Map<String, dynamic>>> getAllChats() {
  //   return firestore.collection('chats').snapshots();
  // }

  // static Stream<List<UserModel>> getAllChats2(UserModel user) {
  //   return firestore
  //       .collection('requests/chats/${getConversationID(user.firebaseUid!)}')
  //       .snapshots()
  //       .map((snapshot) {
  //     return snapshot.docs.map((doc) {
  //       return UserModel.fromJson(
  //         doc.data(),
  //         doc.id,
  //       );
  //     }).toList();
  //   });
  //   ;
  // }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsers() {
    return firestore.collection('users').snapshots();
  }

  static Future<void> sendMessage(
      RequestsModel requestsModel, String msg) async {
    //message sending time (also used as id)
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    // message to send
    final MessageModel message = MessageModel(
      type: 'text',
      chatId: getConversationID(requestsModel.requestId!),
      message: msg,
      receiverId: requestsModel.requestId,
      senderId: user.uid,
      timestamp: time,
    );

    final ref = firestore
        .collection('requests')
        .doc(requestsModel.docid)
        .collection(
            'chats/${getConversationID(requestsModel.requestId!)}/messages/');
    await ref.doc(time).set(message.toJson());
  }
}
