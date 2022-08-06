import 'dart:async' as async;
import 'dart:convert';

import 'package:dev_game/utils/constantes.dart';
import 'package:dev_game/utils/repositories/localstorage/local_storage_hive.dart';
import 'package:dev_game/utils/repositories/localstorage/local_storage_interface.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OptionsWidget extends StatefulWidget {
  const OptionsWidget({Key? key}) : super(key: key);

  @override
  State<OptionsWidget> createState() => _OptionsWidgetState();
}

class _OptionsWidgetState extends State<OptionsWidget> {
  final ILocalStorage storage = LocalStorageHive();
  var loading = ValueNotifier(false);
  var salvarAction = ValueNotifier(false);
  setLoading(value) => loading.value = value;
  setSalvarAction(value) => salvarAction.value = value;

  @override
  void initState() {
    loading.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
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
                    onPressed: () {
                      setState(() {
                        setLoading(true);
                        setSalvarAction(true);
                        var now = DateTime.now();
                        var formatter = DateFormat('dd-MM-yyyy kk:mm:a');
                        String formattedDate = formatter.format(now);
                        var salvar = {'data': formattedDate, 'fase': fase};
                        storage.put('salvarGame', [jsonEncode(salvar)]);
                      });

                      setState(() {
                        async.Timer(const Duration(seconds: 2), () {
                          setLoading(false);
                          setSalvarAction(false);
                        });
                      });
                    },
                    child: loading.value
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator())
                        : const Text("Salvar")),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            salvarAction.value
                ? Center(
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          "Salvo com sucesso!",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
