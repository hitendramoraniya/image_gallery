import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/image_model.dart';

class ImageRepository {
  final String _apiKey = '46348996-d8fd5f727ec439deef82fc54c';

  Future<List<ImageModel>> fetchImages(int page) async {
    final response = await http.get(Uri.parse(
      'https://pixabay.com/api/?key=$_apiKey&per_page=${kIsWeb ? 60 : 50}&page=$page',
    ));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['hits'];
      return data.map((image) => ImageModel.fromJson(image)).toList();
    } else {
      throw Exception('Failed to load images');
    }
  }
}
