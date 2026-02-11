import 'package:flutter/foundation.dart';
import '../models/contact_model.dart';
import '../models/chat_message_model.dart';

class ChatStore extends ValueNotifier<Map<String, List<ChatMessage>>> {
  ChatStore(super.value);

  void sendMessage({required String contactId, required String text}) {
    final map = Map<String, List<ChatMessage>>.from(value);
    final list = List<ChatMessage>.from(map[contactId] ?? const []);

    list.add(
      ChatMessage(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        contactId: contactId,
        text: text,
        sentAt: DateTime.now(),
        isMe: true,
      ),
    );

    map[contactId] = list;
    value = map;
  }
}

final List<Contact> mockContacts = [
  Contact(
    id: '1',
    name: 'Hadrian Astrawinata',
    phone: '+62 812 3456 7890',
    email: 'hadrian@email.com',
    avatar: 'https://i.pravatar.cc/150?img=3',
  ),
  Contact(
    id: '2',
    name: 'John Doe',
    phone: '+62 811 2222 3333',
    email: 'john@email.com',
    avatar: 'https://i.pravatar.cc/150?img=5',
  ),
  Contact(
    id: '3',
    name: 'Sarah Wijaya',
    phone: '+62 813 4444 5555',
    email: 'sarah@email.com',
    avatar: 'https://i.pravatar.cc/150?img=7',
  ),
  Contact(
    id: '4',
    name: 'Michael Tan',
    phone: '+62 815 7777 8888',
    email: 'michael@email.com',
    avatar: 'https://i.pravatar.cc/150?img=8',
  ),
  Contact(
    id: '5',
    name: 'Alya Putri',
    phone: '+62 817 9999 0000',
    email: 'alya@email.com',
    avatar: 'https://i.pravatar.cc/150?img=9',
  ),
  Contact(
    id: '6',
    name: 'Kevin Santoso',
    phone: '+62 818 2222 1111',
    email: 'kevin@email.com',
    avatar: 'https://i.pravatar.cc/150?img=10',
  ),
];

final _now = DateTime.now();

final ChatStore chatStore = ChatStore({
  '1': [
    ChatMessage(
      id: 'm1',
      contactId: '1',
      text: 'Dri, bisa bantu cek UI?',
      sentAt: _now.subtract(const Duration(hours: 3, minutes: 12)),
      isMe: false,
    ),
    ChatMessage(
      id: 'm2',
      contactId: '1',
      text: 'Bisa. Kirim screenshotnya.',
      sentAt: _now.subtract(const Duration(hours: 3, minutes: 10)),
      isMe: true,
    ),
    ChatMessage(
      id: 'm3',
      contactId: '1',
      text: 'Ini spacing-nya agak aneh di kanan.',
      sentAt: _now.subtract(const Duration(minutes: 40)),
      isMe: false,
    ),
  ],
  '2': [
    ChatMessage(
      id: 'm4',
      contactId: '2',
      text: 'Sip, gas jam 7.',
      sentAt: _now.subtract(const Duration(days: 1, hours: 2)),
      isMe: false,
    ),
    ChatMessage(
      id: 'm5',
      contactId: '2',
      text: 'Oke, ketemu di cafe ya.',
      sentAt: _now.subtract(const Duration(days: 1, hours: 1, minutes: 30)),
      isMe: true,
    ),
  ],
  '3': [
    ChatMessage(
      id: 'm6',
      contactId: '3',
      text: 'Besok ada meeting jam 9.',
      sentAt: _now.subtract(const Duration(days: 2, hours: 5)),
      isMe: false,
    ),
    ChatMessage(
      id: 'm7',
      contactId: '3',
      text: 'Noted, aku join online.',
      sentAt: _now.subtract(const Duration(days: 2, hours: 4, minutes: 50)),
      isMe: true,
    ),
  ],
  '4': [
    ChatMessage(
      id: 'm8',
      contactId: '4',
      text: 'Udah deploy ke staging?',
      sentAt: _now.subtract(const Duration(days: 3, hours: 3)),
      isMe: false,
    ),
    ChatMessage(
      id: 'm9',
      contactId: '4',
      text: 'Sudah. Coba cek ya.',
      sentAt: _now.subtract(const Duration(days: 3, hours: 2, minutes: 45)),
      isMe: true,
    ),
  ],
  '5': [
    ChatMessage(
      id: 'm10',
      contactId: '5',
      text: 'Thank you ya tadi!',
      sentAt: _now.subtract(const Duration(hours: 1, minutes: 20)),
      isMe: false,
    ),
  ],
  '6': [
    ChatMessage(
      id: 'm11',
      contactId: '6',
      text: 'Bro, main ML nanti malam?',
      sentAt: _now.subtract(const Duration(days: 4, hours: 6)),
      isMe: false,
    ),
    ChatMessage(
      id: 'm12',
      contactId: '6',
      text: 'Gas lah 🔥',
      sentAt: _now.subtract(const Duration(days: 4, hours: 5, minutes: 50)),
      isMe: true,
    ),
  ],
});
