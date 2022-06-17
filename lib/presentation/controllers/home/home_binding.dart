import 'package:get/get.dart';
import 'package:getx_clean_architecture/data/repositories/home_repository_impl.dart';
import 'package:getx_clean_architecture/domain/usecases/get_products_use_case.dart';
import 'package:getx_clean_architecture/presentation/controllers/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetProductsUseCase(Get.find<HomeRepositoryIml>()));
    Get.put(HomeController(Get.find(),""), permanent: true);
  }
}
