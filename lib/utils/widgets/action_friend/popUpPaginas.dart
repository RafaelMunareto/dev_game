// ignore_for_file: file_names

import 'package:bonfire/bonfire.dart';
import 'package:dev_game/utils/constantes.dart';
import 'package:flutter/material.dart';

class PopUpPaginasWidget extends StatefulWidget {
  const PopUpPaginasWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<PopUpPaginasWidget> createState() => _PopUpPaginasWidgetState();
}

class _PopUpPaginasWidgetState extends State<PopUpPaginasWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 200,
      child: SingleChildScrollView(
        child: Card(
          color: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Wrap(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      children: [
                        linha(
                            'Quer que eu crie as páginas com os dados Processados ?.',
                            '-1 min de tempo.'),
                        linha(
                            'Não',
                            ''
                                ''),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget linha(dado, descricao) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        dado,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    Text(
                      descricao,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ],
                ),
                const Divider(color: Colors.white),
              ],
            )),
        Flexible(
            flex: 1,
            child: Center(
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.black87),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ))),
                  onPressed: () {
                    setState(() {
                      if (descricao != "") {
                        paginasAction = true;
                        movePositionRodrigoPaginas = true;
                        timerPaginas.reset();
                        timerPaginas.start();
                      }
                      FollowerWidget.remove('paginasRodrigo');
                    });
                  },
                  child: const Text('Selecionar')),
            ))
      ],
    );
  }
}
