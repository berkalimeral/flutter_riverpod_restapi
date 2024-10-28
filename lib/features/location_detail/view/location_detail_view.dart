import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restapi/core/extensions/context_extension.dart';

import '../../../core/widgets/error/error_screen.dart';
import '../../../core/widgets/image_build/custom_image_build.dart';
import '../../../core/widgets/loading/loading_screen.dart';
import '../../../product/models/location/location_model.dart';
import '../provider/location_detail_provider.dart';
import '../provider/location_detail_state.dart';

part 'location_detail_mixin.dart';
part '../widget/location_character_list.dart';

class LocationDetailScreen extends ConsumerStatefulWidget {
  const LocationDetailScreen({super.key, required this.location});

  final Location location;

  @override
  ConsumerState<LocationDetailScreen> createState() =>
      _LocationDetailScreenState();
}

class _LocationDetailScreenState extends ConsumerState<LocationDetailScreen>
    with LocationDetailMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.location.name ?? '')),
      body: Padding(
        padding: context.paddingAllDefault,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.location.type} - ${widget.location.name}',
              style: context.textTheme.titleLarge,
            ),
            Text(
              widget.location.dimension ?? '',
              style: context.textTheme.titleLarge,
            ),
            Text('${widget.location.residents?.length} karakter'),
            Expanded(
              child: Consumer(builder: (context, ref, child) {
                final locationDetail = ref.watch(locationDetailProvider);
                if (locationDetail.isLoading) {
                  return const LoadingScreen();
                }
                if (locationDetail.isError) {
                  return const ErrorScreen(
                    error: 'Karakter bulunumadı!',
                  );
                }
                return _LocationCharacterList(locationDetail: locationDetail);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
