import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:learn_app/constants/app_constant.dart';
import 'package:learn_app/models/album.dart';
import 'package:learn_app/models/album_extension.dart';
import 'package:learn_app/models/todos.dart';

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

  // defined default headers

  final Map<String, dynamic> _defaultHeaders = {
    "Content-Type": "application/json",
  };
  // define options
  Options _getOptions({Map<String, dynamic>? headers, String? method}) {
    final mergedHeaders = <String, dynamic>{};
    mergedHeaders.addAll(_defaultHeaders);
    if (headers != null) {
      mergedHeaders.addAll(headers);
    }
    return Options(method: method, headers: mergedHeaders);
  }

  // http method : GET
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

  // http method : POST
  Future<String?> postRequest(Todos todos) async {
    final data = jsonEncode(todos.toMap());
    log("Data : $data");
    try {
      final response = await dio.post(
        "/todos",
        data: data,
        options: _getOptions(method: "POST"),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        return "Todo posted successfully!";
      } else {
        log("Failed to post todos. Status code: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      throw Exception("Error occurred during fetching : $e");
    }
  }
}
