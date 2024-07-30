class Client {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? restaurant_id;
  int? is_active;
  String? created_at;
  String? updated_at;

  Client(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.image,
      required this.restaurant_id,
      required this.is_active,
      required this.created_at,
      required this.updated_at});

  Client.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    restaurant_id = json['restaurant_id'];
    is_active = json['is_active'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
  }

  Map<String, dynamic> toJson(){
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "image": image,
      "restaurant_id": restaurant_id,
      "is_active": is_active,
      "created_at": created_at,
      "updated_at": updated_at,
    };
  }
}
