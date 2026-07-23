import '../../core/config/app_config.dart';
import '../../models/transaction_model.dart';
import '../../mock_data/mock_data.dart';
import '../models/api_models.dart';

class TransactionRepository {
  static final TransactionRepository instance = TransactionRepository._internal();
  TransactionRepository._internal();

  Future<void> _simulateNetworkDelay() async {
    await Future.delayed(const Duration(milliseconds: 800));
  }

  Future<ApiResponse<List<Transaction>>> getUserTransactions() async {
    if (AppConfig.useMockData) {
      await _simulateNetworkDelay();
      return ApiResponse.success(mockTransactions);
    } else {
      // TODO: Implement Laravel API call
      throw UnimplementedError('API call not implemented');
    }
  }

  Future<ApiResponse<Transaction>> getTransactionById(String id) async {
    if (AppConfig.useMockData) {
      await _simulateNetworkDelay();
      try {
        final transaction = mockTransactions.firstWhere((t) => t.id == id);
        return ApiResponse.success(transaction);
      } catch (e) {
        return ApiResponse.error(ApiError(statusCode: 404, message: 'Transaction not found'));
      }
    } else {
      // TODO: Implement Laravel API call
      throw UnimplementedError('API call not implemented');
    }
  }
}
