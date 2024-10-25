part of '../view/character_view.dart';

class _CharacterSearch extends ConsumerStatefulWidget {
  const _CharacterSearch({
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  ConsumerState<_CharacterSearch> createState() => _CharacterSearchState();
}

class _CharacterSearchState extends ConsumerState<_CharacterSearch> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _speechEnabled = false;
  //bool _listening = false;

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  _initSpeech() async {
    await _speech.initialize().then(
          (value) => setState(() {
            _speechEnabled = value;
          }),
        );
  }

  void _performSearch(String query) {
    ref
        .read(charactersProvider.notifier)
        .getCharacterByQuery(queryParameters: {'name': query});
  }

  _startListening() async {
    if (_speechEnabled) {
      //_listening = true;
      await _speech.listen(
        pauseFor: const Duration(seconds: 5),
        onResult: (value) {
          setState(() {
            widget.searchController.text = value.recognizedWords;
          });
          if (value.finalResult) {
            _performSearch(value.recognizedWords);
          }
        },
      );
      setState(() {});
    }
  }
/* 
  _stopListening() async {
    await _speech.stop();
    setState(() {
      _listening = false;
    });
  } */

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: widget.searchController,
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
              suffixIcon: IconButton(
                onPressed: () {
                  if (widget.searchController.text.isNotEmpty) {
                    widget.searchController.clear();
                    setState(() {});
                  } else {
                    _startListening();
                  }
                },
                icon: widget.searchController.text.isNotEmpty
                    ? const Icon(Icons.clear_outlined)
                    : const Icon(Icons.mic_outlined),
              ),
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
              builder: (context) => const FilterSection(),
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
