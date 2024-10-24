part of '../view/character_view.dart';

class _CharacterSearch extends StatelessWidget {
  _CharacterSearch({
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: searchController,
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
              builder: (context) => _FilterSection(),
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

class _FilterSection extends StatelessWidget {
  _FilterSection();

  final List<String> _status = ['Alive', 'Dead', 'Unknown'];
  final Map<String, IconData> _gender = {
    'Male': Icons.male,
    'Female': Icons.female,
    'Genderless': Icons.question_mark,
    'Unknown': Icons.question_mark
  };

  @override
  Widget build(BuildContext context) {
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
            children: _status
                .map((e) => Padding(
                      padding: context.paddingRightLow,
                      child: Chip(label: Text(e)),
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
            children: _gender.entries.map((entry) {
              return Chip(label: Text(entry.key), avatar: Icon(entry.value));
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
                onPressed: () {},
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
