void main() {
  // Without exception handling
  String forecast = WeatherService.getForecast();
  print(forecast);

  // With exception handling
  try {
    String forecast = WeatherService.getForecast();
    print(forecast);
  } catch (reason, stack) {
    print("Exception thrown $reason");
    print("Call stack $stack");
  }
}

// Fake weather service created for example above
class WeatherService {
  static String getForecast() {
    throw "Lost connection"; // Throws an exception
  }
}
