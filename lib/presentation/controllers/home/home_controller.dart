import 'package:get/get.dart';
import 'package:getx_clean_architecture/domain/entities/paging.dart';
import 'package:getx_clean_architecture/domain/entities/product.dart';
import 'package:getx_clean_architecture/domain/usecases/get_products_use_case.dart';
import 'package:tuple/tuple.dart';

class HomeController extends GetxController {
  HomeController(this._getProductsUseCase,this._userName);

  GetProductsUseCase _getProductsUseCase;
  String _userName;
  int _currentPage = 1;
  int _pageSize = 20;
  var _isLoadMore = false;
  var _paging = Rx<Paging?>(null);

  var products = RxList<Product>([]);


  @override
  void onInit() {
    fetchData();
  }

  fetchData() async {
    final newPaging = await _getProductsUseCase.execute(Tuple3(_userName, _currentPage, _pageSize));
    products.assignAll(newPaging.products);
    _paging.value = newPaging;
  }

  loadMore() async {
    final totalResults = _paging.value?.totalResults ?? 0;
    if (totalResults / _pageSize <= _currentPage) return;
    if (_isLoadMore) return;
    _isLoadMore = true;
    _currentPage += 1;
    final newPaging = await _getProductsUseCase.execute(Tuple3(_userName, _currentPage, _pageSize));
    products.addAll(newPaging.products);
    _paging.value?.totalResults = newPaging.totalResults;
    _isLoadMore = false;
  }
}
