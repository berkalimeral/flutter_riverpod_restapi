part of '../view/location_view.dart';

class _LocationList extends ConsumerWidget {
  const _LocationList({required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationState = ref.watch(locationsProvider);

    return Padding(
      padding: context.paddingAllDefault,
      child: locationState.isLoading
          ? const LoadingScreen()
          : locationState.isError
              ? const ErrorScreen(error: 'Lokasyonlar yüklenemedi!')
              : ListView.builder(
                  controller: scrollController,
                  itemCount: locationState.location.length,
                  itemBuilder: (context, index) {
                    final location = locationState.location[index];
                    return _LocationListItem(location: location);
                  },
                ),
    );
  }
}
