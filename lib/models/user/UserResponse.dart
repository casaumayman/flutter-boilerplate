class UserResponse{
  int id;
  String name;
  String username;
  String email;

  UserResponse({required this.id,required this.name, required this.username,required this.email});


  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name":name,
    "username": username,
    "email": email,
  };
}