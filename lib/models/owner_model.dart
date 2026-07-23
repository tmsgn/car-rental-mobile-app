class Owner {
  final String id;
  final String name;
  final String profileImageUrl;
  final double rating;
  final int totalTrips;
  final bool isSuperHost;
  final DateTime memberSince;
  final String responseTime;
  final String responseRate;

  const Owner({
    required this.id,
    required this.name,
    required this.profileImageUrl,
    required this.rating,
    required this.totalTrips,
    this.isSuperHost = false,
    required this.memberSince,
    required this.responseTime,
    required this.responseRate,
  });
}
