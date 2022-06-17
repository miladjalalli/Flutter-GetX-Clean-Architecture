import 'package:get/get.dart';
import 'package:getx_clean_architecture/data/repositories/home_repository_impl.dart';

class DependencyCreator {
  static init() {
    Get.lazyPut(() => HomeRepositoryIml());
  }
}
