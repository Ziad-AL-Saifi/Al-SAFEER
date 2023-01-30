import 'package:alsafier/pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'local/local.dart';
import 'local/local_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true, ignoreSsl: true);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Alsafire());
}

class Alsafire extends StatelessWidget {
  const Alsafire({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MylocaControllar());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      translations: MyLocal(),
      home: const Welcome(),
    );
  }
}
