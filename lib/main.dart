import 'dart:convert';
import 'dart:math';
import 'dart:convert' as convert;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import './binding/binding.dart';

import 'package:flutter_app/View/auth/login.dart';
import 'package:flutter_app/controller/controller.dart';

import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
// ...

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
      initialBinding: binding(),
      debugShowCheckedModeBanner: false,
      home: login(),
      theme: ThemeData(fontFamily: 'SourceSans'),
    );
  }
}
