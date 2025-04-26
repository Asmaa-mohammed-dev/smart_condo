import 'package:flutter/material.dart';
import 'package:smart_condo/common/custom_shape/app_bar/app_bar.dart';
import 'package:smart_condo/utils/helpers/helper_functions.dart';
import 'chat_screen.dart'; // تأكدي إنك مضافة ChatScreen هنا

class ContactsScreen extends StatelessWidget {
  final List<Map<String, String>> contacts = [
    {
      'name': ' مالك العقار',
      'image': 'assets/images/man.png',
    },
    {
      'name': 'أحمد',
      'image': 'assets/images/man.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NAppBar(
        title: Text(
          'جهات الاتصال',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'MAJALLA',
            color: NHelperFunctions.isDarkMode(context)
                ? Colors.white
                : Colors.black,
            fontSize: 24,
          ),
        ),
        showBackArrow: true,
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatScreen()),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(contacts[index]['image']!),
                  ),
                  SizedBox(width: 16),
                  Text(
                    contacts[index]['name']!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'MAJALLA',
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
