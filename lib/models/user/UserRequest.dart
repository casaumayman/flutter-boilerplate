class UserRequest{
  String name;
  String username;
  String email;

  UserRequest({required this.name, required this.username,required this.email});


  factory UserRequest.fromJson(Map<String, dynamic> json) => UserRequest(

    name: json["name"],
    username: json["username"],
    email: json["email"],

  );

  Map<String, dynamic> toJson() => {

    "name":name,
    "username": username,
    "email": email,
  };
}