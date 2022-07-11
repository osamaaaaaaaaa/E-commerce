import 'package:get/get.dart';

class controller1 extends GetxController {
  RxInt counter = 0.obs;
  increament() {
    counter++;
    update();
  }

  decreament() {
    counter--;
    update();
  }
}
