part of 'location_detail_view.dart';

mixin LocationDetailMixin on ConsumerState<LocationDetailScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref
        .read(locationDetailProvider.notifier)
        .fetchCharacters(widget.location.residents!));
  }
}
