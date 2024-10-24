part of '../view/character_view.dart';

class _CharacterSearch extends StatelessWidget {
  const _CharacterSearch({
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
              builder: (context) => Container(),
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
