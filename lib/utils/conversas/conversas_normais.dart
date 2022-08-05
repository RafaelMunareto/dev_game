import 'package:bonfire/bonfire.dart';
import 'package:flutter/cupertino.dart';

class ConversasNormais extends GameComponent {
  final dynamic spriteFriend;
  final dynamic spriteHero;
  ConversasNormais({required this.spriteFriend, required this.spriteHero});

  talkNormal(falaHero, falaFriend) {
    return [
      Say(
          text: [
            TextSpan(text: falaHero),
          ],
          person: SizedBox(
            height: 150,
            width: 150,
            child: spriteHero,
          ),
          speed: 12,
          personSayDirection: PersonSayDirection.RIGHT),
      Say(
          text: [
            TextSpan(text: falaFriend),
          ],
          person: SizedBox(
            height: 150,
            width: 150,
            child: spriteFriend,
          ),
          speed: 12,
          personSayDirection: PersonSayDirection.RIGHT),
    ];
  }
}
