class UserID{
  int userId;
  UserID({required this.userId});

  factory UserID.fromJson(Map<String, dynamic> json) => UserID(
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "userId":userId,
  };
}