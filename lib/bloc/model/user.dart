class ChatUser {
  late final String email;
  late final String uid;

  ChatUser(this.email, this.uid);

  factory ChatUser.fromJson(Map<String, dynamic> json) {
    return ChatUser(json[UserFields.email.name], json[UserFields.uid.name]);
  }

  Map<String, dynamic> toJson() {
    return {
      UserFields.email.name: email,
      UserFields.uid.name: uid,
    };
  }
}

enum UserFields { email, uid }
