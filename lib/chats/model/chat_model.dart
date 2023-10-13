import 'dart:convert';

class ChatModel {
  final String? chatId;
  final String roomId;
  final String text;
  final String fromId;
  final String toId;
  final String timestamp;
  final String replyId;
  final String mediaUrl;
  final String mediaType;

  ChatModel({
    required this.roomId,
    required this.text,
    this.chatId,
    required this.fromId,
    required this.toId,
    required this.timestamp,
    required this.replyId,
    required this.mediaUrl,
    required this.mediaType,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      chatId: json['_id'],
      roomId: json['roomId'] as String,
      text: json['text'] as String,
      fromId: json['fromId'] as String,
      toId: json['toId'] as String,
      timestamp: json['timestamp'] as String,
      replyId: json['replyId'] as String,
      mediaUrl: json['mediaUrl'] as String,
      mediaType: json['mediaType'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chatId': chatId,
      'roomId': roomId,
      'text': text,
      'fromId': fromId,
      'toId': toId,
      'timestamp': timestamp,
      'replyId': replyId,
      'mediaUrl': mediaUrl,
      'mediaType': mediaType,
    };
  }

  String toRawJson() {
    final Map<String, dynamic> data = toJson();
    return json.encode(data);
  }

  ChatModel copyWith({
    String? roomId,
    String? text,
    String? fromId,
    String? toId,
    String? timestamp,
    String? replyId,
    String? mediaUrl,
    String? mediaType,
  }) {
    return ChatModel(
      roomId: roomId ?? this.roomId,
      text: text ?? this.text,
      fromId: fromId ?? this.fromId,
      toId: toId ?? this.toId,
      timestamp: timestamp ?? this.timestamp,
      replyId: replyId ?? this.replyId,
      mediaUrl: mediaUrl ?? this.mediaUrl,
      mediaType: mediaType ?? this.mediaType,
    );
  }

  static ChatModel empty() {
    return ChatModel(
      roomId: '',
      text: '',
      fromId: '',
      toId: '',
      timestamp: '',
      replyId: '',
      mediaUrl: '',
      mediaType: '',
    );
  }
}
