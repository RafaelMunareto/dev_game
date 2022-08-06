// ignore_for_file: unused_local_variable

import 'dart:async';
import 'package:dev_game/utils/constantes.dart';
import 'package:dev_game/utils/fase_model.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  Future salvarJogo(FaseModel fase, String user) async {
    var saveGame = {"user": user, "fase": fase};
    Response response;
    var dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
      ),
    );

    response = await dio.post('/salvar', data: saveGame);
    return response;
  }

  Future carregarJogo(String user, int id) async {
    var saveGame = {"user": user, "fase": fase};
    Response response;
    var dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
      ),
    );

    response = await dio.get('/carregar/$user/$id');
    return response;
  }

  Future listarJogo(String user) async {
    var saveGame = {"user": user, "fase": fase};
    Response response;
    var dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
      ),
    );

    response = await dio.get('/carregar/$user');
    return response;
  }
}
