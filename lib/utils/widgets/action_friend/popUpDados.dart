import 'package:bonfire/bonfire.dart';
import 'package:dev_game/utils/constantes.dart';
import 'package:flutter/material.dart';

class PopUpDadosWidget extends StatefulWidget {
  final String action;
  final String dado1;
  final String dado2;
  final String dado3;
  const PopUpDadosWidget(
      {Key? key,
      required this.action,
      required this.dado1,
      required this.dado2,
      required this.dado3})
      : super(key: key);

  @override
  State<PopUpDadosWidget> createState() => _PopUpDadosWidgetState();
}

class _PopUpDadosWidgetState extends State<PopUpDadosWidget> {
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
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.action,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.blue),
                            ),
                          ),
                        ),
                        linha(widget.dado1,
                            '-1 Clima, -1m Tempo, 0 Aprendizado, +1 Qualidade'),
                        linha(widget.dado2,
                            '0 Clima, 0 Tempo, 0 Aprendizado, 0 Qualidade'),
                        linha(widget.dado3,
                            '1 Clima, 0 Tempo, 0 Aprendizado, -1 Qualidade'),
                        linha(
                            'Nenhum deles',
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
                      if (widget.dado1 != '') {
                        clima = clima - 1;
                        setTempo(1);
                        aprendizado = aprendizado + 0;
                        qualidade = qualidade + 1;
                        dados = dados + 2;
                      }
                      if (widget.dado2 != '') {
                        dados = dados + 1;
                      }
                      if (widget.dado3 != '') {
                        clima = clima + 1;
                        //tempo = tempo + ;
                        aprendizado = aprendizado + 0;
                        qualidade = qualidade - 1;
                        dados = dados - 1;
                      }

                      FollowerWidget.remove('dados');
                    });
                  },
                  child: const Text('Selecionar')),
            ))
      ],
    );
  }
}
