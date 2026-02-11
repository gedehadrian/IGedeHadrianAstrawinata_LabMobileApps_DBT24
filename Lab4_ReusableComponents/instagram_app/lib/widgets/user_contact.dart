import 'package:flutter/material.dart';
import '../data/mockup_data.dart';

class UserContact extends StatelessWidget {
  final ChatContact contact;
  final VoidCallback? onTap;

  const UserContact({super.key, required this.contact, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.white10,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            // ── Avatar + online dot ──
            Stack(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(contact.avatarUrl),
                  backgroundColor: const Color(0xFF262626),
                ),
                if (contact.isOnline)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: const Color(0xFF4ADE80),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 3),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 14),

            // ── Name + subtitle ──
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contact.username,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: contact.hasUnread
                          ? FontWeight.w700
                          : FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    contact.subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: contact.hasUnread
                          ? FontWeight.w600
                          : FontWeight.w400,
                      color: contact.hasUnread
                          ? Colors.white
                          : Colors.white.withValues(alpha: 0.50),
                    ),
                  ),
                ],
              ),
            ),

            // ── Unread dot ──
            if (contact.hasUnread)
              Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.only(right: 12),
                decoration: const BoxDecoration(
                  color: Color(0xFF0095F6),
                  shape: BoxShape.circle,
                ),
              ),

            // ── Camera icon ──
            Icon(
              Icons.camera_alt_outlined,
              color: Colors.white.withValues(alpha: 0.55),
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
