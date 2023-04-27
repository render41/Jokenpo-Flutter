import 'package:flutter/material.dart';
import 'package:jokenpo/data/jokenpo_data.dart';
import 'package:jokenpo/view/components/base_cards.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final jokenpoData = JokenpoData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
      backgroundColor: const Color(0xFF3D374C),
    );
  }

  AppBar get appBar {
    return AppBar(
      title: const Text('Jokenpô Game'),
      centerTitle: true,
      titleTextStyle: const TextStyle(
          color: Color(0xFFF2C9F6), fontSize: 26, fontWeight: FontWeight.w600),
      backgroundColor: const Color(0xFF8E1BFF),
      toolbarHeight: 80,
      actions: [
        InkWell(
          onTap: () => setState(() => jokenpoData.restartGame()),
          child: const Icon(Icons.rotate_left),
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  Widget get body {
    return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [cardsInGame, resultText, selectCards]));
  }

  Widget get cardsInGame {
    const marginWidth = 3.0;
    const marginHeight = 4.5;
    const cardSize = 1.8;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text('Player', style: cardInGameTextStyle),
            const SizedBox(height: 10),
            BaseCards(
              width: MediaQuery.of(context).size.width / marginWidth,
              height: MediaQuery.of(context).size.height / marginHeight,
              image: Image.asset(jokenpoData.playerCard, scale: cardSize),
            ),
            const SizedBox(height: 10),
            Text('${jokenpoData.scoresPlayer}', style: cardInGameTextStyle),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Opponent', style: cardInGameTextStyle),
            const SizedBox(height: 10),
            BaseCards(
              width: MediaQuery.of(context).size.width / marginWidth,
              height: MediaQuery.of(context).size.height / marginHeight,
              image: Image.asset(jokenpoData.opponentCard, scale: cardSize),
            ),
            const SizedBox(height: 10),
            Text('${jokenpoData.scoresOpponent}', style: cardInGameTextStyle),
          ],
        ),
      ],
    );
  }

  Text get resultText {
    return Text(
      jokenpoData.resultGame,
      style: const TextStyle(
        fontSize: 36,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget get selectCards {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Choose Your Card',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            selectCardsBaseButton(0),
            selectCardsBaseButton(1),
            selectCardsBaseButton(2),
          ],
        ),
      ],
    );
  }

  Widget selectCardsBaseButton(int indexCard) {
    const cardSize = 1.8;
    return ElevatedButton(
      onPressed: () => setState(() {
        jokenpoData.playerCard = jokenpoData.cards[indexCard];
        jokenpoData.appCardRandom();
        jokenpoData.scores();
      }),
      style: buttonStyle,
      child: Center(
          child: Image.asset(jokenpoData.cards[indexCard], scale: cardSize)),
    );
  }

  TextStyle get cardInGameTextStyle {
    return const TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.w800,
    );
  }

  ButtonStyle get buttonStyle {
    const marginWidth = 3.5;
    const marginHeight = 5.6;
    final responsiveSize = MediaQuery.of(context).size;
    return ButtonStyle(
      minimumSize: MaterialStateProperty.all(Size(
          responsiveSize.width / marginWidth,
          responsiveSize.height / marginHeight)),
      maximumSize: MaterialStateProperty.all(Size(
          responsiveSize.width / marginWidth,
          responsiveSize.height / marginHeight)),
      backgroundColor: MaterialStateProperty.all(const Color(0xFFD9D9D9)),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      )),
    );
  }
}
