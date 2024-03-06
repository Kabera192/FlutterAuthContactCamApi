import 'package:get/get.dart';
import 'connection.dart';

class DependencyInjection{
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent:true);
  }
}
