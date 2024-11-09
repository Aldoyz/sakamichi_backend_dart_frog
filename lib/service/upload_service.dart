import 'dart:convert';
import 'dart:io';

import 'package:group_service_dart_frog/model/env.dart';
import 'package:group_service_dart_frog/util/response_message.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

class UploadService {
  static Logger log = Logger('UploadController');

  static Future<String> uploadImage(String imageFile, String imagePath) async {
    final albumHash = Env.sakamichiAlbumHash;
    final accessToken = Env.imgurAccessToken;
    final filePath = imagePath + imageFile;
    log.info('File Path : $filePath');
    try {
      final url = Uri.parse('https://api.imgur.com/3/image');
      final request = http.MultipartRequest('POST', url);
      request.headers['Authorization'] = 'Bearer $accessToken';
      request.fields['album'] = albumHash;
      request.files.add(await http.MultipartFile.fromPath('image', filePath));

      final response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final json = jsonDecode(responseBody);
        final imageUrl = json['data']['link'];
        log.info(imageUrl);
        return imageUrl.toString();
      } else {
        final responseBody = await response.stream.bytesToString();
        final json = jsonDecode(responseBody);
        log.info(json['data']['error']);
        return ResponseMessage.UPLOAD_FAILED.message;
      }
    } catch (e) {
      return throw PathNotFoundException(
        imagePath,
        const OSError(),
        'File path not found',
      );
    }
  }
}
