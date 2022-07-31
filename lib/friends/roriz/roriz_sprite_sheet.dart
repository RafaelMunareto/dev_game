import 'package:bonfire/bonfire.dart';

class RorizSpriteSheet {
  static Future<SpriteAnimation> get heroIdLeft => SpriteAnimation.load(
        'player/roriz.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(32, 48),
          texturePosition: Vector2(385, 80),
        ),
      );
  static Future<SpriteAnimation> get heroIdRight => SpriteAnimation.load(
        'player/roriz.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(32, 48),
          texturePosition: Vector2(0, 80),
        ),
      );
  static Future<SpriteAnimation> get heroIdUp => SpriteAnimation.load(
        'player/roriz.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(32, 48),
          texturePosition: Vector2(192, 80),
        ),
      );
  static Future<SpriteAnimation> get heroIdDown => SpriteAnimation.load(
        'player/roriz.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(32, 48),
          texturePosition: Vector2(576, 80),
        ),
      );

  static Future<SpriteAnimation> get heroRunRight => SpriteAnimation.load(
        'player/roriz.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(32, 48),
          texturePosition: Vector2(0, 144),
        ),
      );

  static Future<SpriteAnimation> get heroRunLeft => SpriteAnimation.load(
        'player/roriz.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(32, 48),
          texturePosition: Vector2(384, 144),
        ),
      );

  static Future<SpriteAnimation> get heroRunUp => SpriteAnimation.load(
        'player/roriz.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(32, 48),
          texturePosition: Vector2(192, 144),
        ),
      );

  static Future<SpriteAnimation> get heroRunDown => SpriteAnimation.load(
        'player/roriz.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(32, 48),
          texturePosition: Vector2(576, 145),
        ),
      );

  static Future<SpriteAnimation> get recevieDamageRight => SpriteAnimation.load(
        'player/roriz.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.15,
          textureSize: Vector2(32, 48),
          texturePosition: Vector2(192, 1232),
        ),
      );

  static Future<SpriteAnimation> get recevieDamageLeft => SpriteAnimation.load(
        'player/roriz.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.15,
          textureSize: Vector2(32, 48),
          texturePosition: Vector2(96, 608),
        ),
      );

  static Future<SpriteAnimation> get dieRight => SpriteAnimation.load(
        'player/roriz.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.15,
          textureSize: Vector2(32, 48),
          texturePosition: Vector2(96, 608),
        ),
      );
  static Future<SpriteAnimation> get dieLeft => SpriteAnimation.load(
        'player/roriz.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.15,
          textureSize: Vector2(32, 48),
          texturePosition: Vector2(96, 1232),
        ),
      );
}
