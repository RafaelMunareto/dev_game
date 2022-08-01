import 'package:bonfire/bonfire.dart';

class CadeiraMunaretoDecorationSpritSheet {
  static Future<Sprite> get cadeira => Sprite.load(
        'player/munareto.png',
        srcPosition: Vector2(224, 608),
        srcSize: Vector2(16, 32),
      );
  static Future<Sprite> get cadeiraLogada => Sprite.load(
        'player/munareto.png',
        srcPosition: Vector2(208, 608),
        srcSize: Vector2(16, 32),
      );
}
