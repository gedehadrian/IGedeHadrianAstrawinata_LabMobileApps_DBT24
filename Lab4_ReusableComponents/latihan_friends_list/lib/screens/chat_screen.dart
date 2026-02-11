import 'package:flutter/material.dart';
import '../data/mockup_data.dart';
import '../models/contact_model.dart';
import '../widgets/chat_bubble.dart';

class ChatScreen extends StatefulWidget {
  final Contact contact;
  const ChatScreen({super.key, required this.contact});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _c = TextEditingController();

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contact = widget.contact;
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),

      // ── App bar ──
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(72),
        child: Container(
          color: Colors.white,
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
              child: Row(
                children: [
                  // Back
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 20,
                      color: Color(0xFF1E1E2D),
                    ),
                  ),

                  // Avatar
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: primary.withValues(alpha: 0.10),
                        width: 2,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 22,
                      backgroundImage: NetworkImage(contact.avatar),
                      backgroundColor:
                          theme.colorScheme.surfaceContainerHighest,
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Name + online
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          contact.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                            color: Color(0xFF1E1E2D),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Color(0xFF4ADE80),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              'Online',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF9E9EAF),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Call button
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF4F4FA),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.phone_rounded, color: primary, size: 20),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
          ),
        ),
      ),

      // ── Body ──
      body: Column(
        children: [
          // ── Messages ──
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: chatStore,
              builder: (context, map, _) {
                final msgs = (map[contact.id] ?? const []).cast<dynamic>();
                return ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                  itemCount: msgs.length,
                  itemBuilder: (context, i) {
                    final m = msgs[i];

                    // Show time separator when gap > 5 min
                    final showTime =
                        i == 0 ||
                        (msgs[i].sentAt as DateTime)
                                .difference(msgs[i - 1].sentAt as DateTime)
                                .inMinutes
                                .abs() >
                            5;

                    return ChatBubble(
                      text: m.text as String,
                      isMe: m.isMe as bool,
                      sentAt: m.sentAt as DateTime,
                      showTimestamp: showTime,
                    );
                  },
                );
              },
            ),
          ),

          // ── Input bar ──
          Container(
            color: Colors.white,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 10, 10, 14),
                child: Row(
                  children: [
                    // Emoji
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.emoji_emotions_outlined,
                      color: Color(0xFFB0B0C3),
                      size: 24,
                    ),
                    const SizedBox(width: 8),

                    // Text field
                    Expanded(
                      child: Container(
                        height: 46,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4F4FA),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: TextField(
                          controller: _c,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFF1E1E2D),
                          ),
                          decoration: const InputDecoration(
                            hintText: 'Type a message…',
                            hintStyle: TextStyle(
                              color: Color(0xFFB0B0C3),
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 12,
                            ),
                            isDense: true,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 6),

                    // Attachment
                    const Icon(
                      Icons.attach_file_rounded,
                      color: Color(0xFFB0B0C3),
                      size: 22,
                    ),

                    const SizedBox(width: 8),

                    // Send
                    GestureDetector(
                      onTap: () {
                        final text = _c.text.trim();
                        if (text.isEmpty) return;
                        chatStore.sendMessage(
                          contactId: contact.id,
                          text: text,
                        );
                        _c.clear();
                      },
                      child: Container(
                        width: 46,
                        height: 46,
                        decoration: BoxDecoration(
                          color: primary,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: primary.withValues(alpha: 0.30),
                              blurRadius: 14,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.send_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
