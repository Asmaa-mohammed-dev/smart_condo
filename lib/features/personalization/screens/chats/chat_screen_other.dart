import 'package:flutter/material.dart';
import 'package:smart_condo/features/personalization/screens/chats/chat_screen.dart';

// final _firestore = FirebaseFirestore.instance;
// User? signedInUser;

class ChatScreenOther extends StatefulWidget {
  final String otherUserEmail; // استقبال البريد الإلكتروني للطرف الآخر

  const ChatScreenOther({required this.otherUserEmail, super.key});

  @override
  State<ChatScreenOther> createState() => _ChatScreenOtherState();
}

class _ChatScreenOtherState extends State<ChatScreenOther> {
  final messageTextController = TextEditingController();
  // final _auth = FirebaseAuth.instance;
  String? messageText;

  // @override
  // void initState() {
  //   super.initState();
  //   getCurrentUser();
  // }

  // void getCurrentUser() {
  //   try {
  //     final user = 'elfeel';
  //     if (user != null) {
  //       signedInUser = user;
  //       print(signedInUser?.email);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('دردشة مع ${widget.otherUserEmail}'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                // _auth.signOut();
                Navigator.pop(context);
              },
              icon: Icon(Icons.close),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // MessageStreamBuilder(
              //   email: widget.otherUserEmail, // تمرير بريد الطرف الآخر
              // ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.green, width: 2),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: messageTextController,
                        onChanged: (value) {
                          messageText = value;
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          hintText: 'أكتب رسالتك هنا',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // messageTextController.clear();
                        // _firestore.collection('messages').add({
                        //   'text': messageText,
                        //   'sender': signedInUser?.email,
                        //   'receiver':
                        //       'student@gmail.com', // تمرير البريد الإلكتروني للطرف الآخر
                        //   // 'time': FieldValue.serverTimestamp(),
                        // });
                      },
                      child: Text(
                        'ارسال',
                        style: TextStyle(color: Colors.green),
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
