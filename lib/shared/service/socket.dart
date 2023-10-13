import 'dart:convert';

import 'package:chatlly/chats/model/chat_model.dart';
import 'package:chatlly/shared/shared.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketService {
  static final SocketService _singleton = SocketService._internal();

  factory SocketService() {
    return _singleton;
  }

  final LoggingService _logger = LoggingService();
  SocketService._internal();

  io.Socket? _socket;

  // Initialize the socket connection
  void initSocket() {
    _socket = io.io(
      kBaseUrl,
      io.OptionBuilder().setTransports(['websocket']).build(),
    );

    // Add event listeners
    _socket!.on('msg', (data) {
      _logger.info('Received message: $data');
    });
    _socket!.on('msg_upate', (data) {
      _logger.info('Update message: $data');
    });
    _socket!.on('msg_delete', (data) {
      _logger.info('Delete message: $data');
    });

    _socket!.on('join_room', (data) {
      _logger.info('joined room: $data');
    });

    _socket!.on('leave_room', (data) {
      _logger.info('leave room: $data');
    });
    _socket!.on('typing', (data) {
      _logger.info('Typing... $data');
    });

    _socket!.onConnect((data) {
      _logger.info('Connected to socket');
    });

    _socket!.onDisconnect((error) {
      _logger.info('Disconnected from socket');
    });

    // Connect to the server
    _socket!.connect();
  }

  void joinRoom(String roomId) {
    _socket!.emit("join_room", roomId);
  }

  void leaveRoom(String roomId) {
    _socket!.emit("leave_room", roomId);
  }

  void sendMessage(ChatModel chat) {
    if (_socket != null) {
      _socket!.emit(
        'msg',
        chat,
      );
    }
  }

  void typing({required String uid, required String roomId}) {
    if (_socket != null) {
      _socket!.emit(
          'typing',
          json.encode({
            'userTypingId': uid,
            'roomId': roomId,
          }));
    }
  }

  void typingDone(Map<String, dynamic> data) {
    if (_socket != null) {
      _socket!.emit('typing_done', data);
    }
  }

  void lastSeen(Map<String, dynamic> data) {
    if (_socket != null) {
      _socket!.emit('ping_for_lastseen', data);
    }
  }

  // Disconnect from the server
  void disconnect() {
    if (_socket != null) {
      _socket!.disconnect();
    }
  }
}
