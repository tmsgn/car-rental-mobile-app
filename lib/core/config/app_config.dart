class AppConfig {
  /// Feature flag to toggle between mock data and real API calls.
  /// When true, repositories will return data from mock_data/ instead of making HTTP requests.
  /// Set to false when connecting to the Laravel backend.
  static const bool useMockData = true;

  // Add other global configurations here if needed (e.g., API base URL)
  static const String apiBaseUrl = 'https://api.driveease.com/v1';
}
