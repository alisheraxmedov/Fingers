String generateId() {
  final DateTime now = DateTime.now();
  return now.millisecondsSinceEpoch.toString();
}
