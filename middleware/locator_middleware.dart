import 'package:dart_frog/dart_frog.dart';
import 'package:get_it/get_it.dart';

import '../app/setup_locator.dart';

GetIt? _locator;

Middleware locatorProvider() {
  print('locatorProvider setup.');
  return provider<Future<GetIt>>((context) async {
    return _locator ??= await setupLocator();
  });
}
