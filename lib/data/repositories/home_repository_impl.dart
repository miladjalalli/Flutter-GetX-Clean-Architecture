import 'package:getx_clean_architecture/data/models/paging_model.dart';
import 'package:getx_clean_architecture/data/providers/network/apis/home_api.dart';
import 'package:getx_clean_architecture/domain/entities/product.dart';
import 'package:getx_clean_architecture/domain/repositories/home_repository.dart';

class HomeRepositoryIml extends HomeRepository {

  @override
  Future<PagingModel> getProducts(String username,int page, int pageSize) async{
    final response = await HomeAPI.getProducts(username,page, pageSize).request();
    return PagingModel.fromJson(response);
  }

}
