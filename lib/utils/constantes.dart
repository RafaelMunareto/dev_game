import 'package:bonfire/bonfire.dart';
import 'package:dev_game/game.dart';
import 'package:dev_game/utils/fase_model.dart';
import 'package:flame/timer.dart' as flame;
import 'package:flutter/material.dart';

const baseUrl = 'http://localhost:3333';
const double tileSize = 16;
const double tileSizePerson = 32;
const double velocidadeGamers = 85;
var colisaoSizePersonagens = Vector2(tileSizePerson / 2, tileSizePerson / 2);
var colisaoAlignPersonagens = Vector2(8, 16);
const alignIdentity = Offset(10, -50);
const alignDados = Offset(40, -200);
const alignProcessamento = Offset(40, -140);
const alignPosicionamentoSnackbar = Offset(0, 0);
const alignActionPlayers = Offset(50, -280);
var timerinitial = flame.Timer(480);
var timeinitialReset = flame.Timer(480);
var timerProcessamento = flame.Timer(60);
var timerPaginas = flame.Timer(60);
bool movePositionRodrigoPaginas = false;
bool processamentoAction = false;
bool paginasAction = false;
bool rorizEmbora = false;
bool infoAction = false;
bool optionsAction = false;

bool agiliza = false;

setAgiliza(value) => agiliza = value;

setTempo(int tempo) {
  var currentTime = timerinitial.limit;
  timerinitial.reset();
  timerinitial = Timer(currentTime - (tempo * 60));
}

FaseModel fase = FaseModel();
FaseModel faseAtual =
    FaseModel(paginas: 1, clima: 1, qualidade: 1, aprendizado: 2, dados: 2);

void goHome(context) {
  timerinitial.reset();
  timerinitial = timeinitialReset;
  fase = FaseModel();
  timerinitial.start();
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) {
      return const Game();
    }),
    (route) => false,
  );
}
