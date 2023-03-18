class PopularModel {
    PopularModel({
        required this.lat,
        required this.lon,
        required this.city,
        required this.state,
        required this.country,
    });

    final double lat;
    final double lon;
    final String city;
    final String state;
    final String country;

    PopularModel copyWith({
      double? lat,
      double? lon,
      String? city,
      String? state,
      String? country,
    }) => PopularModel(
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
    );
}