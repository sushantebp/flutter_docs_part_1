import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:learn_app/constants/app_constant.dart';
import 'package:learn_app/models/album.dart';
import 'package:learn_app/models/album_extension.dart';

class NetworkService {
  NetworkService._private();
  static final NetworkService _instance = NetworkService._private();
  factory NetworkService() => _instance;

  // defined dio with baseurl here
  final dio = Dio(
    BaseOptions(
      baseUrl: AppConstant.baseUrl,
      headers: {"Content-Type": "application/json"},
    ),
  );

  // http method
  Future<Album?> getRequest() async {
    try {
      final response = await dio.get("/4");
      if (response.statusCode == 200) {
        final albumFromJson = Album.fromJson(response.data);
        final albumDomain = albumFromJson.toAlbumDomain();
        return albumDomain;
      } else {
        log('Failed to load album. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      throw Exception("Error occurred during fetching : $e");
    }
  }
}
