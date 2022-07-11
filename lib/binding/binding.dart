import 'package:flutter_app/controller/Authviewmodel.dart';
import 'package:flutter_app/controller/Homeviewmodel.dart';
import 'package:flutter_app/controller/cardcontroller.dart';
import 'package:get/get.dart';

class binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Authviewmodel());
    Get.lazyPut(() => Homeviewmodel());
    Get.lazyPut(() => cardcontroller());
  }
}
