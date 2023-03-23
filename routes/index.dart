import 'dart:async';
import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';
import 'package:get_it/get_it.dart';

import '../data/postgres_database.dart';

FutureOr<Response> onRequest(RequestContext context) async {
  final locator = await context.read<Future<GetIt>>();

  final database = locator<MongoDatabase>();
  final response = await database.getStuff();

  return Response(body: json.encode(response));
}
