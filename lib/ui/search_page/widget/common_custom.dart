import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CommonCustom {
  String? customerId;//id
  String? customerName;//名称
  CommonCustom(this.customerId,this.customerName);
}


