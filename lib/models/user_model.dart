class User {
  final String id;
  final String fullName;
  final String email;
  final String phone;
  final String profileImageUrl;
  final bool isVerified;
  final DateTime memberSince;
  final int rewardPoints;

  const User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.profileImageUrl,
    this.isVerified = false,
    required this.memberSince,
    this.rewardPoints = 0,
  });
}
