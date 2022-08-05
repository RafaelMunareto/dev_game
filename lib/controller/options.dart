import 'package:dev_game/utils/constantes.dart';
import 'package:flutter/material.dart';

class OptionsWidget extends StatelessWidget {
  const OptionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: 100,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: SizedBox(
                width: 140.0,
                height: 40.0,
                child: ElevatedButton(
                    onPressed: () {
                      goHome(context);
                    },
                    child: const Text("Novo Jogo")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: SizedBox(
                width: 140.0,
                height: 40.0,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text("Carregar")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: SizedBox(
                width: 140.0,
                height: 40.0,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text("Salvar")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
