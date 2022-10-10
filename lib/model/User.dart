class UserModel {
  String? uid;
  String? imageUrl;
  String? email;
  String? phone;
  String? name;
  // String? password;

  UserModel({this.uid, this.email, this.phone, this.imageUrl, this.name});

//receive data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      name: map['username'],
      email: map['email'],
      phone: map['phone'],
      imageUrl: map['imageUrl'],
    );
  }

//sending data to the server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': name,
      'email': email,
      'phone': phone,
      'imageUrl': imageUrl,
    };
  }
}
