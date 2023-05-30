import 'package:events_app_user/Controllers.dart/home_controller.dart';
import 'package:events_app_user/Services/Api/IRepository/IRepositoryEvent.dart';
import 'package:get/get.dart';

import '../Controllers.dart/container_controller.dart';
import '../Services/Api/Repository/RepositoryEvent.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContainerController>(() => ContainerController());
    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
    Get.put<IRepositoryEvent>(RepositoryEvent());
  }
}
