class HomeModel {
  late bool status;
  late HomeModelData data;
  HomeModel.fromjson(Map<String, dynamic> json) {
    status = json['status'];
    data = HomeModelData.fromjson(json['data']);
  }
}

class HomeModelData {
  List<BannerModel> banners = [];
  List<HomeProducts> products = [];

  HomeModelData.fromjson(Map<String, dynamic> json) {
    json['banners'].forEach((elemnt) {
      banners.add(BannerModel.fromjson(elemnt));
    });
    json['products'].forEach((elemnt) {
      products.add(HomeProducts.fromjson(elemnt));
    });
  }
}

class BannerModel {
  late int id;
  late String image;
  BannerModel.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class HomeProducts {
  late int id;
  late dynamic price;
  late dynamic oldPrice;
  late int discount;
  late String description;
  late String name;
  late String image;
  late bool inFavorites;
  late bool inCard;
  HomeProducts.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    description = json['description'];
    name = json['name'];
    inFavorites = json['in_favorites'];
    inCard = json['in_cart'];
  }
}
