class SignupModel {
  bool? status;
  String? message;
  Data? data;

  SignupModel({this.status, this.message, this.data});

  SignupModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

}

class Data {
  String? name;
  String? phone;
  String? email;
  int? id;
  String? image;
  String? token;



  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    id = json['id'];
    image = json['image'];
    token = json['token'];
  }


}
