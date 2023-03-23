import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import 'middleware/locator_middleware.dart';

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) {
  print('run server entrypoint');
  return serve(
    handler.use(locatorProvider()),
    ip,
    port,
  );
}
