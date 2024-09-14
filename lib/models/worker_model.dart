class WorkerModel {
  String? firebaseUid;
  String? username;
  String? email;
  String? password;
  String? phone;
  String? profailePic;
  String? workerIdPicture;
  String? role;
  String? serviceName;
  String? location;

  WorkerModel({
    this.firebaseUid,
    this.username,
    this.email,
    this.password,
    this.phone,
    this.profailePic,
    this.workerIdPicture,
    this.role,
    this.serviceName,
    this.location,
  });

  WorkerModel.fromJson(Map<String, dynamic> json) {
    firebaseUid = json['firebaseUid'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    profailePic = json['profailePic'];
    workerIdPicture = json['idPic'];
    role = json['role'];
    serviceName = json['serviceName'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firebaseUid'] = this.firebaseUid;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['profailePic'] = this.profailePic;
    data['idPic'] = this.workerIdPicture;
    data['role'] = this.role;
    data['serviceName'] = this.serviceName;
    data['location'] = this.location;

    return data;
  }
}
