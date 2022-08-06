// ignore_for_file: file_names

import 'package:bonfire/bonfire.dart';
import 'package:dev_game/utils/constantes.dart';
import 'package:flutter/material.dart';

class PopUpPadraoWidget extends StatefulWidget {
  final String title;
  final String subTitle;
  final Function setAction;
  const PopUpPadraoWidget({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.setAction,
  }) : super(key: key);

  @override
  State<PopUpPadraoWidget> createState() => _PopUpPadraoWidgetState();
}

class _PopUpPadraoWidgetState extends State<PopUpPadraoWidget> {
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
                        linha(widget.title, widget.subTitle),
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
                        widget.setAction(true);
                        processamentoAction = false;
                        paginasAction = false;
                      }
                      FollowerWidget.remove('agiliza');
                    });
                  },
                  child: const Text('Selecionar')),
            ))
      ],
    );
  }
}
