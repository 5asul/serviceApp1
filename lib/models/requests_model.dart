class RequestsModel {
  String? requestId;
  String? clientId;
  String? workerId;
  String? serviceType;
  String? workDescription;
  String? status;
  String? location;
  String? timeStamp;
  String? docid;

  RequestsModel(
      {this.requestId,
      this.clientId,
      this.workerId,
      this.serviceType,
      this.workDescription,
      this.status,
      this.location,
      this.docid,
      this.timeStamp});

  RequestsModel.fromJson(Map<String, dynamic> json, String docid) {
    requestId = json["requestId"];
    clientId = json["clientId"];
    workerId = json["workerId"];
    serviceType = json["serviceType"];
    workDescription = json["workDescription"];
    status = json["status"];
    location = json["location"];
    timeStamp = json["timeStamp"];
    this.docid = docid;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["requestId"] = requestId;
    _data["clientId"] = clientId;
    _data["workerId"] = workerId;
    _data["serviceType"] = serviceType;
    _data["workDescription"] = workDescription;
    _data["status"] = status;
    _data["location"] = location;
    _data["timeStamp"] = timeStamp;
    return _data;
  }
}
