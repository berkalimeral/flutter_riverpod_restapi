// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../view/character_view.dart';

class _CharacterSearch extends ConsumerWidget {
  const _CharacterSearch({
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: searchController,
            onChanged: (value) {
              ref
                  .read(charactersProvider.notifier)
                  .getCharacterByQuery(queryParameters: {'name': value});
            },
            decoration: InputDecoration(
              hintText: 'Karakter Ara',
              hintStyle: context.textTheme.bodyMedium,
              contentPadding: context.paddingAllDefault,
              fillColor: Colors.white,
              filled: true,
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => const _FilterSection(),
            );
          },
          icon: Container(
              padding: context.paddingAllLow,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green.shade600),
              child: const Icon(
                Icons.filter_list,
                size: 30,
              )),
        ),
      ],
    );
  }
}

class _FilterSection extends ConsumerStatefulWidget {
  const _FilterSection();

  @override
  ConsumerState<_FilterSection> createState() => _FilterSectionState();
}

class _FilterSectionState extends ConsumerState<_FilterSection> {
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
