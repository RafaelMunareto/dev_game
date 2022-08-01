import 'package:flutter/material.dart';

class ListTileActionWidget extends StatelessWidget {
  final String action;
  final String clima;
  final String tempo;
  final String qualidade;
  final String gestao;
  final String velocidade;
  final String aprendizado;
  const ListTileActionWidget({
    Key? key,
    required this.action,
    required this.clima,
    required this.tempo,
    required this.qualidade,
    required this.gestao,
    required this.velocidade,
    required this.aprendizado,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          action,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Clima: $clima',
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      'Tempo: $tempo',
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      'Qualidade: $qualidade',
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      'Gestão: $gestao',
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      'Velocidade: $velocidade',
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      'Aprendizado: $aprendizado',
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                )),
            Flexible(
                child: Center(
              child: ElevatedButton(
                  onPressed: () {}, child: const Text('Selecionar')),
            ))
          ],
        )
      ],
    );
  }
}
