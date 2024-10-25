import 'package:flutter/material.dart';

import '../../../product/models/character/character_model.dart';

class CharacterDetailView extends StatelessWidget {
  const CharacterDetailView({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name ?? ''),
      ),
      body: Column(
        children: [
          Text(character.name ?? ''),
        ],
      ),
    );
  }
}
