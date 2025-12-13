import 'package:xray_flutter/core/utils.dart';
import 'package:xray_flutter/data/config/routing_item_dto.dart';
import 'package:xray_flutter/data/config/sub_item_dto.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/data/model/profile_item_factory.dart';
import 'package:xray_flutter/di/app_config_provider.dart';
import 'package:xray_flutter/domain/repo/profile_repo.dart';

class StoreService {
  final AppConfigNotifier _appConfigNotifier;
  final ProfileRepo _profileRepo;
  StoreService(this._appConfigNotifier, this._profileRepo);

  Future<void> init() async {
    if (_appConfigNotifier.manager.config.stateItem.profileId.isEmpty) {
      final profiles = await _profileRepo.getAllProfiles();
      if (profiles.isNotEmpty) {
        await updateActiveProfile(profiles.first.indexId);
      }
    }
    if (_appConfigNotifier.manager.config.stateItem.routingId.isEmpty) {
      final routingItems = _appConfigNotifier.manager.config.routingItems;
      if (routingItems.isNotEmpty) {
        final newConfig = _appConfigNotifier.manager.config.copyWith(
          stateItem: _appConfigNotifier.manager.config.stateItem.copyWith(
            routingId: routingItems.first.id,
          ),
        );
        await _appConfigNotifier.update(newConfig);
      }
    }
  }

  Future<ProfileItemData?> getCurrentProfile() async {
    final profileId = _appConfigNotifier.manager.config.stateItem.profileId;
    return await _profileRepo.getProfileById(profileId);
  }

  Future<void> deleteProfile(String profileId) async {
    final currentConfig = _appConfigNotifier.manager.config;
    if (currentConfig.stateItem.profileId == profileId) {
      final newConfig = currentConfig.copyWith(
        stateItem: currentConfig.stateItem.copyWith(profileId: ''),
      );
      await _appConfigNotifier.update(newConfig);
    }
    await _profileRepo.deleteProfile(profileId);
  }

  Future<void> upsertProfile(ProfileItemData profile) async {
    await _profileRepo.upsertProfile(profile);

    if (_appConfigNotifier.manager.config.stateItem.profileId == '') {
      await updateActiveProfile(profile.indexId);
    }
    // if (_appConfigNotifier.manager.config.stateItem.profileId ==
    //     profile.indexId) {
    //   // restart services if needed
    // }
  }

  Future<void> updateActiveProfile(String newActiveProfileId) async {
    var config = _appConfigNotifier.manager.config;

    if (newActiveProfileId != config.stateItem.profileId) {
      await _appConfigNotifier.update(
        config.copyWith(
          stateItem: config.stateItem.copyWith(
            profileId: newActiveProfileId,
          ),
        ),
      );
    }
  }

  Future<ProfileItemData> generateNewProfile() async {
    var orderIndex = await _profileRepo.getMaxOrderIndex();
    final newProfile = ProfileItemFactory.createDefault(Utils.generateUUID(), orderIndex);
    return newProfile;
  }

  Future<int> reorderProfile(int oldIndex, int newIndex) async {
    final result = await _profileRepo.reorderProfile(oldIndex, newIndex);
    return result;
  }

  // ---

  Future<void> deleteProfilesBySubId(String subId) async {
    final currentProfile = await getCurrentProfile();
    if (currentProfile != null && currentProfile.subid == subId) {
      final newConfig = _appConfigNotifier.manager.config.copyWith(
        stateItem: _appConfigNotifier.manager.config.stateItem.copyWith(
          profileId: '',
        ),
      );
      await _appConfigNotifier.update(newConfig);
    }
    await _profileRepo.deleteProfilesBySubId(subId);
  }

  SubItemDto? getCurrentSubItem() {
    final subId = _appConfigNotifier.manager.config.stateItem.subId;
    final subItems = _appConfigNotifier.manager.config.subItems;
    try {
      return subItems.firstWhere((element) => element.subId == subId);
    } catch (e) {
      return null;
    }
  }

