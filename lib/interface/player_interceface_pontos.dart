import 'dart:async' as async;
import 'package:bonfire/bonfire.dart';
import 'package:dev_game/utils/constantes.dart';
import 'package:flutter/material.dart';

class PlayerInterfacePontos extends StatefulWidget {
  static const overlayKey = 'playerInterfacePontos';
  final BonfireGame game;
  const PlayerInterfacePontos({Key? key, required this.game}) : super(key: key);

  @override
  State<PlayerInterfacePontos> createState() => _PlayerInterfacePontosState();
}

class _PlayerInterfacePontosState extends State<PlayerInterfacePontos> {
  late async.Timer lifeTime;
  Color color = Colors.green;
  double time = 0;
  var colorActionProcessados = false;
  var colorActionDados = false;
  var colorActionPaginas = false;
  var colorActionClima = false;
  var colorActionQualidade = false;
  var colorActionAprendizado = false;

  var processadosLocal = fase.processados;
  var dadosLocal = fase.dados;
  var paginasLocal = fase.paginas;
  var climaLocal = fase.clima;
  var aprendizadoLocal = fase.aprendizado;
  var qualidadeLocal = fase.qualidade;

  @override
  void initState() {
    lifeTime =
        async.Timer.periodic(const Duration(milliseconds: 100), _verifyTime);
    super.initState();
  }

  faseColorMeta(notaAtual, notaSimulada) {
    return notaAtual >= notaSimulada;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black87, width: 3),
              image: const DecorationImage(
                  image: AssetImage('assets/images/player/foto.png'),
                  scale: 0.5),
              color: Colors.white,
              borderRadius: BorderRadius.circular(120),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  componentCustomVelocidade(
                      'assets/images/player/velocidade.png'),
                  componentCustom('assets/images/player/dados.png',
                      '${fase.dados} dados', colorActionDados, false),
                  componentCustom(
                      'assets/images/player/processamento.png',
                      '${fase.processados} dados processados',
                      colorActionProcessados,
                      false),
                  componentCustom(
                      'assets/images/player/paginas.png',
                      '${fase.paginas} Páginas criadas',
                      colorActionPaginas,
                      faseColorMeta(fase.paginas, faseAtual.paginas)),
                  componentCustom(
                      'assets/images/player/clima.png',
                      '${fase.clima} clima',
                      colorActionClima,
                      faseColorMeta(fase.clima, faseAtual.clima)),
                  componentCustom(
                      'assets/images/player/qualidade.png',
                      '${fase.qualidade} qualidade',
                      colorActionQualidade,
                      faseColorMeta(fase.qualidade, faseAtual.qualidade)),
                  componentCustom(
                      'assets/images/player/estudo.png',
                      '${fase.aprendizado} aprendizado',
                      colorActionAprendizado,
                      faseColorMeta(fase.aprendizado, faseAtual.aprendizado)),
                ],
              ),
            ),
          ),
          Row(
            children: [
              info(),
              configuracoes(),
            ],
          ),
        ],
      ),
    );
  }

  Widget textCustom(dynamic title) {
    return Text(title.toString(),
        style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 1.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 2.0,
                color: Color.fromARGB(125, 0, 0, 255),
              ),
            ],
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.none));
  }

  Widget imageCustom(String image) {
    return Image.asset(
      image,
      width: 24,
      height: 24,
    );
  }

  Widget componentCustom(
      String image, String texto, bool testeColor, bool meta) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
            color: testeColor
                ? Colors.orange
                : meta
                    ? Colors.blue
                    : Colors.black87,
            borderRadius: BorderRadius.circular(5)),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: imageCustom(image),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: textCustom(texto),
          ),
        ]),
      ),
    );
  }

  Widget componentCustomVelocidade(String image) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
            color: Colors.black54, borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: imageCustom(image),
            ),
            Stack(
              children: [
                Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(2)),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(16),
                  width: time < 0 ? 100 : time,
                  height: 30,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 5),
                  child: textCustom(
                      ('${(timerinitial.progress < 0 ? 100 : timerinitial.progress * 100).toStringAsFixed(2)} %')),
                ),
              ],
            ),
            const SizedBox(width: 10),
            textCustom(
                '${(timerinitial.limit < 0 ? 0 : timerinitial.limit / 60).toStringAsFixed(0)} min'),
          ],
        ),
      ),
    );
  }

  Widget info() {
    return GestureDetector(
      onTap: () => infoAction = true,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black38, borderRadius: BorderRadius.circular(120)),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Icon(
                Icons.info,
                size: 32,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget configuracoes() {
    return GestureDetector(
      onTap: () => optionsAction = true,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black38, borderRadius: BorderRadius.circular(120)),
          child: const Padding(
            padding: EdgeInsets.all(6.0),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Icon(
                Icons.settings,
                size: 32,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  colorActionTimer() {
    if (dadosLocal != fase.dados) {
      colorActionDados = true;
      async.Timer(const Duration(seconds: 2), () {
        colorActionDados = false;
        dadosLocal = fase.dados;
      });
    }
    if (processadosLocal != fase.processados) {
      colorActionProcessados = true;
      async.Timer(const Duration(seconds: 2), () {
        colorActionProcessados = false;
        processadosLocal = fase.processados;
      });
    }
    if (paginasLocal != fase.paginas) {
      colorActionPaginas = true;
      async.Timer(const Duration(seconds: 2), () {
        colorActionPaginas = false;
        paginasLocal = fase.paginas;
      });
    }
    if (climaLocal != fase.clima) {
      colorActionClima = true;
      async.Timer(const Duration(seconds: 2), () {
        colorActionClima = false;
        climaLocal = fase.clima;
      });
    }
    if (qualidadeLocal != fase.qualidade) {
      colorActionQualidade = true;
      async.Timer(const Duration(seconds: 2), () {
        colorActionQualidade = false;
        qualidadeLocal = fase.qualidade;
      });
    }
    if (aprendizadoLocal != fase.aprendizado) {
      colorActionAprendizado = true;
      async.Timer(const Duration(seconds: 2), () {
        colorActionAprendizado = false;
        aprendizadoLocal = fase.aprendizado;
      });
    }
  }

  void _verifyTime(async.Timer timer) {
    colorActionTimer();
    if (time != (timerinitial.progress * 100)) {
      if (mounted) {
        setState(() {
          time = timerinitial.progress * 100;
          if (time >= 40 && time < 70) {
            color = Colors.amber;
          } else if (time >= 70) {
            color = Colors.red;
          } else {
            color = Colors.green;
          }
        });
      }
    }
  }
}
