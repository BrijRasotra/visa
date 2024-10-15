import 'package:get/get.dart';
import 'package:visa_officer_insider_secrets/Utils/base_service.dart';

class PageBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(BaseService());
  }
}
