import 'package:swishapp/models/contact_model.dart';

class ChatModel {
  final bool isTyping;
  final String lastMessage;
  final String lastMessageTime;
  final ContactModel contact;

  ChatModel(
      {this.isTyping, this.lastMessage, this.lastMessageTime, this.contact});

  static List<ChatModel> list = [
    ChatModel(
      isTyping: true,
      lastMessage: "hello!",
      lastMessageTime: "2d",
      contact: ContactModel(name: "mohamed ben "),
    ),
    ChatModel(
      isTyping: false,
      lastMessage: "ayoub smayen :hello",
      lastMessageTime: "2d",
      contact: ContactModel(name: "mohmed ben "),
    ),
    ChatModel(
      isTyping: false,
      lastMessage: "thank sehbi ",
      lastMessageTime: "2d",
      contact: ContactModel(name: "ayoub smayen"),
    ),
  ];
}
