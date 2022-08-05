import 'package:bonfire/bonfire.dart';
import 'package:dev_game/controller/my_game_controller.dart';
import 'package:dev_game/decoration/cadeira_munareto/cadeira_munareto.dart';
import 'package:dev_game/decoration/cadeira_rodrigo/cadeira_rodrigo.dart';
import 'package:dev_game/enimies/bispo/bispo_enimy.dart';
import 'package:dev_game/friends/cadu/cadu_friend.dart';
import 'package:dev_game/friends/edgar/edgar_friend.dart';
import 'package:dev_game/friends/fabinho/fabinho_friend.dart';
import 'package:dev_game/friends/fernando/fernando_friend.dart';
import 'package:dev_game/friends/japa/japa_friend.dart';
import 'package:dev_game/friends/jeferson/jeferson_friend.dart';
import 'package:dev_game/friends/juliano/juliano_friend.dart';
import 'package:dev_game/friends/leo/leo_friend.dart';
import 'package:dev_game/friends/mona/mona_friend.dart';
import 'package:dev_game/friends/rafa/rafa_friend.dart';
import 'package:dev_game/friends/rodrigo/rodrigo_friend.dart';
import 'package:dev_game/friends/rogerio/rogerio_friend.dart';
import 'package:dev_game/friends/roriz/roriz_friend.dart';
import 'package:dev_game/friends/silvia/silvia_friend.dart';
import 'package:dev_game/friends/talmon/talmon_friend.dart';
import 'package:dev_game/friends/thaisa/thaisa_friend.dart';
import 'package:dev_game/interface/player_interceface_pontos.dart';
import 'package:dev_game/player/game_hero.dart';
import 'package:dev_game/utils/constantes.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  final int stage;
  const Game({Key? key, this.stage = 1}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  List<GameComponent> enemies = [];
  @override
  void initState() {
    switch (widget.stage) {
      case 1:
        enemies.add(BispoEnemy(_getWorldPosition(20, 16)));
        break;
      case 2:
        enemies.add(BispoEnemy(_getWorldPosition(11, 10)));
        enemies.add(BispoEnemy(_getWorldPosition(14, 18)));
        break;
      case 3:
        enemies.add(BispoEnemy(_getWorldPosition(22, 15)));
        enemies.add(BispoEnemy(_getWorldPosition(27, 22)));
        enemies.add(BispoEnemy(_getWorldPosition(27, 26)));
        break;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      joystick: Joystick(
        directional: JoystickDirectional(
            color: Colors.orange, margin: const EdgeInsets.all(64)),
        // actions: [
        //   JoystickAction(
        //       actionId: 32,
        //       color: Colors.red,
        //       margin: const EdgeInsets.all(48)),
        // ],
        keyboardConfig: KeyboardConfig(
          enable: true,
          keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
        ),
      ),
      components: [
        MyGameController(widget.stage),
      ], //...enemies],
      map: TiledWorldMap('maps/dev_game.json',
          forceTileSize: const Size(28, 28),
          objectsBuilder: {
            'rafa': (properties) => RafaFriend(properties.position),
            'talmon': (properties) => TalmonFriend(properties.position),
            'jeferson': (properties) => JefersonFriend(properties.position),
            'fabinho': (properties) => FabinhoFriend(properties.position),
            'mona': (properties) => MonaFriend(properties.position),
            'thaisa': (properties) => ThaisaFriend(properties.position),
            'edgar': (properties) => EdgarFriend(properties.position),
            'fernando': (properties) => FernandoFriend(properties.position),
            'rogerio': (properties) => RogerioFriend(properties.position),
            'rodrigo': (properties) => RodrigoFriend(properties.position),
            'juliano': (properties) => JulianoFriend(properties.position),
            'japa': (properties) => JapaFriend(properties.position),
            'leo': (properties) => LeoFriend(properties.position),
            'silvia': (properties) => SilviaFriend(properties.position),
            'cadu': (properties) => CaduFriend(properties.position),
            'roriz': (properties) => RorizFriend(properties.position),
            'cadeira_munareto': ((properties) =>
                CadeiraMunareto(properties.position)),
            'cadeira_rodrigo': ((properties) =>
                CadeiraRodrigo(properties.position)),
            // 'lamp': ((properties) => Lamp(properties.position)),
            // 'mushroom': ((properties) => MushRoom(properties.position))
          }),
      player: GameHero(Vector2(400, 900)),
      overlayBuilderMap: {
        PlayerInterfacePontos.overlayKey: (context, game) =>
            PlayerInterfacePontos(game: game),
      },
      initialActiveOverlays: const [PlayerInterfacePontos.overlayKey],
      cameraConfig: CameraConfig(
          moveOnlyMapArea: true,
          zoom: 2.0,
          sizeMovementWindow: Vector2(tileSize * 8, tileSize * 8)),
      showCollisionArea: false,
      // lightingColorGame: Colors.black.withOpacity(0.2),
    );
  }

  Vector2 _getWorldPosition(int x, int y) {
    return Vector2(x * tileSize, y * tileSize);
  }
}
