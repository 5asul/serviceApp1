// //-----------------------------------------------------------------------------------------

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:http/http.dart' as http;
import 'package:project_for_all/config/theme/colors_theme.dart';
import 'package:project_for_all/controller/firebase/provider/firebase_messaging_provider.dart';
import 'package:project_for_all/models/message_model.dart';
import 'package:project_for_all/models/requests_model.dart';
import 'package:project_for_all/models/users_model.dart';

class ChatWithWorkerScreen extends StatefulWidget {
  const ChatWithWorkerScreen({super.key});

  @override
  State<ChatWithWorkerScreen> createState() => _ChatWithWorkerScreenState();
}

class _ChatWithWorkerScreenState extends State<ChatWithWorkerScreen>
    {
  final List<types.Message> _messages = [];
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');
  bool translate_state = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: ColorsTheme().primary,
        centerTitle: true,
        title: Text(
          'Chat with Worker',
          style: TextStyle(color: ColorsTheme().white),
        ),
      ),
      body: Chat(
        messages: _messages,
        onSendPressed: _handleSendPressed,
        user: _user,
      ),
    );
  }

  void _handleSendPressed(types.PartialText message) async {
    try {
      translate_state = false;

      final textMessage = types.TextMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: 'id-${DateTime.now().millisecondsSinceEpoch}', // Unique ID
        text: message.text,
      );

      // * Add the message to the chat UI before sending to the API
      _addMessage(textMessage);
      print(textMessage.text);

      // * Send the message text to API endpoint
      final response = await http
          .post(
            Uri.parse('http://192.168.137.1:5000/chat'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({'query_text': textMessage.text}),
          )
          .timeout(Duration(minutes: 10));
      print('Sending message: ${textMessage.text}'); //....
      // * Handle the API response
      if (response.statusCode == 200) {
        // * API call successful, extract the response text
        final responseText = jsonDecode(response.body);
        translate_state = true;

        print("${responseText["result"]}");

        // print(responseText);
        // * Create a new TextMessage object for the response
        final responseMessage = types.TextMessage(
          author: const types.User(
              id: 'api_response'), // Unique ID for API response
          createdAt: DateTime.now().millisecondsSinceEpoch,
          id: 'id-${DateTime.now().millisecondsSinceEpoch}', // Unique ID
          text: responseText["result"],
        );

        // * Add the response message to the chat
        print(responseMessage);
        _addMessage(responseMessage);
      } else {
        // * Handle API error (e.g., display an error message to the user)
        print('API error: ${response.statusCode}');
      }
    } catch (e) {
      print('Connection reset by peer: $e');
    }
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }
}


// -----------------------------------------------------
class MessageScreen extends StatefulWidget {
  final RequestsModel? requestsModel;
  const MessageScreen({super.key, this.requestsModel});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  List<MessageModel> _list = [];

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Massage Screen '),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseMessagingProvider.getAllMessages(widget.requestsModel!),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return const Center(child: CircularProgressIndicator());
                  case ConnectionState.active:
                  case ConnectionState.done:
                    final data = snapshot.data!.docs;
                    _list = data
                            .map(
                              (e) => MessageModel.fromJson(e.data()),
                            )
                            .toList() ??
                        [];

                    if (_list.isNotEmpty) {
                      return ListView.builder(
                        padding: const EdgeInsets.all(8.0),
                        physics: const BouncingScrollPhysics(),
                        itemCount: _list.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(_list[index].message!),
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(child: Text('Say Hii! 🖐'));
                    }
                  // default:
                }
              },
            ),
          ),
          _chatInpot(),
        ],
      ),
    );
  }

  Widget _chatInpot() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.emoji_emotions,
                      color: Colors.blueAccent,
                      size: 25,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: const InputDecoration(
                          hintText: 'Type Something...',
                          hintStyle: TextStyle(color: Colors.blueAccent),
                          border: InputBorder.none),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.image,
                      color: Colors.blueAccent,
                      size: 26,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.blueAccent,
                      size: 26,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                ],
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              if (_textController.text.isNotEmpty) {
                FirebaseMessagingProvider.sendMessage(
                    widget.requestsModel!, _textController.text);
                _textController.text = '';
              }
            },
            minWidth: 0,
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 10),
            shape: const CircleBorder(),
            color: Colors.green,
            child: const Icon(Icons.send, color: Colors.white, size: 28),
          ),
        ],
      ),
    );
  }
}
