import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restapi/core/extensions/context_extension.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/error/error_screen.dart';
import '../../../core/widgets/loading/loading_screen.dart';
import '../../../product/models/location/location_model.dart';
import '../provider/location_provider.dart';

part 'location_view_mixin.dart';
part '../widget/location_list.dart';
part '../widget/location_list_item.dart';

class LocationScreen extends ConsumerStatefulWidget {
  const LocationScreen({super.key});

  @override
  ConsumerState<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends ConsumerState<LocationScreen>
    with LocationViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lokasyonlar'),
      ),
      body: RefreshIndicator(
        onRefresh: () async => ref.read(locationsProvider.notifier).refresh(),
        child: _LocationList(
          scrollController: scrollController,
        ),
      ),
    );
  }
}
