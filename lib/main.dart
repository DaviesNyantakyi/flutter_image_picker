import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MyImagePicker myImagePicker = MyImagePicker();
  File? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircleAvatar(
          backgroundColor: Colors.grey.shade300,
          radius: 100,
          backgroundImage: file != null ? Image.file(file!).image : null,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: TextButton(
                child: file == null
                    ? const Icon(Icons.person_outline_outlined)
                    : Container(),
                onPressed: () async {
                  await myImagePicker.showBottomSheet(context: context);
                  file = myImagePicker.image;
                  setState(() {});
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
