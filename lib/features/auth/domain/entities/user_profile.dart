class UserProfile {
  const UserProfile({
    required this.id,
    required this.userId,
    required this.totalBookings,
    required this.averageBookingRating,
    required this.createdAt,
  });

  final String id;
  final String userId;
  final int totalBookings;
  final double? averageBookingRating;
  final DateTime createdAt;
}
