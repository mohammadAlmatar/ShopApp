class ShopLoginModel{

    late bool state;
    late String message;
    late dynamic data;

   ShopLoginModel.fromjson(Map<String,dynamic>json)
   {
     state=json['status'];
     message=json['message'];
     data=json['data']!= null ? UserData.fromjson(json['data']):null;

}

}
class UserData {

  late int id;
  late String name;
  late String email;
  late String phone;
  late String image;
  late int points;
  late int credit;
  late String token;

  UserData.fromjson(Map<String, dynamic>json)
  {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }
}
