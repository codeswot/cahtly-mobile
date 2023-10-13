// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_data.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class ChatData extends _ChatData
    with RealmEntity, RealmObjectBase, RealmObject {
  ChatData(
    String chatId,
    String roomId,
    String text,
    String fromId,
    String toId,
    String timestamp,
    String replyId,
    String mediaUrl,
    String mediaType,
  ) {
    RealmObjectBase.set(this, 'chatId', chatId);
    RealmObjectBase.set(this, 'roomId', roomId);
    RealmObjectBase.set(this, 'text', text);
    RealmObjectBase.set(this, 'fromId', fromId);
    RealmObjectBase.set(this, 'toId', toId);
    RealmObjectBase.set(this, 'timestamp', timestamp);
    RealmObjectBase.set(this, 'replyId', replyId);
    RealmObjectBase.set(this, 'mediaUrl', mediaUrl);
    RealmObjectBase.set(this, 'mediaType', mediaType);
  }

  ChatData._();

  @override
  String get chatId => RealmObjectBase.get<String>(this, 'chatId') as String;
  @override
  set chatId(String value) => RealmObjectBase.set(this, 'chatId', value);

  @override
  String get roomId => RealmObjectBase.get<String>(this, 'roomId') as String;
  @override
  set roomId(String value) => RealmObjectBase.set(this, 'roomId', value);

  @override
  String get text => RealmObjectBase.get<String>(this, 'text') as String;
  @override
  set text(String value) => RealmObjectBase.set(this, 'text', value);

  @override
  String get fromId => RealmObjectBase.get<String>(this, 'fromId') as String;
  @override
  set fromId(String value) => RealmObjectBase.set(this, 'fromId', value);

  @override
  String get toId => RealmObjectBase.get<String>(this, 'toId') as String;
  @override
  set toId(String value) => RealmObjectBase.set(this, 'toId', value);

  @override
  String get timestamp =>
      RealmObjectBase.get<String>(this, 'timestamp') as String;
  @override
  set timestamp(String value) => RealmObjectBase.set(this, 'timestamp', value);

  @override
  String get replyId => RealmObjectBase.get<String>(this, 'replyId') as String;
  @override
  set replyId(String value) => RealmObjectBase.set(this, 'replyId', value);

  @override
  String get mediaUrl =>
      RealmObjectBase.get<String>(this, 'mediaUrl') as String;
  @override
  set mediaUrl(String value) => RealmObjectBase.set(this, 'mediaUrl', value);

  @override
  String get mediaType =>
      RealmObjectBase.get<String>(this, 'mediaType') as String;
  @override
  set mediaType(String value) => RealmObjectBase.set(this, 'mediaType', value);

  @override
  Stream<RealmObjectChanges<ChatData>> get changes =>
      RealmObjectBase.getChanges<ChatData>(this);

  @override
  ChatData freeze() => RealmObjectBase.freezeObject<ChatData>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(ChatData._);
    return const SchemaObject(ObjectType.realmObject, ChatData, 'ChatData', [
      SchemaProperty('chatId', RealmPropertyType.string),
      SchemaProperty('roomId', RealmPropertyType.string),
      SchemaProperty('text', RealmPropertyType.string),
      SchemaProperty('fromId', RealmPropertyType.string),
      SchemaProperty('toId', RealmPropertyType.string),
      SchemaProperty('timestamp', RealmPropertyType.string),
      SchemaProperty('replyId', RealmPropertyType.string),
      SchemaProperty('mediaUrl', RealmPropertyType.string),
      SchemaProperty('mediaType', RealmPropertyType.string),
    ]);
  }
}
