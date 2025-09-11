class FlavorConfig {
  final String flavor;
  final String apiUrl;

  // other config values

  static FlavorConfig? _instance;

  FlavorConfig._({required this.apiUrl, required this.flavor});

  static initialize({required String apiUrl, required String flavor}) {
    _instance = FlavorConfig._(apiUrl: apiUrl, flavor: flavor);
  }

  static FlavorConfig get instance {
    if (_instance == null) {
      throw Exception(
        "FlavorConfig not initialized. Call FlavorConfig.initialize() in your main_<flavor>.dart",
      );
    }
    return _instance!;
  }

  bool get isLocal => flavor.toUpperCase() == "LOCAL";
}
