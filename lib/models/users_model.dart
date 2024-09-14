class UserModel {
  String? firebaseUid;
  String? username;
  String? email;
  String? password;
  String? phone;
  String? profailePic;
  String? role;
  String? location;
  String? docid;

  UserModel({
    this.firebaseUid,
    this.username,
    this.email,
    this.password,
    this.phone,
    this.profailePic,
    this.role,
    this.location,
  });

  UserModel.fromJson(Map<String, dynamic> json, String docid) {
    firebaseUid = json['firebaseUid'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    profailePic = json['profailePic'];
    role = json['role'];
    location = json['location'];
    this.docid = docid;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firebaseUid'] = this.firebaseUid;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['profailePic'] = this.profailePic;
    data['role'] = this.role;
    data['location'] = this.location;

    return data;
  }
}
