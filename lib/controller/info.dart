import 'package:dev_game/utils/constantes.dart';
import 'package:flutter/material.dart';

class InfoWidget extends StatefulWidget {
  const InfoWidget({Key? key}) : super(key: key);

  @override
  State<InfoWidget> createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 550,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              'Missão de hoje',
              style: TextStyle(color: Colors.white, fontSize: 24),
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.sunny,
                  color: Colors.amber,
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 500,
                  child: Text(
                    'Você deve alcançar o mínimo de ${faseAtual.clima} no clima.',
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.book,
                  color: Colors.blue,
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 500,
                  child: Text(
                    'Você deve alcançar o mínimo de ${faseAtual.aprendizado} no aprendizado.',
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.verified,
                  color: Colors.red,
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 500,
                  child: Text(
                    'Você deve alcançar a qualidade ${faseAtual.qualidade}.',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.dataset_outlined,
                  color: Colors.green,
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 500,
                  child: Text(
                    'Criar ${faseAtual.paginas} página(s), lembre-se que são necessários dados e processamento.',
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
