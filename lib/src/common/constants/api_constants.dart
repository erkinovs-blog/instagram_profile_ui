abstract class ApiConst {
  /// Secret Data
  static const baseUrl = String.fromEnvironment("base_url");
  static const apiKey = String.fromEnvironment("api_key");

  /// Paths
  static const photosPath = "$baseUrl/photos";
  static const randomPhotosPath = "$baseUrl/photos/random";

  /// Functions with Query
  static Map<String, List<String>> paginationQuery({
    required int limit,
    required int page,
  }) =>
      {
        "per_page": ["$limit"],
        "page": ["$page"],
      };

  static Map<String, List<String>> getRandomByCount({required int count}) => {
        "count": ["$count"],
      };

  /// Headers
  static Map<String, String> authorization() =>
      {"Authorization": "Client-ID $apiKey"};
}
