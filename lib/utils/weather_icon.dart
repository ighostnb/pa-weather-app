class WeatherIcon {
  String getWeatherIcon(String main) {
    switch (main) {
      case 'Thunderstorm':
        return 'assets/thunderstorm.svg';
      case 'Drizzle':
        return 'assets/drizzle.svg';
      case 'Rain':
        return 'assets/rain.svg';
      case 'Snow':
        return 'assets/snow.svg';
      case 'Clear':
        return 'assets/clear.svg';
      case 'Clouds':
        return 'assets/clouds.svg';
      default:
        return 'assets/clear.svg';
    }
  }
}
