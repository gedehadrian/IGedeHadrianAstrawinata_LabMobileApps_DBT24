import 'package:flutter/material.dart';
import '../data/mockup_data.dart';
import '../utils/time_format.dart';
import '../widgets/contact_card.dart';
import 'chat_screen.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header ──
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Chats',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      fontSize: 28,
                      color: const Color(0xFF1E1E2D),
                    ),
                  ),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F1F8),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      Icons.edit_note_rounded,
                      color: theme.colorScheme.primary,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // ── Search bar ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                height: 46,
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F4FA),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Row(
                  children: [
                    SizedBox(width: 14),
                    Icon(
                      Icons.search_rounded,
                      color: Color(0xFFB0B0C3),
                      size: 20,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Search',
                      style: TextStyle(
                        color: Color(0xFFB0B0C3),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            // ── Contact list ──
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: chatStore,
                builder: (context, map, _) {
                  return ListView.separated(
                    padding: const EdgeInsets.only(top: 4, bottom: 20),
                    itemCount: mockContacts.length,
                    separatorBuilder: (_, __) => Padding(
                      padding: const EdgeInsets.only(left: 82, right: 24),
                      child: Divider(
                        height: 1,
                        thickness: 0.6,
                        color: const Color(0xFFE8E8F0),
                      ),
                    ),
                    itemBuilder: (context, i) {
                      final c = mockContacts[i];
                      final msgs = map[c.id] ?? const <dynamic>[];
                      final last = msgs.isEmpty ? null : msgs.last;

                      return ContactCard(
                        name: c.name,
                        avatarUrl: c.avatar,
                        lastMessage: last?.text ?? 'No messages yet',
                        timeLabel: last == null
                            ? ''
                            : formatChatTime(last.sentAt),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ChatScreen(contact: c),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
