import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'https://api.pexels.com/v1';
  final String _apiKey = 'AdT92sPyfZygyfCGd3YS3dNSXvyvLX5Q9MBvwARe9Y6f5245G6t0yj0F'; // Replace with your actual API key

  Future<List<String>> fetchImages(int page, int perPage) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/curated?page=$page&per_page=$perPage'),
      headers: {
        'Authorization': _apiKey,
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> photos = data['photos'];
      return photos.map((photo) => photo['src']['small'] as String).toList();
    } else {
      throw Exception('Failed to load images');
    }
  }
}
