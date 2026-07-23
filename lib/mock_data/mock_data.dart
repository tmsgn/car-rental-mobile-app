import '../models/user_model.dart';
import '../models/review_model.dart';
import '../models/booking_model.dart';
import '../models/payment_method_model.dart';
import '../models/coupon_model.dart';
import '../models/branch_model.dart';
import '../models/transaction_model.dart';
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
  Review(
    id: 'r3',
    vehicleId: mockVehicles[2].id,
    userName: 'Emily R.',
    userProfileImageUrl: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?auto=format&fit=crop&q=80&w=200',
    rating: 4.5,
    comment: 'Smooth ride, very comfortable for a road trip with the family. Host was incredibly helpful with directions.',
    date: DateTime.now().subtract(const Duration(days: 8)),
  ),
  Review(
    id: 'r4',
    vehicleId: mockVehicles[4].id,
    userName: 'James L.',
    userProfileImageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&q=80&w=200',
    rating: 5.0,
    comment: 'This car exceeded all my expectations. The interior was immaculate and it handled like a dream on the highway.',
    date: DateTime.now().subtract(const Duration(days: 4)),
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
    totalAmount: mockVehicles[5].pricePerDay * 3 + 45.0,
    status: BookingStatus.pending,
    bookingReference: 'BKG-847291',
  ),
  Booking(
    id: 'b3',
    vehicle: mockVehicles[18],
    pickupDate: DateTime.now().add(const Duration(days: 12)),
    returnDate: DateTime.now().add(const Duration(days: 14)),
    pickupLocation: mockVehicles[18].location,
    returnLocation: mockVehicles[18].location,
    totalAmount: mockVehicles[18].pricePerDay * 2 + 35.0,
    status: BookingStatus.pending,
    bookingReference: 'BKG-563018',
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
  Booking(
    id: 'b4',
    vehicle: mockVehicles[30],
    pickupDate: DateTime.now().subtract(const Duration(days: 45)),
    returnDate: DateTime.now().subtract(const Duration(days: 42)),
    pickupLocation: mockVehicles[30].location,
    returnLocation: mockVehicles[30].location,
    totalAmount: mockVehicles[30].pricePerDay * 3 + 50.0,
    status: BookingStatus.completed,
    bookingReference: 'BKG-739105',
  ),
  Booking(
    id: 'b5',
    vehicle: mockVehicles[8],
    pickupDate: DateTime.now().subtract(const Duration(days: 60)),
    returnDate: DateTime.now().subtract(const Duration(days: 57)),
    pickupLocation: mockVehicles[8].location,
    returnLocation: mockVehicles[8].location,
    totalAmount: mockVehicles[8].pricePerDay * 3 + 40.0,
    status: BookingStatus.cancelled,
    bookingReference: 'BKG-420156',
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
    type: PaymentMethodType.mastercard,
    last4: '8819',
    expiryDate: '03/27',
  ),
  const PaymentMethod(
    id: 'pm3',
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
  Coupon(
    id: 'c3',
    code: 'SUMMER15',
    description: '15% off all SUV rentals this summer',
    type: DiscountType.percentage,
    value: 15.0,
    expiryDate: DateTime.now().add(const Duration(days: 60)),
    minSpend: 100.0,
  ),
];

final List<Branch> mockBranches = [
  const Branch(
    id: 'br1',
    name: 'DriveEase Downtown',
    address: '350 5th Avenue, Suite 4200',
    city: 'New York, NY',
    phone: '+1 (212) 555-0100',
    email: 'downtown@driveease.com',
    latitude: 40.7484,
    longitude: -73.9857,
    imageUrl: 'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&q=80&w=800',
    openingHours: 'Mon–Fri: 7AM–9PM\nSat–Sun: 8AM–6PM',
    isOpen: true,
    availableVehicles: 42,
    rating: 4.8,
  ),
  const Branch(
    id: 'br2',
    name: 'DriveEase LAX Airport',
    address: '9800 Airport Blvd, Terminal 1',
    city: 'Los Angeles, CA',
    phone: '+1 (310) 555-0200',
    email: 'lax@driveease.com',
    latitude: 33.9416,
    longitude: -118.4085,
    imageUrl: 'https://images.unsplash.com/photo-1570168007204-dfb528c6958f?auto=format&fit=crop&q=80&w=800',
    openingHours: 'Open 24 Hours',
    isOpen: true,
    availableVehicles: 78,
    rating: 4.6,
  ),
  const Branch(
    id: 'br3',
    name: 'DriveEase Miami Beach',
    address: '1100 Collins Avenue',
    city: 'Miami, FL',
    phone: '+1 (305) 555-0300',
    email: 'miami@driveease.com',
    latitude: 25.7825,
    longitude: -80.1304,
    imageUrl: 'https://images.unsplash.com/photo-1533106497176-45ae19e68ba2?auto=format&fit=crop&q=80&w=800',
    openingHours: 'Mon–Fri: 8AM–8PM\nSat–Sun: 9AM–5PM',
    isOpen: true,
    availableVehicles: 35,
    rating: 4.9,
  ),
  const Branch(
    id: 'br4',
    name: 'DriveEase Chicago Loop',
    address: '233 S Wacker Drive',
    city: 'Chicago, IL',
    phone: '+1 (312) 555-0400',
    email: 'chicago@driveease.com',
    latitude: 41.8788,
    longitude: -87.6359,
    imageUrl: 'https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?auto=format&fit=crop&q=80&w=800',
    openingHours: 'Mon–Fri: 7AM–8PM\nSat: 8AM–6PM\nSun: Closed',
    isOpen: false,
    availableVehicles: 28,
    rating: 4.7,
  ),
  const Branch(
    id: 'br5',
    name: 'DriveEase San Francisco',
    address: '101 Market Street, Suite 300',
    city: 'San Francisco, CA',
    phone: '+1 (415) 555-0500',
    email: 'sf@driveease.com',
    latitude: 37.7937,
    longitude: -122.3965,
    imageUrl: 'https://images.unsplash.com/photo-1501594907352-04cda38ebc29?auto=format&fit=crop&q=80&w=800',
    openingHours: 'Mon–Sat: 7AM–9PM\nSun: 9AM–5PM',
    isOpen: true,
    availableVehicles: 51,
    rating: 4.8,
  ),
];

final List<Transaction> mockTransactions = [
  Transaction(
    id: 'txn1',
    bookingReference: 'BKG-847291',
    vehicleName: mockVehicles[5].fullName,
    type: TransactionType.payment,
    status: TransactionStatus.successful,
    amount: mockVehicles[5].pricePerDay * 3 + 45.0,
    date: DateTime.now().subtract(const Duration(days: 1)),
    paymentMethod: 'Visa •••• 4242',
  ),
  Transaction(
    id: 'txn2',
    bookingReference: 'BKG-192837',
    vehicleName: mockVehicles[12].fullName,
    type: TransactionType.payment,
    status: TransactionStatus.successful,
    amount: mockVehicles[12].pricePerDay * 2 + 30.0,
    date: DateTime.now().subtract(const Duration(days: 20)),
    paymentMethod: 'Visa •••• 4242',
  ),
  Transaction(
    id: 'txn3',
    bookingReference: 'BKG-192837',
    vehicleName: mockVehicles[12].fullName,
    type: TransactionType.deposit,
    status: TransactionStatus.refunded,
    amount: 200.0,
    date: DateTime.now().subtract(const Duration(days: 18)),
    paymentMethod: 'Visa •••• 4242',
  ),
  Transaction(
    id: 'txn4',
    bookingReference: 'BKG-420156',
    vehicleName: mockVehicles[8].fullName,
    type: TransactionType.refund,
    status: TransactionStatus.successful,
    amount: mockVehicles[8].pricePerDay * 3 + 40.0,
    date: DateTime.now().subtract(const Duration(days: 58)),
    paymentMethod: 'Mastercard •••• 8819',
  ),
  Transaction(
    id: 'txn5',
    bookingReference: 'BKG-739105',
    vehicleName: mockVehicles[30].fullName,
    type: TransactionType.payment,
    status: TransactionStatus.successful,
    amount: mockVehicles[30].pricePerDay * 3 + 50.0,
    date: DateTime.now().subtract(const Duration(days: 45)),
    paymentMethod: 'Apple Pay',
  ),
];

final List<String> mockSavedAddresses = [
  '350 5th Avenue, New York, NY 10118',
  '742 Evergreen Terrace, Springfield, IL 62704',
  '1600 Pennsylvania Ave, Washington, DC 20500',
];
