import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_condo/common/custom_shape/app_bar/app_bar.dart';
import 'package:smart_condo/utils/constants/colors.dart';

final _firestore = FirebaseFirestore.instance;
late User signedInUser;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String? messgaeText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    final user = _auth.currentUser;
    if (user != null) {
      signedInUser = user;
      print(signedInUser.email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: NAppBar(
          title: Text(
            'دردشة',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'MAJALLA',
              fontSize: 25,
            ),
          ),
          showBackArrow: true,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MessageStreamBuilder(),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: NColors.buttonPrimary, width: 2),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: messageTextController,
                        onChanged: (value) {
                          messgaeText = value;
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          hintText: 'أكتب رسالتك هنا .......',
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        style: TextStyle(
                          fontSize: 23, // تغيير حجم الخط هنا
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        messageTextController.clear();
                        _firestore.collection('messages').add({
                          'text': messgaeText,
                          'sender': signedInUser.email,
                          'time': FieldValue.serverTimestamp(),
                        });
                      },
                      child: Text(
                        'ارسل',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'MAJALLA',
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessageStreamBuilder extends StatelessWidget {
  const MessageStreamBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('messages').orderBy('time').snapshots(),
        builder: (context, snapshot) {
          List<MessageLine> messageWidgets = [];

          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: NColors.primary,
              ),
            );
          }
          if (snapshot.hasData) {
            final messages = snapshot.data!.docs.reversed;
            for (var message in messages) {
              final messageText = message['text'];
              final messageSender = message['sender'];
              final currentUser = signedInUser.email;

              final messageWidget = MessageLine(
                sender: messageSender,
                text: messageText,
                isMe: currentUser == messageSender,
              );
              messageWidgets.add(messageWidget);
            }
          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              children: messageWidgets,
            ),
          );
        });
  }
}

class MessageLine extends StatelessWidget {
  const MessageLine({super.key, this.sender, this.text, required this.isMe});
  final String? sender;
  final String? text;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text('$sender',
              style: TextStyle(
                  fontSize: 13, fontFamily: 'MAJALLA', color: Colors.black45)),
          Material(
            elevation: 5,
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30))
                : BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30)),
            color: isMe ? NColors.primary : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text('$text',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'MAJALLA',
                      color: isMe ? Colors.white : Colors.black)),
            ),
          ),
        ],
      ),
    );
  }
}
