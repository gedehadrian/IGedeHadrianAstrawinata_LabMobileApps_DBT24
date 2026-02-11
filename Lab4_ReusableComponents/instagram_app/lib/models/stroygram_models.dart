class StorygramModel {
  final String id;
  final String username;
  final String avatarUrl;
  final bool hasStory;
  final bool isYou;

  StorygramModel({
    required this.id,
    required this.username,
    required this.avatarUrl,
    this.hasStory = true,
    this.isYou = false,
  });
}
