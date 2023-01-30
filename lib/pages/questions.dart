import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Classes/connect_qustion_details.dart';
import '../Classes/snak_bar.dart';
import '../const_color.dart';

class Questions extends StatefulWidget {
  Questions({Key? key, this.data}) : super(key: key);
  List<String>? data = [];

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  QusetionDetails? r;
  FilePickerResult? result;
  String? fileName;
  PlatformFile? pickedfile;
  bool isLoading = false;
  File? fileToDisplay;
  String? stringNameFile;
  List<String>? dataName = [];
  List<File>? listOFFile = [];

  String? nameUsers;
  String? phoneUsers;
  dynamic dataNameCityGetX = Get.arguments;

  bool _isLoading = false;

  final List<TextEditingController> _controller = [];

  Future pickFile() async {
    try {
      setState(() {
        isLoading = true;
      });

      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );
      Random random = Random();
      int randomNumber = random.nextInt(100000) + 1;
      if (result != null) {
        fileName = result!.files.first.name;
        pickedfile = result!.files.first;
        fileToDisplay = File(pickedfile!.path.toString());
      }

      fileName = fileName! + randomNumber.toString();
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      showSnack(context, e.toString());
    }
  }

  final glopelkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var visaName = dataNameCityGetX;
    var mHight = MediaQuery.of(context).size.height;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    setState(() {});
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kColor,
          centerTitle: true,
          title: Text('Questions'.tr),
          leading: IconButton(
              onPressed: () {
                setState(() {});
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : Form(
                key: glopelkey,
                child: Column(
                  children: [
                    const Text(
                      'Name as it appears in the passport',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          try {
                            stringNameFile = value;
                            nameUsers = value;
                          } catch (e) {
                            showSnack(context, e.toString());
                          }
                        },
                        decoration: const InputDecoration(
                          hintText: "The name consists of 3 syllables",
                          suffixIcon: Icon(Icons.verified_user),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),

                    //phone number
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          try {
                            phoneUsers = value;
                          } catch (e) {
                            showSnack(context, e.toString());
                          }
                        },
                        decoration: const InputDecoration(
                          hintText: "Phone number ",
                          suffixIcon: Icon(Icons.verified_user),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: kColor,
                        )),
                        child: ListView.builder(
                          itemCount: widget.data!.length,
                          itemBuilder: (context, index) {
                            _controller.add(TextEditingController());
                            return Container(
                              margin: const EdgeInsets.all(10),
                              child: Column(children: [
                                Text(
                                  widget.data![index],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: mHight * 0.05,
                                ),
                                TextField(
                                  controller: _controller[index],
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: const Icon(Icons.upload_file),
                                      onPressed: () async {
                                        try {
                                          setState(() {});
                                          await pickFile();
                                          dataName!.add(fileName!);
                                          listOFFile!.add(fileToDisplay!);
                                          _controller[index].text = fileName!;
                                        } catch (e) {
                                          showSnack(context, e.toString());
                                        }
                                      },
                                    ),
                                    border: const OutlineInputBorder(),
                                  ),
                                ),
                              ]),
                            );
                          },
                        ),
                      ),
                    ),

                    GestureDetector(
                        child: Container(
                            color: kColor,
                            height: 60,
                            child: const Center(
                                child: Text(
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    'Submit'))),
                        onTap: () async {
                          _isLoading = true;
                          setState(() {});
                          try {
                            if (glopelkey.currentState!.validate()) {
                              for (int i = 0; i < listOFFile!.length; i++) {
                                // get the file name
                                var refStor = FirebaseStorage.instance
                                    .ref('$stringNameFile/${dataName![i]}');
                                await refStor.putFile(listOFFile![i]);
                              }
                              users.add({
                                'name': nameUsers,
                                'phone': phoneUsers,
                                'time': DateTime.now(),
                                'visaName': visaName
                              });
                              setState(() {
                                _isLoading = false;
                              });

                              showSnack(context, 'Successful');
                            }
                            // ignore: use_build_context_synchronously

                          } catch (e) {
                            showSnack(context, e.toString());
                          }
                        }),
                  ],
                ),
              ));
  }
}