  SubItemDto? getSubItemById(String subId) {
    final subItems = _appConfigNotifier.manager.config.subItems;
    try {
      return subItems.firstWhere((element) => element.subId == subId);
    } catch (e) {
      return null;
    }
  }

  Future<void> deleteSubItemById(String subId) async {
    final currentConfig = _appConfigNotifier.manager.config;
    final newSubItems = [
      ...currentConfig.subItems.where((element) => element.subId != subId),
    ];
    var newConfig = currentConfig.copyWith(subItems: newSubItems);
    if (currentConfig.stateItem.subId == subId) {
      newConfig = newConfig.copyWith(
        stateItem: currentConfig.stateItem.copyWith(subId: ''),
      );
    }
    await _appConfigNotifier.update(newConfig);
  }

  Future<void> deleteSub(String subId) async {
    await _profileRepo.deleteProfilesBySubId(subId);
    await deleteSubItemById(subId);
  }

  Future<void> upsertSubItem(SubItemDto item) async {
    final currentConfig = _appConfigNotifier.manager.config;
    final subItems = [...currentConfig.subItems];

    final index = subItems.indexWhere((e) => e.subId == item.subId);

    if (index >= 0) {
      subItems[index] = item;
    } else {
      subItems.add(item);
    }

    final newConfig = currentConfig.copyWith(subItems: subItems);
    await _appConfigNotifier.update(newConfig);

    // if (currentConfig.stateItem.subId == item.subId) {
    //   // restart services if needed
    // }
  }

  Future<void> updateActiveSub(String newActiveSubId) async {
    var config = _appConfigNotifier.manager.config;

    if (config.subItems.isNotEmpty &&
        newActiveSubId != config.stateItem.subId) {
      await _appConfigNotifier.update(
        config.copyWith(
          stateItem: config.stateItem.copyWith(subId: newActiveSubId),
        ),
      );
    }

    // may restart services if proxy-chained changed in future
  }

  // ---
  RoutingItemDto? getCurrentRoutingItem() {
    final routingId = _appConfigNotifier.manager.config.stateItem.routingId;
    final routingItems = _appConfigNotifier.manager.config.routingItems;
    try {
      return routingItems.firstWhere((element) => element.id == routingId);
    } catch (e) {
      return null;
    }
  }

  RoutingItemDto? getRoutingItemById(String routingId) {
    final routingItems = _appConfigNotifier.manager.config.routingItems;
    try {
      return routingItems.firstWhere((element) => element.id == routingId);
    } catch (e) {
      return null;
    }
  }

  Future<void> updateActiveRouting(String newRoutingId) async {
    var config = _appConfigNotifier.manager.config;

    if (config.routingItems.isNotEmpty &&
        newRoutingId != config.stateItem.routingId) {
      await _appConfigNotifier.update(
        config.copyWith(
          stateItem: config.stateItem.copyWith(routingId: newRoutingId),
        ),
      );
    }
    // restart services if needed
  }

  Future<void> upsertRoutingItem(RoutingItemDto item) async {
    final currentConfig = _appConfigNotifier.manager.config;
    final routingItems = [...currentConfig.routingItems];

    final index = routingItems.indexWhere((e) => e.id == item.id);

    if (index >= 0) {
      routingItems[index] = item;
    } else {
      routingItems.add(item);
    }

    final newConfig = currentConfig.copyWith(routingItems: routingItems);
    await _appConfigNotifier.update(newConfig);

    // if (currentConfig.stateItem.routingId == item.id) {
    //   // restart services if needed
    // }
  }

  Future<void> deleteRoutingItemById(String routingId) async {
    final currentConfig = _appConfigNotifier.manager.config;
    final newRoutingItems = [
      ...currentConfig.routingItems
          .where((element) => element.id != routingId),
    ];
    var newConfig = currentConfig.copyWith(routingItems: newRoutingItems);
    if (currentConfig.stateItem.routingId == routingId) {
      newConfig = newConfig.copyWith(
        stateItem: currentConfig.stateItem.copyWith(routingId: ''),
      );
    }
    await _appConfigNotifier.update(newConfig);
    // restart services if needed
  }
}
