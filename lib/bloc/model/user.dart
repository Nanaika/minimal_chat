class ChatUser {
  late final String email;
  late final String uid;

  ChatUser(this.email, this.uid);

  factory ChatUser.fromJson(Map<String, dynamic> json) {
    return ChatUser(json['email'], json['uid']);
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'uid': uid,
    };
  }
}
