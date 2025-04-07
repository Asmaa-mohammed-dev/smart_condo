import 'package:flutter/material.dart';
import 'package:smart_condo/features/personalization/screens/chats/chat_screen.dart';
// final _firestore = FirebaseFirestore.instance;
// late User yourEmailUser;

class ChatScreenYourEmail extends StatefulWidget {
  const ChatScreenYourEmail({super.key});
  static const String screenRoute = 'chat_screen_your_email';

  @override
  _ChatScreenYourEmailState createState() => _ChatScreenYourEmailState();
}

class _ChatScreenYourEmailState extends State<ChatScreenYourEmail> {
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
  //     final user = _auth.currentUser;
  //     if (user != null) {
  //       yourEmailUser = user;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                'images/man (1).png',
              ), // صورة المستخدم
            ),
            SizedBox(width: 10),
            Text('student@gmail.com'),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // MessageStreamBuilder(email: 'student@gmail.com'),
            Container(
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.green, width: 2)),
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
                        hintText: 'أكتب رسالتك هنا...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // messageTextController.clear();
                      // _firestore.collection('messages').add({
                      //   'text': messageText,
                      //   'sender': yourEmailUser.email,
                      //   'receiver': 'student@gmail.com',
                      //   'time': FieldValue.serverTimestamp(),
                      // });
                    },
                    child: Text(
                      'ارسال',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
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
    );
  }
}
