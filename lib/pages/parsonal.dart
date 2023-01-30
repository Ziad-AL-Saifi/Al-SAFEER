import 'dart:isolate';
import 'dart:ui';
import 'package:alsafier/pages/questions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:path_provider/path_provider.dart';
import '../Classes/snak_bar.dart';

class Parsonal extends StatefulWidget {
  Parsonal({required this.data, required this.dataCity});
  String? dataCity;
  List<String>? data = [];

  @override
  State<Parsonal> createState() => _ParsonalState();
}

class _ParsonalState extends State<Parsonal> {
  dynamic progress = 0;
  ReceivePort _receivePort = ReceivePort();
  static downloadingCallBack(id, status, progress) {
    ///Looking up for a send port
    SendPort? sendPort = IsolateNameServer.lookupPortByName("downloading");

    ///ssending the data
    sendPort!.send([id, status, progress]);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ///register a send port for the other isolates
    IsolateNameServer.registerPortWithName(
        _receivePort.sendPort, "downloading");

    ///Listening for the data is comming other isolataes
    _receivePort.listen((message) {
      setState(() {
        progress = message[2];
      });
      print(progress);
    });
    FlutterDownloader.registerCallback(downloadingCallBack);
  }

  bool _isloading = false;
  bool isloading = false;
  String? _downloadPath;
  @override
  Widget build(BuildContext context) {
    final storageReference =
        FirebaseStorage.instance.ref().child('Parsonal.docx');

    return Scaffold(
        appBar: AppBar(title: Text("Parsonal Question")),
        body: _isloading
            ? Center(child: CircularProgressIndicator())
            : Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                  'This information helps us speed up the visa filling process .'),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                              ),
                              Text(
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                  'Please fill in the information carefully'),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                              ),
                              Text(
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                  'Download, fill and submit the file with the profiles on the second page'),
                            ],
                          ),
                        ),
                        width: MediaQuery.of(context).size.width - 20,
                        height: MediaQuery.of(context).size.height / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    ElevatedButton(
                        child: Text('Download the file'),
                        onPressed: () async {
                          _isloading = true;
                          setState(() {});
                          await downloadFile(storageReference);
                        }),
                    Visibility(
                      visible: isloading,
                      child: ElevatedButton(
                          onPressed: () {
                            Get.to(
                                Questions(
                                  data: widget.data,
                                ),
                                arguments: widget.dataCity);
                          },
                          child: Text('Next Page')),
                    )
                  ],
                ),
              ));
  }

  Future<void> downloadFile(Reference storageReference) async {
    isloading = true;
    try {
      final directory = await getExternalStorageDirectory();
      _downloadPath = directory!.path;
      final url = await storageReference.getDownloadURL();
      await FlutterDownloader.enqueue(
        url: url,
        savedDir: _downloadPath!,
        showNotification: true,
        saveInPublicStorage: true,
        openFileFromNotification: true,
      );

      _isloading = false;
      showSnack(context, 'Download Complete');
      setState(() {});
    } on Exception catch (e) {
      // TODO
    }
  }

  // Future<void> getfile() async {
  //   isloading = true;
  //   setState(() {});
  //   final storageRef = FirebaseStorage.instance.ref();

  //   final islandRef = storageRef.child("Parsonal.docx");

  //   final appDocDir = await ExternalPath.getExternalStoragePublicDirectory(
  //       ExternalPath.DIRECTORY_DOCUMENTS);
  //   final filePath = '$appDocDir/Parsonal.docx';
  //   final file = File(filePath);
  //   final downloadTask = islandRef.writeToFile(file);
  //   downloadTask.snapshotEvents.listen((taskSnapshot) {
  //     switch (taskSnapshot.state) {
  //       case TaskState.running:
  //         break;
  //       case TaskState.paused:
  //         break;
  //       case TaskState.success:
  //         break;
  //       case TaskState.canceled:
  //         break;
  //       case TaskState.error:
  //         break;
  //     }
  //     _isloading = false;
  //     setState(() {});
  //   });
  // }

}
