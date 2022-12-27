class Profile {
  bool? status;
  String? message;
  Data? data;

  Profile({this.status, this.message, this.data});

  Profile.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  dynamic points;
  dynamic credit;
  String? token;

  Data(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.image,
      this.points,
      this.credit,
      this.token});

  Data.fromJson(Map<String, dynamic> json) {
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


                //   Column(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Container(
                //         width: double.infinity,
                //         margin: const EdgeInsets.symmetric(horizontal: 10),
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //           children: [
                          
                //           ],
                //         ),
                //       )
                //     ],
                //   ),
//               ],
//             ),
//           ),
//         ]));
//   }
// }
