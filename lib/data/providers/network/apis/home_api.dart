import 'package:getx_clean_architecture/data/providers/network/api_endpoint.dart';
import 'package:getx_clean_architecture/data/providers/network/api_provider.dart';
import 'package:getx_clean_architecture/data/providers/network/api_request_representable.dart';
import 'package:getx_clean_architecture/data/providers/network/http_method.dart';


class HomeAPI implements APIRequestRepresentable {
  String? username;
  int? page;
  int? pageSize;

  HomeAPI._({this.username, this.page, this.pageSize});

  HomeAPI.getProducts(String username,int page, int pageSize) : this._(username: username,page: page, pageSize: pageSize);

  @override
  String get endpoint => APIEndpoint.newsapi;

  String get path {
        return "/products";
  }

  @override
  HTTPMethod get method {
    return HTTPMethod.get;
  }

  Map<String, String> get headers => {"X-Api-Key": "PUT_HERE"};

  Map<String, String> get query {
        return {"username": '$username', "page": "$page", "pageSize": "$pageSize"};
  }

  @override
  get body => null;

  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;
}
