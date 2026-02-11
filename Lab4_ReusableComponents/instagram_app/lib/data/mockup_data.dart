import '../models/stroygram_models.dart';
import '../models/post_models.dart';

// ── Stories ──
final List<StorygramModel> mockStories = [
  StorygramModel(
    id: '0',
    username: 'Your story',
    avatarUrl: 'https://i.pravatar.cc/150?img=0',
    isYou: true,
    hasStory: false,
  ),
  StorygramModel(
    id: '1',
    username: 'titohayunanda',
    avatarUrl: 'https://i.pravatar.cc/150?img=11',
  ),
  StorygramModel(
    id: '2',
    username: 'ombentrader',
    avatarUrl: 'https://i.pravatar.cc/150?img=12',
  ),
  StorygramModel(
    id: '3',
    username: 'rita_efendi',
    avatarUrl: 'https://i.pravatar.cc/150?img=5',
  ),
  StorygramModel(
    id: '4',
    username: 'john_doe',
    avatarUrl: 'https://i.pravatar.cc/150?img=8',
  ),
  StorygramModel(
    id: '5',
    username: 'sarah_smith',
    avatarUrl: 'https://i.pravatar.cc/150?img=9',
  ),
  StorygramModel(
    id: '6',
    username: 'mike_dev',
    avatarUrl: 'https://i.pravatar.cc/150?img=14',
  ),
];

// ── Posts ──
final List<PostModel> mockPosts = [
  PostModel(
    id: '1',
    username: 'sahamtigapersen',
    userAvatar: 'https://i.pravatar.cc/150?img=20',
    imageUrl: 'https://picsum.photos/seed/post1/600/600',
    caption: 'Performa saham terbaik minggu ini! 🚀📈',
    likes: 851,
    comments: 21,
    timeAgo: '2 hours ago',
    musicLabel: 'Hensonn · Sahara',
    suggestedLabel: 'Suggested for you',
  ),
  PostModel(
    id: '2',
    username: 'travel_vibes',
    userAvatar: 'https://i.pravatar.cc/150?img=15',
    imageUrl: 'https://picsum.photos/seed/post2/600/600',
    caption: 'Beautiful sunset at the beach 🌅',
    likes: 2341,
    comments: 89,
    timeAgo: '5 hours ago',
  ),
  PostModel(
    id: '3',
    username: 'foodie_daily',
    userAvatar: 'https://i.pravatar.cc/150?img=16',
    imageUrl: 'https://picsum.photos/seed/post3/600/600',
    caption: 'Homemade pasta for dinner tonight 🍝',
    likes: 567,
    comments: 34,
    timeAgo: '8 hours ago',
    suggestedLabel: 'Suggested for you',
  ),
  PostModel(
    id: '4',
    username: 'tech_news',
    userAvatar: 'https://i.pravatar.cc/150?img=17',
    imageUrl: 'https://picsum.photos/seed/post4/600/600',
    caption: 'Flutter 4.0 is here! What do you think? 💙',
    likes: 4200,
    comments: 312,
    timeAgo: '1 day ago',
  ),
];

// ── Chat contacts ──
class ChatContact {
  final String id;
  final String username;
  final String avatarUrl;
  final String subtitle;
  final bool isOnline;
  final bool hasUnread;

  ChatContact({
    required this.id,
    required this.username,
    required this.avatarUrl,
    required this.subtitle,
    this.isOnline = false,
    this.hasUnread = false,
  });
}

final List<ChatContact> mockChatContacts = [
  ChatContact(
    id: '1',
    username: 'Doffannoel Sihotang',
    avatarUrl: 'https://i.pravatar.cc/150?img=11',
    subtitle: 'Seen 2h ago',
    isOnline: true,
  ),
  ChatContact(
    id: '2',
    username: 'Lexx',
    avatarUrl: 'https://i.pravatar.cc/150?img=12',
    subtitle: 'coba yan bauin orang eropa · 22h',
    hasUnread: true,
  ),
  ChatContact(
    id: '3',
    username: 'F',
    avatarUrl: 'https://i.pravatar.cc/150?img=22',
    subtitle: 'Active 12m ago',
  ),
  ChatContact(
    id: '4',
    username: 'ハドリアン',
    avatarUrl: 'https://i.pravatar.cc/150?img=25',
    subtitle: 'Active 1h ago',
  ),
  ChatContact(
    id: '5',
    username: 'Jessica',
    avatarUrl: 'https://i.pravatar.cc/150?img=5',
    subtitle: 'Sent a reel · 3h',
    isOnline: true,
  ),
  ChatContact(
    id: '6',
    username: 'Bryan K',
    avatarUrl: 'https://i.pravatar.cc/150?img=8',
    subtitle: 'Active 30m ago',
    hasUnread: true,
  ),
];

// ── Chat messages for detail ──
class ChatMessageData {
  final String text;
  final bool isMe;
  final String time;

  ChatMessageData({required this.text, required this.isMe, required this.time});
}

final List<ChatMessageData> mockMessages = [
  ChatMessageData(text: 'Hey! What\'s up?', isMe: false, time: '10:30'),
  ChatMessageData(
    text: 'Not much, just chilling. You?',
    isMe: true,
    time: '10:31',
  ),
  ChatMessageData(
    text: 'Same here, watching reels all day 😂',
    isMe: false,
    time: '10:32',
  ),
  ChatMessageData(text: 'Haha relatable 😅', isMe: true, time: '10:33'),
  ChatMessageData(
    text: 'Have you seen the new update?',
    isMe: false,
    time: '10:35',
  ),
  ChatMessageData(
    text: 'Yeah it looks pretty cool!',
    isMe: true,
    time: '10:36',
  ),
  ChatMessageData(
    text: 'We should hang out this weekend',
    isMe: false,
    time: '10:40',
  ),
  ChatMessageData(
    text: 'Sure! Let me know when you\'re free',
    isMe: true,
    time: '10:41',
  ),
];
