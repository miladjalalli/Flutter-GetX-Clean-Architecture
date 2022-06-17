
import 'package:getx_clean_architecture/domain/entities/product.dart';

class Paging {
  Paging({
    required this.totalResults,
    required this.prodcuts,
  });

  int totalResults;
  List<Product> prodcuts;
}
