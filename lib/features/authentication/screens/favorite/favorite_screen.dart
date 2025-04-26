// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:smart_condo/utils/constants/colors.dart';

// class FavoriteScreen extends StatefulWidget {
//   const FavoriteScreen({super.key});

//   @override
//   State<FavoriteScreen> createState() => _FavoriteScreenState();
// }

// class _FavoriteScreenState extends State<FavoriteScreen> {
//   TextEditingController _problemController = TextEditingController();
//   XFile? _image;

//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       _image = pickedFile;
//     });
//   }

//   Future<void> _uploadProblem(String problemText, String type) async {
//     String? imageUrl;

//     if (_image != null) {
//       final storageRef = FirebaseStorage.instance
//           .ref()
//           .child('problems/${DateTime.now().millisecondsSinceEpoch}.jpg');
//       await storageRef.putFile(File(_image!.path));
//       imageUrl = await storageRef.getDownloadURL();
//     }

//     await FirebaseFirestore.instance.collection('problems').add({
//       'type': type,
//       'text': problemText,
//       'image': imageUrl,
//       'createdAt': Timestamp.now(),
//     });
//   }

//   void _showCustomScreen(String type) {
//     String title = '', description = '';
//     if (type == 'صيانة') {
//       title = 'ما هي مشكلتك؟';
//       description = 'يرجى إدخال تفاصيل مشكلة الصيانة.';
//     } else if (type == 'ديكور العقار') {
//       title = 'ما هي احتياجاتك؟';
//       description = 'يرجى إدخال تفاصيل الديكور المطلوبة.';
//     } else {
//       title = 'ما هي المشكلة الأخرى؟';
//       description = 'يرجى إدخال تفاصيل المشكلة الأخرى.';
//     }

//     showDialog(
//       context: context,
//       builder: (context) {
//         return Directionality(
//           textDirection: TextDirection.rtl,
//           child: AlertDialog(
//             title: Text(title),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(description, style: TextStyle(fontSize: 20)),
//                 SizedBox(height: 10),
//                 TextField(
//                   controller: _problemController,
//                   decoration: InputDecoration(hintText: 'أدخل مشكلتك هنا'),
//                 ),
//                 SizedBox(height: 10),
//                 ElevatedButton(
//                   onPressed: _pickImage,
//                   child: Text('رفع صورة'),
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: Size(double.infinity,
//                         40), // عرض الزر يكون بنفس عرض الـ TextField
//                   ),
//                 ),
//                 if (_image != null)
//                   Image.file(File(_image!.path), width: 100, height: 100),
//               ],
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () async {
//                   await _uploadProblem(_problemController.text, type);
//                   Navigator.pop(context);
//                   _problemController.clear();
//                   setState(() {
//                     _image = null;
//                   });
//                 },
//                 child: Text('إرسال'),
//               ),
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: Text('إلغاء'),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _problemOption(String label, String iconPath) {
//     return GestureDetector(
//       onTap: () => _showCustomScreen(label),
//       child: Container(
//         margin: EdgeInsets.all(20),
//         height: 50,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Center(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(iconPath, width: 30, height: 30),
//               SizedBox(width: 10),
//               Text(
//                 label,
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 21,
//                     fontFamily: 'MAJALLA'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/images/12222.jpg'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               height: MediaQuery.of(context).size.height / 2,
//               decoration: BoxDecoration(
//                 color: NColors.primary.withValues(alpha: 0.8),
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   _problemOption(
//                       'الصيانة', 'assets/images/icons/optimizing.png'),
//                   _problemOption(
//                       'ديكور العقار', 'assets/images/icons/house.png'),
//                   _problemOption('أخرى', 'assets/images/icons/stars.png'),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_condo/utils/constants/colors.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  TextEditingController _problemController = TextEditingController();
  XFile? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile;
    });
  }

  Future<void> _uploadProblem(String problemText, String type) async {
    String? imageUrl;

    if (_image != null) {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('problems/${DateTime.now().millisecondsSinceEpoch}.jpg');
      await storageRef.putFile(File(_image!.path));
      imageUrl = await storageRef.getDownloadURL();
    }

    await FirebaseFirestore.instance.collection('problems').add({
      'type': type,
      'text': problemText,
      'image': imageUrl,
      'createdAt': Timestamp.now(),
    });
  }

  void _showCustomScreen(String type) {
    String title = '', description = '';
    if (type == 'صيانة') {
      title = 'ما هي مشكلتك؟';
      description = 'يرجى إدخال تفاصيل مشكلة الصيانة.';
    } else if (type == 'ديكور العقار') {
      title = 'ما هي احتياجاتك؟';
      description = 'يرجى إدخال تفاصيل الديكور المطلوبة.';
    } else {
      title = 'ما هي المشكلة الأخرى؟';
      description = 'يرجى إدخال تفاصيل المشكلة الأخرى.';
    }

    // إعادة تهيئة النص والصورة قبل فتح الـ AlertDialog
    _problemController.clear();
    setState(() {
      _image = null;
    });

    showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(description, style: TextStyle(fontSize: 20)),
                SizedBox(height: 10),
                TextField(
                  controller: _problemController,
                  decoration: InputDecoration(hintText: 'أدخل مشكلتك هنا'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _pickImage,
                  child: Text('رفع صورة'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 40),
                  ),
                ),
                // النص والصورة بشكل منفصل
                if (_image != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        Text(
                          'الصورة المرفوعة:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Image.file(File(_image!.path), width: 150, height: 150),
                      ],
                    ),
                  ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  await _uploadProblem(_problemController.text, type);
                  Navigator.pop(context);
                  _problemController.clear();
                  setState(() {
                    _image = null;
                  });
                },
                child: Text('إرسال'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _problemController.clear(); // مسح النص عند الإلغاء
                  setState(() {
                    _image = null; // مسح الصورة عند الإلغاء
                  });
                },
                child: Text('إلغاء'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _problemOption(String label, String iconPath) {
    return GestureDetector(
      onTap: () => _showCustomScreen(label),
      child: Container(
        margin: EdgeInsets.all(20),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(iconPath, width: 30, height: 30),
              SizedBox(width: 10),
              Text(
                label,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                    fontFamily: 'MAJALLA'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/12222.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                color: NColors.primary.withValues(alpha: 0.8),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _problemOption(
                      'الصيانة', 'assets/images/icons/optimizing.png'),
                  _problemOption(
                      'ديكور العقار', 'assets/images/icons/house.png'),
                  _problemOption('أخرى', 'assets/images/icons/stars.png'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
