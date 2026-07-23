import 'owner_model.dart';

class Vehicle {
  final String id;
  final String brand;
  final String model;
  final int year;
  final double pricePerDay;
  final double rating;
  final int reviewCount;
  final String fuelType;
  final String transmission;
  final int seats;
  final String color;
  final String location;
  final bool isAvailable;
  final String description;
  final List<String> imageUrls;
  final List<String> features;
  final String category; // e.g., 'Luxury', 'SUV', 'Electric', 'Economy'
  final bool isFeatured;
  final Owner owner;

  const Vehicle({
    required this.id,
    required this.brand,
    required this.model,
    required this.year,
    required this.pricePerDay,
    required this.rating,
    required this.reviewCount,
    required this.fuelType,
    required this.transmission,
    required this.seats,
    required this.color,
    required this.location,
    required this.isAvailable,
    required this.description,
    required this.imageUrls,
    required this.features,
    required this.category,
    this.isFeatured = false,
    required this.owner,
  });

  String get fullName => '$brand $model $year';
}
