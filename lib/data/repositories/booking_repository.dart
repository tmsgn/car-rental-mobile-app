import '../../core/config/app_config.dart';
import '../../models/booking_model.dart';
import '../../mock_data/mock_data.dart';
import '../models/api_models.dart';

class BookingRepository {
  static final BookingRepository instance = BookingRepository._internal();
  BookingRepository._internal();

  Future<void> _simulateNetworkDelay() async {
    await Future.delayed(const Duration(milliseconds: 800));
  }

  Future<ApiResponse<List<Booking>>> getUserBookings() async {
    if (AppConfig.useMockData) {
      await _simulateNetworkDelay();
      final allBookings = [...mockUpcomingBookings, ...mockPastBookings];
      return ApiResponse.success(allBookings);
    } else {
      // TODO: Implement Laravel API call
      throw UnimplementedError('API call not implemented');
    }
  }

  Future<ApiResponse<Booking>> getBookingById(String id) async {
    if (AppConfig.useMockData) {
      await _simulateNetworkDelay();
      try {
        final allBookings = [...mockUpcomingBookings, ...mockPastBookings];
        final booking = allBookings.firstWhere((b) => b.id == id);
        return ApiResponse.success(booking);
      } catch (e) {
        return ApiResponse.error(ApiError(statusCode: 404, message: 'Booking not found'));
      }
    } else {
      // TODO: Implement Laravel API call
      throw UnimplementedError('API call not implemented');
    }
  }

  Future<ApiResponse<Booking>> createBooking(Booking booking) async {
    if (AppConfig.useMockData) {
      await _simulateNetworkDelay();
      // Mock creation: simply return the booking back with success
      return ApiResponse.success(booking);
    } else {
      // TODO: Implement Laravel API call
      throw UnimplementedError('API call not implemented');
    }
  }

  Future<ApiResponse<bool>> cancelBooking(String bookingId) async {
    if (AppConfig.useMockData) {
      await _simulateNetworkDelay();
      return ApiResponse.success(true);
    } else {
      // TODO: Implement Laravel API call
      throw UnimplementedError('API call not implemented');
    }
  }
}
