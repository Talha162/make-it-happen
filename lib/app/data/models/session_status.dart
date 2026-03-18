enum SessionStatus { completed, scheduled }

class SessionItem {
  final String title;
  final String date;
  final SessionStatus status;

  SessionItem({
    required this.title,
    required this.date,
    required this.status,
  });
}