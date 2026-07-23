import '../models/user_model.dart';
import '../models/review_model.dart';
import '../models/booking_model.dart';
import '../models/payment_method_model.dart';
import '../models/coupon_model.dart';
import 'mock_vehicles.dart';
export 'mock_vehicles.dart';

final User mockCurrentUser = User(
  id: 'u1',
  fullName: 'Alex Johnson',
  email: 'alex.johnson@example.com',
  phone: '+1 555-0123',
  profileImageUrl: 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&q=80&w=200',
  isVerified: true,
  memberSince: DateTime.now().subtract(const Duration(days: 365)),
  rewardPoints: 1250,
);

final List<Review> mockReviews = [
  Review(
    id: 'r1',
    vehicleId: mockVehicles[0].id,
    userName: 'Sarah M.',
    userProfileImageUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&q=80&w=200',
    rating: 5.0,
    comment: 'Absolutely amazing car! It was super clean, drove perfectly, and the pickup process was a breeze. Highly recommend.',
    date: DateTime.now().subtract(const Duration(days: 2)),
  ),
  Review(
    id: 'r2',
    vehicleId: mockVehicles[0].id,
    userName: 'Michael T.',
    userProfileImageUrl: 'https://images.unsplash.com/photo-1599566150163-29194dcaad36?auto=format&fit=crop&q=80&w=200',
    rating: 4.0,
    comment: 'Great car for the weekend trip. Only giving 4 stars because the location was slightly hard to find, but the vehicle itself was flawless.',
    date: DateTime.now().subtract(const Duration(days: 15)),
  ),
];

final List<Booking> mockUpcomingBookings = [
  Booking(
    id: 'b1',
    vehicle: mockVehicles[5],
    pickupDate: DateTime.now().add(const Duration(days: 5)),
    returnDate: DateTime.now().add(const Duration(days: 8)),
    pickupLocation: mockVehicles[5].location,
    returnLocation: mockVehicles[5].location,
    totalAmount: mockVehicles[5].pricePerDay * 3 + 45.0, // base + fees
    status: BookingStatus.upcoming,
    bookingReference: 'BKG-847291',
  ),
];

final List<Booking> mockPastBookings = [
  Booking(
    id: 'b2',
    vehicle: mockVehicles[12],
    pickupDate: DateTime.now().subtract(const Duration(days: 20)),
    returnDate: DateTime.now().subtract(const Duration(days: 18)),
    pickupLocation: mockVehicles[12].location,
    returnLocation: mockVehicles[12].location,
    totalAmount: mockVehicles[12].pricePerDay * 2 + 30.0,
    status: BookingStatus.completed,
    bookingReference: 'BKG-192837',
  ),
];

final List<PaymentMethod> mockPaymentMethods = [
  const PaymentMethod(
    id: 'pm1',
    type: PaymentMethodType.visa,
    last4: '4242',
    expiryDate: '12/26',
    isDefault: true,
  ),
  const PaymentMethod(
    id: 'pm2',
    type: PaymentMethodType.applePay,
  ),
];

final List<Coupon> mockCoupons = [
  Coupon(
    id: 'c1',
    code: 'WELCOME20',
    description: 'Get 20% off your first luxury rental',
    type: DiscountType.percentage,
    value: 20.0,
    expiryDate: DateTime.now().add(const Duration(days: 30)),
    minSpend: 150.0,
  ),
  Coupon(
    id: 'c2',
    code: 'WEEKEND50',
    description: '\$50 off any weekend trip',
    type: DiscountType.fixed,
    value: 50.0,
    expiryDate: DateTime.now().add(const Duration(days: 14)),
  ),
];
