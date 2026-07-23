class Review {
  final String id;
  final String vehicleId;
  final String userName;
  final String userProfileImageUrl;
  final double rating;
  final String comment;
  final DateTime date;

  const Review({
    required this.id,
    required this.vehicleId,
    required this.userName,
    required this.userProfileImageUrl,
    required this.rating,
    required this.comment,
    required this.date,
  });
}
