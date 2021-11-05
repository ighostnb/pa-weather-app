class Secret {
  final String apiKey;

  Secret({this.apiKey = ''});

  factory Secret.fromJson(Map<String, dynamic> json) =>
      Secret(apiKey: json['weather_api_key']);
}
