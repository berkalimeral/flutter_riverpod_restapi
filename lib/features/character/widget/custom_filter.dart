import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restapi/core/extensions/context_extension.dart';

import '../../../core/providers/filter_provider/filter_provider.dart';
import '../provider/character_provider.dart';

class FilterSection extends ConsumerStatefulWidget {
  const FilterSection({super.key});

  @override
  ConsumerState<FilterSection> createState() => _FilterSectionState();
}

class _FilterSectionState extends ConsumerState<FilterSection> {
  @override
  Widget build(BuildContext context) {
    final filterState = ref.watch(filterProvider);

    return Padding(
      padding: context.paddingAllDefault,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Filtrele',
              style: context.textTheme.titleMedium,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Statü',
            style: context.textTheme.titleLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: Status.values
                .map((entry) => Padding(
                      padding: context.paddingRightLow,
                      child: ChoiceChip(
                        label: Text(entry.name),
                        selected: filterState.selectedStatus == entry.name,
                        selectedColor: Colors.green.shade600,
                        onSelected: (value) {
                          if (value) {
                            ref
                                .read(filterProvider.notifier)
                                .setStatus(entry.name);
                          } else {
                            ref.read(filterProvider.notifier).setStatus(null);
                          }
                        },
                      ),
                    ))
                .toList(),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Cinsiyet',
            style: context.textTheme.titleLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: Gender.values.map((entry) {
              return ChoiceChip(
                selected: filterState.selectedGender == entry.name,
                selectedColor: Colors.green.shade600,
                label: Text(entry.name),
                avatar: Icon(entry.icon),
                onSelected: (value) {
                  if (value) {
                    ref.read(filterProvider.notifier).setGender(entry.name);
                  } else {
                    ref.read(filterProvider.notifier).setGender(null);
                  }
                },
              );
            }).toList(),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade600,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(200, 40),
                ),
                onPressed: () {
                  ref.read(charactersProvider.notifier).getCharacterByQuery(
                    queryParameters: {
                      if (filterState.selectedStatus != null)
                        'status': filterState.selectedStatus,
                      if (filterState.selectedGender != null)
                        'gender': filterState.selectedGender,
                    },
                  );
                  Navigator.pop(context);
                },
                child: const Text(
                  'Uygula',
                  style: TextStyle(color: Colors.black),
                )),
          )
        ],
      ),
    );
  }
}

class Status {
  String name;
  Status({
    required this.name,
  });

  static List<Status> get values => [
        Status(name: 'Alive'),
        Status(name: 'Dead'),
        Status(name: 'Unknown'),
      ];
}

class Gender {
  String name;
  IconData icon;
  Gender({
    required this.name,
    required this.icon,
  });

  static List<Gender> get values => [
        Gender(name: 'Male', icon: Icons.male),
        Gender(name: 'Female', icon: Icons.female),
        Gender(name: 'Genderless', icon: Icons.question_mark),
        Gender(name: 'Unknown', icon: Icons.question_mark),
      ];
}
