class MessageModel {
  String? chatId;
  String? senderId;
  String? receiverId;
  String? message;
  String? type;
  String? timestamp;

  MessageModel(
      {this.chatId,
      this.senderId,
      this.receiverId,
      this.message,
      this.type,
      this.timestamp});

  MessageModel.fromJson(Map<String, dynamic> json) {
    chatId = json['chatId'];
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    message = json['message'];
    type = json['type'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chatId'] = this.chatId;
    data['senderId'] = this.senderId;
    data['receiverId'] = this.receiverId;
    data['message'] = this.message;
    data['type'] = this.type;
    data['timestamp'] = this.timestamp;
    return data;
  }
}
