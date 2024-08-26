
class UserModel {
  String? id;
  String? username;
  String? email;
  String? phone;
  String? profailePic;
  String? role;
  String? location;
  List<String>? skills;
  String? firebaseUid;

  UserModel(
      {this.id,
        this.username,
        this.email,
        this.phone,
        this.profailePic,
        this.role,
        this.location,
        this.skills,
        this.firebaseUid,});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    profailePic = json['profailePic'];
    role = json['role'];
    location = json['location'];
    skills = json['skills'].cast<String>();
    firebaseUid = json['firebaseUid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['profailePic'] = this.profailePic;
    data['role'] = this.role;
    data['location'] = this.location;
    data['skills'] = this.skills;
    data['firebaseUid'] = this.firebaseUid;
    return data;
  }
}
