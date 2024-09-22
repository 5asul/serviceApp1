class ApiRequestsModel {
  String? id;
  String? requestId;
  String? clientId;
  String? workerId;
  String? serviceType;
  String? workDescription;
  String? status;
  String? location;
  String? timeStamp;
  

  ApiRequestsModel(
      {this.id,
        this.requestId,
      this.clientId,
      this.workerId,
      this.serviceType,
      this.workDescription,
      this.status,
      this.location,
      
      this.timeStamp});

  ApiRequestsModel.fromJson(Map<String, dynamic> json) {
    id=json["Id"];
    requestId = json["RequestId"];
    clientId = json["ClientId"];
    workerId = json["WorkerId"];
    serviceType = json["ServiceType"];
    workDescription = json["WorkDescription"];
    status = json["Status"];
    location = json["Location"];
    timeStamp = json["TimeStamp"];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["Id"] = id;
    _data["RequestId"] = requestId;
    _data["ClientId"] = clientId;
    _data["WorkerId"] = workerId;
    _data["ServiceType"] = serviceType;
    _data["WorkDescription"] = workDescription;
    _data["Status"] = status;
    _data["Location"] = location;
    _data["TimeStamp"] = timeStamp;
    return _data;
  }
}
