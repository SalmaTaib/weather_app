import 'dart:convert';

class Location {
  double lat = 0;
  double lon = 0;
  String city = '';
  String country = '';

  Location({required this.lat, required this.lon});

  void setLatLon(double lat, double lon) {
    this.lat = lat;
    this.lon = lon;
  }

  void setCityCountry(dynamic data) {
    data = jsonDecode(data);
    city = data['location']['name'];
    country = data['location']['country'];
  }
}
