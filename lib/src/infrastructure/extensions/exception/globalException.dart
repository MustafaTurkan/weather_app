import 'package:get/get.dart';

class GlobalException implements Exception {
  GlobalException();

  @override
  String toString() => "unexpected".tr;
}
