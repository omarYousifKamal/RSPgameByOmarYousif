import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rock_paper_scissors/fancy_button.dart';
import 'package:rock_paper_scissors/game_choice.dart';
import 'package:rock_paper_scissors/multiplayer_game_page.dart';

final _rockImageLoc = "images/rock_hand.png";
final _paperImageLoc = "images/paper_hand.png";
final _scissorImageLoc = "images/scissor_hand.png";

class MultiplayerResultPage extends StatelessWidget {
  const MultiplayerResultPage(this.player1Choice, this.player2Choice);

  final GameChoice player1Choice;
  final GameChoice player2Choice;

  @override
  Widget build(BuildContext context) {
    bool player1Win = false;
    bool player2Win = false;
    String result = "تعادل :(";

    if (player1Choice != player2Choice) {
      if (_win(player1Choice, player2Choice)) {
        player1Win = true;
        result = "!مبروك الاعب رقم واحد لقد فزت";
      } else {
        player2Win = true;
        result = "!مبروك الاعب رقم اثنين لقد فزت";
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Spacer(),
              _resultSection(player1Choice, player1Win, "الاعب واحد"),
              _resultSection(player2Choice, player2Win, "الاعب اثنين"),
              Spacer(flex: 2),
              Text(
                result,
                style: TextStyle(fontSize: 27),
              ),
              Spacer(flex: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FancyButton(
                    child: Icon(
                      Icons.redo,
                      size: 40,
                    ),
                    size: 50,
                    curve: 50,
                    color: Colors.grey[200],
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MultiplayerGamePage(),
                      ),
                    ),
                  ),
                  FancyButton(
                    child: Icon(
                      Icons.arrow_back,
                      size: 40,
                    ),
                    size: 50,
                    curve: 50,
                    color: Colors.grey[200],
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _resultSection(GameChoice choice, bool winner, String text) {
    String imageLoc;
    switch (choice) {
      case GameChoice.rock:
        imageLoc = _rockImageLoc;
        break;
      case GameChoice.paper:
        imageLoc = _paperImageLoc;
        break;
      case GameChoice.scissor:
        imageLoc = _scissorImageLoc;
        break;
      default:
        imageLoc = null;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 150,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: RotatedBox(
              quarterTurns: 3,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  color: winner ? Colors.blue : Colors.black,
                ),
              ),
            ),
          ),
          Center(
            child: imageLoc != null
                ? Image.asset(
                    imageLoc,
                    color: winner ? Colors.blue : Colors.black,
                  )
                : null,
          ),
        ],
      ),
    );
  }

  bool _win(GameChoice choice1, GameChoice choice2) {
    return (choice1 == GameChoice.rock && choice2 == GameChoice.scissor) ||
        (choice1 == GameChoice.paper && choice2 == GameChoice.rock) ||
        (choice1 == GameChoice.scissor && choice2 == GameChoice.paper);
  }
}
