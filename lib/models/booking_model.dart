import 'vehicle_model.dart';

enum BookingStatus {
  pending,
  awaitingPayment,
  confirmed,
  pickupReady,
  active,
  extended,
  completed,
  cancelled,
  rejected,
  expired,
  refunded
}

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

  String get statusLabel {
    switch (status) {
      case BookingStatus.pending:
        return 'Pending';
      case BookingStatus.awaitingPayment:
        return 'Awaiting Payment';
      case BookingStatus.confirmed:
        return 'Confirmed';
      case BookingStatus.pickupReady:
        return 'Pickup Ready';
      case BookingStatus.active:
        return 'Active';
      case BookingStatus.extended:
        return 'Extended';
      case BookingStatus.completed:
        return 'Completed';
      case BookingStatus.cancelled:
        return 'Cancelled';
      case BookingStatus.rejected:
        return 'Rejected';
      case BookingStatus.expired:
        return 'Expired';
      case BookingStatus.refunded:
        return 'Refunded';
    }
  }
}
