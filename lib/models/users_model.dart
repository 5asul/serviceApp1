class UserModel {
  String? firebaseUid;
  String? username;
  String? email;
  String? password;
  String? phone;
  String? profailePic;
  String? workerIdPicture;
  String? serviceName;
  String? role;
  String? location;
  String? docid;

  UserModel({
    this.firebaseUid,
    this.docid,
    this.username,
    this.email,
    this.password,
    this.phone,
    this.profailePic,
    this.workerIdPicture,
    this.serviceName,
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
    workerIdPicture = json['workerIdPicture'];
    role = json['role'];
    serviceName = json['serviceName'];
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
    data['workerIdPicture'] = this.workerIdPicture;
    data['role'] = this.role;
    data['serviceName'] = this.serviceName;
    data['location'] = this.location;

    return data;
  }
}
