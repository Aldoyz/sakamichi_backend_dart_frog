import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:group_service_dart_frog/model/api_response.dart';
import 'package:group_service_dart_frog/service/upload_service.dart';
import 'package:group_service_dart_frog/util/response_message.dart';
import 'package:group_service_dart_frog/util/validator.dart';
import 'package:logging/logging.dart';

class UploadController {
  static Logger log = Logger('UploadController');

  static Future<Response> upload(RequestContext context) async {
    final formData = await context.request.formData();
    final contentType = formData.files['image']!.contentType;
    log.info('File Content Type : $contentType');
    if (!contentType.toString().contains('image/') ||
        contentType.toString().contains('image/webp')) {
      return Response.json(
        statusCode: 400,
        body: ApiResponse.failed(
          'Failed',
          ResponseMessage.UNSUPPORTED_FILE_TYPE.message,
        ),
      );
    }
    final imageFile = formData.files['image']!;
    final imagePath = formData.fields['path']!;
    if (Validator.isNotNullOrEmpty(imageFile) &&
        Validator.isNotNullOrEmpty(imagePath)) {
      final filename = imageFile.name;
      try {
        final imageUrl = await UploadService.uploadImage(filename, imagePath);
        return Response.json(
          body: ApiResponse.successWithData(
            'Success',
            ResponseMessage.UPLOAD_SUCCESS.message,
            imageUrl,
          ),
        );
      } catch (e) {
        return Response.json(
          statusCode: 500,
          body: ApiResponse.failed(
            'Failed',
            ResponseMessage.UPLOAD_FAILED.message,
          ),
        );
      }
    } else {
      return Response.json(
        body: ApiResponse.failed(
          'Failed',
          ResponseMessage.MISSING_PARAMETER.message,
        ),
      );
    }
  }
}
