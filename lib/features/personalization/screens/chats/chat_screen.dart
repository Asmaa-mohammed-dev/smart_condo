import 'package:flutter/material.dart';
import 'package:smart_condo/utils/constants/colors.dart';
import 'package:smart_condo/utils/constants/image_strings.dart';

// final _firestore = FirebaseFirestore.instance;
// User? signedInUser; // تغيير إلى نوع اختياري

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
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
    //       signedInUser = user;
    //       print(signedInUser
    //           ?.email); // استخدام signedInUser? بدلاً من signedInUser مباشرة
    //     }
    //   } catch (e) {
    //     print(e);
    //   }
    // }

    // Future<void> _uploadFile() async {
    //   FilePickerResult? result = await FilePicker.platform.pickFiles(
    //     allowMultiple: false,
    //     type: FileType.custom,
    //     allowedExtensions: ['pdf', 'doc', 'docx', 'ppt', 'pptx', 'xls', 'xlsx'],
    //   );

    //   if (result != null) {
    //     PlatformFile file = result.files.first;
    //     File uploadFile = File(file.path!);

    //     Reference storageRef =
    //         FirebaseStorage.instance.ref('uploads/${file.name}');

    //     try {
    //       await storageRef.putFile(uploadFile);

    //       String downloadUrl = await storageRef.getDownloadURL();
    //       _firestore.collection('messages').add({
    //         'file_url': downloadUrl,
    //         'sender': signedInUser?.email, // تأكد من استخدام signedInUser?
    //         'receiver': widget.otherUserEmail,
    //         'time': FieldValue.serverTimestamp(),
    //       });

    //       print("File uploaded: $downloadUrl");
    //     } catch (e) {
    //       print("Error uploading file: $e");
    //     }
    //   }
    // }
    //   final otherUserEmail = widget.otherUserEmail;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              CircleAvatar(backgroundImage: AssetImage(NImages.user)),
              SizedBox(width: 10),
              Text(
                'Ahmed',
                // otherUserEmail
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // MessageStreamBuilder(email:
              // 'elfeel'
              //  otherUserEmail

              //  ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: NColors.primary, width: 2),
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
                        // if (messageText != null &&
                        //     messageText!.trim().isNotEmpty) {
                        //   _firestore.collection('messages').add({
                        //     'text': messageText,
                        //     'sender': signedInUser?.email,
                        //     'receiver': 'pro@example.com',
                        //     'time': FieldValue.serverTimestamp(),
                        //   });
                        // }
                      },
                      child: Text(
                        'ارسال',
                        style: TextStyle(color: NColors.primary),
                      ),
                    ),
                    IconButton(
                      icon: Image.asset(
                        NImages.money1,
                        height: 22,
                        fit: BoxFit.cover,
                      ),
                      onPressed: () {
                        // _uploadFile();
                      },
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

// class MessageStreamBuilder extends StatelessWidget {
//   final String email;

//   const MessageStreamBuilder({required this.email, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder

//     <QuerySnapshot>

//     (
//       stream: _firestore
//           .collection('messages')
//           .where('receiver', isEqualTo: 'pro@example.com')
//           .orderBy('time')
//           .snapshots(),
//       builder: (context, snapshot) {
//         List<MessageLine> messageWidgets = [];
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }

//         if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//           return Center(child: Text('لا توجد رسائل بعد.'));
//         }

//         final messages = snapshot.data!.docs.reversed;
//         for (var message in messages) {
//           final messageText = message.get('text');
//           final messageSender = message.get('sender');
//           final currentUser =
//               signedInUser?.email; // تأكد من استخدام signedInUser?

//           final messageWidget = MessageLine(
//             sender: messageSender,
//             text: messageText,
//             isMe: currentUser == messageSender,
//           );
//           messageWidgets.add(messageWidget);
//         }
//         return Expanded(
//           child: ListView(
//             reverse: true,
//             padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//             children: messageWidgets,
//           ),
//         );
//       },
//     );
//   }
// }

class MessageLine extends StatelessWidget {
  const MessageLine({this.text, this.sender, required this.isMe, super.key});

  final String? sender;
  final String? text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text('$sender', style: TextStyle(fontSize: 15, color: Colors.green)),
          Material(
            elevation: 5,
            borderRadius:
                isMe
                    ? BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    )
                    : BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
            color: isMe ? NColors.primary : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                '$text',
                style: TextStyle(
                  fontSize: 17,
                  color: isMe ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
