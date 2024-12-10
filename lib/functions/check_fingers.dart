import 'package:fingerprint/getx/get.dart';
import 'package:get/get.dart';

void checkFinger() {
  final GetXController controller = Get.put(GetXController());
  for (var i = 0; i < controller.data.length; i++) {
    if (controller.data[i]["finger"] == "zabcdghijk") {
      print("Mos keladigan barmoq izi bor :)");
    } else {
      print("Mos keladigan barmoq izi yo'q :(");
    }
  }
}
