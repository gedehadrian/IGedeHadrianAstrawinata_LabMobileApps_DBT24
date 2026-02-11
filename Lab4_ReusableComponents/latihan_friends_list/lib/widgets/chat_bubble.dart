import 'package:flutter/material.dart';
import '../utils/time_format.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isMe;
  final DateTime sentAt;
  final bool showTimestamp;

  const ChatBubble({
    super.key,
    required this.text,
    required this.isMe,
    required this.sentAt,
    this.showTimestamp = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    final time = formatMessageTime(sentAt);

    return Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 2),
      child: Column(
        children: [
          // ── Centered time separator ──
          if (showTimestamp)
            Padding(
              padding: const EdgeInsets.only(top: 14, bottom: 10),
              child: Text(
                time,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFFB0B0C3),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

          // ── Bubble ──
          Align(
            alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.72,
              ),
              child: Container(
                margin: EdgeInsets.only(
                  left: isMe ? 48 : 0,
                  right: isMe ? 0 : 48,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 11,
                ),
                decoration: BoxDecoration(
                  color: isMe ? primary : Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20),
                    topRight: const Radius.circular(20),
                    bottomLeft: Radius.circular(isMe ? 20 : 4),
                    bottomRight: Radius.circular(isMe ? 4 : 20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: (isMe ? primary : const Color(0xFF9E9EAF))
                          .withValues(alpha: 0.08),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Message text
                    Flexible(
                      child: Text(
                        text,
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.4,
                          color: isMe ? Colors.white : const Color(0xFF1E1E2D),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Inline time
                    Padding(
                      padding: const EdgeInsets.only(bottom: 1),
                      child: Text(
                        time,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: isMe
                              ? Colors.white.withValues(alpha: 0.65)
                              : const Color(0xFFB0B0C3),
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
