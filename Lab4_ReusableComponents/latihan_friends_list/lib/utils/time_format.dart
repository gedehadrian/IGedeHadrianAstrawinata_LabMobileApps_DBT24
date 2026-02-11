String formatChatTime(DateTime dt) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final date = DateTime(dt.year, dt.month, dt.day);
  final diff = today.difference(date).inDays;

  if (diff == 0) {
    int h = dt.hour;
    final m = dt.minute.toString().padLeft(2, '0');
    final suf = h >= 12 ? 'PM' : 'AM';
    h = h % 12;
    if (h == 0) h = 12;
    return '$h:$m $suf';
  }
  if (diff == 1) return 'Yesterday';
  return '${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}';
}

String formatMessageTime(DateTime dt) {
  int h = dt.hour;
  final m = dt.minute.toString().padLeft(2, '0');
  final suf = h >= 12 ? 'PM' : 'AM';
  h = h % 12;
  if (h == 0) h = 12;
  return '$h:$m $suf';
}
