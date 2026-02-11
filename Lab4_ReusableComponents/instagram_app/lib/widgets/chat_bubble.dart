import 'package:flutter/material.dart';
import '../data/mockup_data.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessageData message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isMe = message.isMe;

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(
          top: 3,
          bottom: 3,
          left: isMe ? 64 : 0,
          right: isMe ? 0 : 64,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        decoration: BoxDecoration(
          color: isMe
              ? const Color(0xFF3797F0) // Instagram blue for sent
              : const Color(0xFF262626), // Dark gray for received
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(22),
            topRight: const Radius.circular(22),
            bottomLeft: Radius.circular(isMe ? 22 : 4),
            bottomRight: Radius.circular(isMe ? 4 : 22),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              child: Text(
                message.text,
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.35,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              message.time,
              style: TextStyle(
                fontSize: 11,
                color: Colors.white.withValues(alpha: 0.50),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
