class ApiResponse<T> {
  final bool success;
  final String? message;
  final T? data;
  final ApiError? error;

  ApiResponse({
    required this.success,
    this.message,
    this.data,
    this.error,
  });

  factory ApiResponse.success(T data, {String? message}) {
    return ApiResponse(
      success: true,
      message: message,
      data: data,
    );
  }

  factory ApiResponse.error(ApiError error, {String? message}) {
    return ApiResponse(
      success: false,
      message: message ?? error.message,
      error: error,
    );
  }
}

class PaginatedResponse<T> {
  final List<T> data;
  final int currentPage;
  final int lastPage;
  final int total;
  final int perPage;

  PaginatedResponse({
    required this.data,
    required this.currentPage,
    required this.lastPage,
    required this.total,
    required this.perPage,
  });

  bool get hasNextPage => currentPage < lastPage;
}

class ApiError {
  final int statusCode;
  final String message;
  final ValidationError? validationError;

  ApiError({
    required this.statusCode,
    required this.message,
    this.validationError,
  });
}

class ValidationError {
  final Map<String, List<String>> errors;

  ValidationError({required this.errors});

  String? getErrorFor(String field) {
    if (errors.containsKey(field) && errors[field]!.isNotEmpty) {
      return errors[field]!.first;
    }
    return null;
  }
}
