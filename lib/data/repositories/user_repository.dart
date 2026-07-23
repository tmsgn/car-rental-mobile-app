import '../../core/config/app_config.dart';
import '../../models/user_model.dart';
import '../../mock_data/mock_data.dart';
import '../models/api_models.dart';

class UserRepository {
  static final UserRepository instance = UserRepository._internal();
  UserRepository._internal();

  Future<void> _simulateNetworkDelay() async {
    await Future.delayed(const Duration(milliseconds: 800));
  }

  Future<ApiResponse<User>> getCurrentUser() async {
    if (AppConfig.useMockData) {
      await _simulateNetworkDelay();
      return ApiResponse.success(mockCurrentUser);
    } else {
      // TODO: Implement Laravel API call
      throw UnimplementedError('API call not implemented');
    }
  }

  Future<ApiResponse<User>> login(String email, String password) async {
    if (AppConfig.useMockData) {
      await _simulateNetworkDelay();
      if (email == 'user@example.com' && password == 'password') {
        return ApiResponse.success(mockCurrentUser);
      }
      return ApiResponse.error(ApiError(statusCode: 401, message: 'Invalid credentials'));
    } else {
      // TODO: Implement Laravel API call
      throw UnimplementedError('API call not implemented');
    }
  }

  Future<ApiResponse<bool>> logout() async {
    if (AppConfig.useMockData) {
      await _simulateNetworkDelay();
      return ApiResponse.success(true);
    } else {
      // TODO: Implement Laravel API call
      throw UnimplementedError('API call not implemented');
    }
  }

  Future<ApiResponse<User>> updateProfile(User user) async {
    if (AppConfig.useMockData) {
      await _simulateNetworkDelay();
      return ApiResponse.success(user);
    } else {
      // TODO: Implement Laravel API call
      throw UnimplementedError('API call not implemented');
    }
  }
}
