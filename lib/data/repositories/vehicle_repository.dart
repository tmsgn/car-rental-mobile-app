import '../../core/config/app_config.dart';
import '../../models/vehicle_model.dart';
import '../../mock_data/mock_data.dart';
import '../models/api_models.dart';

class VehicleRepository {
  // Singleton pattern
  static final VehicleRepository instance = VehicleRepository._internal();
  VehicleRepository._internal();

  /// Simulates network latency
  Future<void> _simulateNetworkDelay() async {
    await Future.delayed(const Duration(milliseconds: 800));
  }

  Future<ApiResponse<List<Vehicle>>> getFeaturedVehicles() async {
    if (AppConfig.useMockData) {
      await _simulateNetworkDelay();
      final featured = mockVehicles.where((v) => v.isFeatured).take(5).toList();
      return ApiResponse.success(featured);
    } else {
      // TODO: Implement Laravel API call
      throw UnimplementedError('API call not implemented');
    }
  }

  Future<ApiResponse<List<Vehicle>>> getPopularVehicles() async {
    if (AppConfig.useMockData) {
      await _simulateNetworkDelay();
      final popular = mockVehicles.where((v) => v.rating >= 4.8).take(10).toList();
      return ApiResponse.success(popular);
    } else {
      // TODO: Implement Laravel API call
      throw UnimplementedError('API call not implemented');
    }
  }

  Future<ApiResponse<PaginatedResponse<Vehicle>>> getVehicles({
    int page = 1,
    int perPage = 10,
    String? search,
    String? category,
    // Add other filters as needed
  }) async {
    if (AppConfig.useMockData) {
      await _simulateNetworkDelay();
      
      List<Vehicle> filtered = mockVehicles;
      
      if (search != null && search.isNotEmpty) {
        filtered = filtered.where((v) => 
          v.fullName.toLowerCase().contains(search.toLowerCase()) ||
          v.brand.toLowerCase().contains(search.toLowerCase())
        ).toList();
      }

      // Simple pagination logic for mock data
      final startIndex = (page - 1) * perPage;
      final endIndex = startIndex + perPage;
      final paginatedData = filtered.sublist(
        startIndex,
        endIndex > filtered.length ? filtered.length : endIndex,
      );

      final paginatedResponse = PaginatedResponse<Vehicle>(
        data: paginatedData,
        currentPage: page,
        lastPage: (filtered.length / perPage).ceil(),
        total: filtered.length,
        perPage: perPage,
      );

      return ApiResponse.success(paginatedResponse);
    } else {
      // TODO: Implement Laravel API call
      throw UnimplementedError('API call not implemented');
    }
  }

  Future<ApiResponse<Vehicle>> getVehicleById(String id) async {
    if (AppConfig.useMockData) {
      await _simulateNetworkDelay();
      try {
        final vehicle = mockVehicles.firstWhere((v) => v.id == id);
        return ApiResponse.success(vehicle);
      } catch (e) {
        return ApiResponse.error(ApiError(statusCode: 404, message: 'Vehicle not found'));
      }
    } else {
      // TODO: Implement Laravel API call
      throw UnimplementedError('API call not implemented');
    }
  }
}
