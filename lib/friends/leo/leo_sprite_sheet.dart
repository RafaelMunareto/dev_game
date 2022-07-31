import 'package:bonfire/bonfire.dart';

class LeoSpriteSheet {
  static Future<SpriteAnimation> get heroIdLeft => SpriteAnimation.load(
        'player/leo.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(16, 32),
          texturePosition: Vector2(192, 32),
        ),
      );
  static Future<SpriteAnimation> get heroIdRight => SpriteAnimation.load(
        'player/leo.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(16, 32),
          texturePosition: Vector2(0, 32),
        ),
      );
  static Future<SpriteAnimation> get heroIdUp => SpriteAnimation.load(
        'player/leo.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(16, 32),
          texturePosition: Vector2(96, 32),
        ),
      );
  static Future<SpriteAnimation> get heroIdDown => SpriteAnimation.load(
        'player/leo.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(16, 32),
          texturePosition: Vector2(288, 32),
        ),
      );

  static Future<SpriteAnimation> get heroRunRight => SpriteAnimation.load(
        'player/leo.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(16, 32),
          texturePosition: Vector2(0, 64),
        ),
      );

  static Future<SpriteAnimation> get heroRunLeft => SpriteAnimation.load(
        'player/leo.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(16, 32),
          texturePosition: Vector2(192, 64),
        ),
      );

  static Future<SpriteAnimation> get heroRunUp => SpriteAnimation.load(
        'player/leo.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(16, 32),
          texturePosition: Vector2(96, 64),
        ),
      );

  static Future<SpriteAnimation> get heroRunDown => SpriteAnimation.load(
        'player/leo.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(16, 32),
          texturePosition: Vector2(288, 64),
        ),
      );

  static Future<SpriteAnimation> get recevieDamageRight => SpriteAnimation.load(
        'player/leo.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.15,
          textureSize: Vector2(16, 32),
          texturePosition: Vector2(0, 608),
        ),
      );

  static Future<SpriteAnimation> get recevieDamageLeft => SpriteAnimation.load(
        'player/leo.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.15,
          textureSize: Vector2(16, 32),
          texturePosition: Vector2(96, 608),
        ),
      );

  static Future<SpriteAnimation> get dieRight => SpriteAnimation.load(
        'player/leo.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.15,
          textureSize: Vector2(16, 32),
          texturePosition: Vector2(96, 608),
        ),
      );
  static Future<SpriteAnimation> get dieLeft => SpriteAnimation.load(
        'player/leo.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.15,
          textureSize: Vector2(16, 32),
          texturePosition: Vector2(96, 608),
        ),
      );
}
