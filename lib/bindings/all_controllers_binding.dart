import 'package:desti_alert/modules/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';

class AllControllesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }
}
