import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class PlayerInterfacePontos extends StatefulWidget {
  static const overlayKey = 'playerInterfacePontos';
  final BonfireGame game;
  const PlayerInterfacePontos({Key? key, required this.game}) : super(key: key);

  @override
  State<PlayerInterfacePontos> createState() => _PlayerInterfacePontosState();
}

class _PlayerInterfacePontosState extends State<PlayerInterfacePontos> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage('assets/images/player/foto.png'), scale: 0.5),
            color: Colors.white,
            borderRadius: BorderRadius.circular(120),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(5)),
          width: 80,
          height: 50,
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage(
                              'assets/images/player/interface/estrelas.png'),
                          scale: 0.5),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(120),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
