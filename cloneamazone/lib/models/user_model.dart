import 'dart:convert';

class User{
  final String id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String usertype;
  final String token;

  User({
    required this.id,
    required this.name,
    required this.password,
    required this.address,
    required this.usertype,
    required this.token,
    required this.email,
  });


  Map<String , dynamic> toMap(){
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'usertype': usertype,
      'token': token,
    };
  }


  factory User.fromMap(Map<String, dynamic> map){
    return User(
        id: map['_id'] ?? '',
        name: map['name'] ?? '',
        email: map['email'] ?? '',
        password: map['password'] ?? '',
        address: map['address'] ?? '',
        usertype: map['usertype'] ?? '',
        token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? address,
    String? usertype,
    String? token,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      address: address ?? this.address,
      usertype: usertype ?? this.usertype,
      token: token ?? this.token,
    );
  }

}