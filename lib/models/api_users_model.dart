class ApiUserModel {
  int? id;
  String? firebaseUid;
  String? username;
  String? email;
  String? phone;
  String? profilePic;
  String? workerIdPicture;
  String? serviceName;
  String? role;
  String? location;
  

  ApiUserModel({
    this.id,
    this.firebaseUid,
    
    this.username,
    this.email,
    this.phone,
    this.profilePic,
    this.workerIdPicture,
    this.serviceName,
    this.role,
    this.location,
  });

  ApiUserModel.fromJson(Map<String, dynamic> json, ) {
    id = json['Id'];
    firebaseUid = json['FirebaseUid'];
    username = json['Username'];
    email = json['Email'];
    phone = json['Phone'];
    profilePic = json['ProfilePic'];
    workerIdPicture = json['WorkerIdPicture'];
    role = json['Role'];
    serviceName = json['ServiceName'];
    location = json['Location'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['FirebaseUid'] = this.firebaseUid;
    data['Username'] = this.username;
    data['Email'] = this.email;
    data['Phone'] = this.phone;
    data['ProfilePic'] = this.profilePic;
    data['WorkerIdPicture'] = this.workerIdPicture;
    data['Role'] = this.role;
    data['ServiceName'] = this.serviceName;
    data['Location'] = this.location;

    return data;
  }
}
