import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restapi/core/extensions/context_extension.dart';

import '../provider/favorite_provider.dart';

part 'favorite_view_mixin.dart';

class FavoriteScreen extends ConsumerStatefulWidget {
  const FavoriteScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends ConsumerState<FavoriteScreen>
    with FavoriteViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favori Listesi'),
      ),
      body: Padding(
          padding: context.paddingAllDefault,
          child: Consumer(
            builder: (context, ref, child) {
              var state = ref.watch(favoriteProvider);
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state.characters.isEmpty) {
                return const Center(child: Text('Favori listesi boş'));
              }
              return ListView.builder(
                itemCount: state.characters.length,
                itemBuilder: (context, index) {
                  var character = state.characters[index];
                  return Card(
                    child: ListTile(
                      title: Text(character.name ?? ''),
                      subtitle: Text(character.status ?? ''),
                      leading: Image.network(character.image ?? ''),
                      trailing: IconButton(
                        onPressed: () {
                          ref
                              .read(favoriteProvider.notifier)
                              .deleteCharacter(character.name!);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                  );
                },
              );
            },
          )),
    );
  }
}
