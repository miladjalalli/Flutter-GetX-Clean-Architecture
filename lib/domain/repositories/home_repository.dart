
import 'package:getx_clean_architecture/data/models/paging_model.dart';

abstract class HomeRepository {
  Future<PagingModel> getProducts(String username,int page, int pageSize);
}
