part of '../view/character_detail_view.dart';

class _CharacterInfoArea extends StatelessWidget {
  const _CharacterInfoArea({required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(context.dynamicWidth(0.02)),
      ),
      child: Padding(
        padding: context.paddingAllDefault,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Karakter Hakkında',
              style: context.textTheme.titleLarge,
            ),
            SizedBox(
              height: context.dynamicHeight(0.02),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _characterInfoText(context, 'İsim: ', character.name),
                    _characterInfoText(context, 'Cinsiyet: ', character.gender),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _characterInfoText(context, 'Durum: ', character.status),
                    _characterInfoText(context, 'Tür: ', character.species),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  RichText _characterInfoText(
      BuildContext context, String title, String? value) {
    return RichText(
        text: TextSpan(
      text: title,
      children: [
        TextSpan(
          text: value ?? '',
          style: context.textTheme.bodyLarge
              ?.copyWith(color: Colors.green.shade600),
        )
      ],
    ));
  }
}
