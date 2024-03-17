import 'package:get/get.dart';

class ApiSocketException implements Exception {
  ApiSocketException();
  @override
  String toString() => "connection_error".tr;
}
