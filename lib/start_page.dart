import 'package:flutter/material.dart';

import 'package:rock_paper_scissors/game_page.dart';
import 'package:rock_paper_scissors/fancy_button.dart';
import 'package:rock_paper_scissors/multiplayer_game_page.dart';
import 'package:rock_paper_scissors/simple_audio_player.dart';

class StartPage extends StatelessWidget {
  final audioPlayer = SimpleAudioPlayer();
  final clickAudioFile = SimpleAudioFile.load("sounds/click_vol0.mp3");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Spacer(flex: 4),
              _imageSection(),
              Spacer(flex: 1),
              _titleSection(),
              Spacer(flex: 4),
              // single player button
              // _buttonSection(
              //   "لاعب واحد",
              //   () => Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => GamePage(),
              //     ),
              //   ),
              // ),
              Spacer(),
              // multiplayer button
              _buttonSection(
                "ابدء اللعب",
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MultiplayerGamePage(),
                  ),
                ),
              ),
              Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonSection(String text, VoidCallback func) {
    return FancyButton(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontFamily: 'Arcade Classic',
          ),
        ),
      ),
      size: 25,
      color: Colors.grey[100],
      onPressed: () {
        func();
        audioPlayer.playSimpleAudio(clickAudioFile);
      },
    );
  }

  Widget _imageSection() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Image.asset("images/handss.png"),
        ),
      ],
    );
  }

  Widget _titleSection() {
    return Center(
      child: Column(
        children: [
          Text(
            'لعبة حجر ورقة مقص',
            style: TextStyle(
              fontSize: 22,
              fontFamily: 'Courier',
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'اعداد و تصميم عمر يوسف',
            style: TextStyle(
              fontSize: 22,
              fontFamily: 'Courier',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
