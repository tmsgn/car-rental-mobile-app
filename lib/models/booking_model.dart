import 'vehicle_model.dart';

enum BookingStatus { upcoming, active, completed, cancelled }

class Booking {
  final String id;
  final Vehicle vehicle;
  final DateTime pickupDate;
  final DateTime returnDate;
  final String pickupLocation;
  final String returnLocation;
  final double totalAmount;
  final BookingStatus status;
  final String bookingReference;

  const Booking({
    required this.id,
    required this.vehicle,
    required this.pickupDate,
    required this.returnDate,
    required this.pickupLocation,
    required this.returnLocation,
    required this.totalAmount,
    required this.status,
    required this.bookingReference,
  });

  int get durationInDays {
    return returnDate.difference(pickupDate).inDays;
  }
}
