import 'package:dio/dio.dart';
import 'package:gp2/src/features/authentication/models/users.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
part 'web_services.g.dart';
@RestApi(baseUrl: 'http://localhost:3000/')
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @GET('user')
  Future<List<Users>> getAllUsers();
}
