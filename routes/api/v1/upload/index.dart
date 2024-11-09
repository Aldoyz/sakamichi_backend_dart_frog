import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:group_service_dart_frog/controller/upload_controller.dart';
import 'package:group_service_dart_frog/model/api_response.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method == HttpMethod.post) {
    return UploadController.upload(context);
  } else {
    return Response.json(
      statusCode: HttpStatus.methodNotAllowed,
      body: ApiResponse.failed('Failed', 'Method not allowed'),
    );
  }
}
