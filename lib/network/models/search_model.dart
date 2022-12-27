class SearchModel {
  late bool status;
  Null? message;
  late Data data;

  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data'] ?? "");
  }
}

class Data {
  // late int currentPage;
  late List<Products> data;
  // late String firstPageUrl;
  // late int from;
  // late int lastPage;
  // late String lastPageUrl;
  // Null? nextPageUrl;
  // late String path;
  // late int perPage;
  // Null? prevPageUrl;
  // late int to;
  // late int total;

  Data.fromJson(Map<String, dynamic> json) {
    // currentPage = json['current_page'];
    data = <Products>[];
    json['data'].forEach((v) {
      data.add(Products.fromJson(v));
    });

    // firstPageUrl = json['first_page_url'] ?? "";
    // from = json['from'] ?? "";
    // lastPage = json['last_page'] ?? "";
    // lastPageUrl = json['last_page_url'] ?? "";
    // nextPageUrl = json['next_page_url'] ?? "";
    // path = json['path'] ?? "";
    // perPage = json['per_page'] ?? "";
    // prevPageUrl = json['prev_page_url'] ?? "";
    // to = json['to'] ?? "";
    // total = json['total'] ?? "";
  }
}

class Products {
  late int id;
  late dynamic price;
  late dynamic oldPrice;
  late int discount;
  late String image;
  late String name;
  late String description;

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'] ?? 0;
    oldPrice = json['old_price'] ?? 0;
    discount = json['discount'] ?? 0;
    image = json['image'] ?? "";
    name = json['name'] ?? "";
    description = json['description'] ?? "";
  }
}


//SearchCubit.get(context).model!.data.data.isNotEmpty