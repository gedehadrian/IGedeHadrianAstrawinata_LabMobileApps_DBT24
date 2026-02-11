class ChatMessage {
  final String id;
  final String contactId;
  final String text;
  final DateTime sentAt;
  final bool isMe;

  ChatMessage({
    required this.id,
    required this.contactId,
    required this.text,
    required this.sentAt,
    required this.isMe,
  });
}
