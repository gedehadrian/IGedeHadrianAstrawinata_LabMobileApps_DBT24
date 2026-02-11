class PostModel {
  final String id;
  final String username;
  final String userAvatar;
  final String imageUrl;
  final String caption;
  final int likes;
  final int comments;
  final String timeAgo;
  final String? musicLabel;
  final String? suggestedLabel;

  PostModel({
    required this.id,
    required this.username,
    required this.userAvatar,
    required this.imageUrl,
    required this.caption,
    required this.likes,
    required this.comments,
    required this.timeAgo,
    this.musicLabel,
    this.suggestedLabel,
  });
}
