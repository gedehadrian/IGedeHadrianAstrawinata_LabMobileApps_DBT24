import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final String name;
  final String avatarUrl;
  final String lastMessage;
  final String timeLabel;
  final VoidCallback? onTap;

  const ContactCard({
    super.key,
    required this.name,
    required this.avatarUrl,
    required this.lastMessage,
    required this.timeLabel,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      splashColor: theme.colorScheme.primary.withValues(alpha: 0.06),
      highlightColor: theme.colorScheme.primary.withValues(alpha: 0.03),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          children: [
            // ── Avatar with subtle online dot ──
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: theme.colorScheme.primary.withValues(alpha: 0.08),
                  width: 2,
                ),
              ),
              child: CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(avatarUrl),
                backgroundColor: theme.colorScheme.surfaceContainerHighest,
              ),
            ),
            const SizedBox(width: 14),

            // ── Name + last message ──
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: const Color(0xFF1E1E2D),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        timeLabel,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF9E9EAF),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    lastMessage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: const Color(0xFF9E9EAF),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
