import 'package:flutter/material.dart';
import '../models/stroygram_models.dart';

class Storygram extends StatelessWidget {
  final StorygramModel story;

  const Storygram({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: SizedBox(
        width: 76,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ── Avatar with gradient ring ──
            Stack(
              alignment: Alignment.center,
              children: [
                // Gradient ring (only if has story)
                if (story.hasStory)
                  Container(
                    width: 72,
                    height: 72,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Color(0xFFF58529), // orange
                          Color(0xFFDD2A7B), // pink
                          Color(0xFF8134AF), // purple
                        ],
                      ),
                    ),
                  ),

                // Black spacer ring
                Container(
                  width: story.hasStory ? 66 : 68,
                  height: story.hasStory ? 66 : 68,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                ),

                // Avatar image
                CircleAvatar(
                  radius: story.hasStory ? 30 : 31,
                  backgroundImage: NetworkImage(story.avatarUrl),
                  backgroundColor: const Color(0xFF262626),
                ),

                // "+" badge for "Your story"
                if (story.isYou)
                  Positioned(
                    bottom: 0,
                    right: 16,
                    child: Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 2.5),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 14,
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 6),

            // ── Username ──
            Text(
              story.username,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                color: Colors.white.withValues(alpha: 0.85),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
