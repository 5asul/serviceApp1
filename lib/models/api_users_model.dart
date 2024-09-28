class ApiUserModel {
  int? id;
  String? username;
  String? email;
  String? firebaseUid;
  String? phone;
  String? profilePic;
  String? role;
  String? location;
  String? skills;
  String? workerIdPicture;

  ApiUserModel({
    this.id,
    this.username,
    this.email,
    this.firebaseUid,
    this.phone,
    this.profilePic,
    this.role,
    this.location,
    this.skills,
    this.workerIdPicture,
  });

  ApiUserModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    username = json["username"];
    email = json["email"];
    firebaseUid = json["firebaseUid"];
    phone = json["phone"];
    profilePic = json["profilePic"];
    role = json["role"];
    location = json["location"];
    skills = json["skills"];
    workerIdPicture = json["workerIdPicture"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["username"] = username;
    _data["email"] = email;
    _data["firebaseUid"] = firebaseUid;
    _data["phone"] = phone;
    _data["profilePic"] = profilePic;
    _data["role"] = role;
    _data["location"] = location;
    _data["skills"] = skills;
    _data["workerIdPicture"] = workerIdPicture;
    return _data;
  }
}
