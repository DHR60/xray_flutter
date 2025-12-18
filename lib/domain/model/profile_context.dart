import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xray_flutter/data/config/core_item_dto.dart';
import 'package:xray_flutter/data/config/routing_item_dto.dart';
import 'package:xray_flutter/data/db/app_database.dart';

part 'profile_context.freezed.dart';

@freezed
abstract class ProfileContext with _$ProfileContext {
  const factory ProfileContext({
    required ProfileItemData profile,
    required RoutingItemDto? routingItem,
    required CoreItemDto? coreItem,
  }) = _ProfileContext;
}