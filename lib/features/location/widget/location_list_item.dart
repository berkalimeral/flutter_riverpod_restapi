part of '../view/location_view.dart';

class _LocationListItem extends StatelessWidget {
  const _LocationListItem({required this.location});

  final Location location;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => context.pushNamed('locationDetail', extra: location),
        title: Text(location.name ?? ''),
        subtitle: Text(location.type ?? ''),
        trailing: Text(location.dimension ?? ''),
        leading: const Icon(Icons.place),
      ),
    );
  }
}
