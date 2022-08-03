import 'package:bonfire/bonfire.dart';
import 'package:flutter/cupertino.dart';
import 'package:flame/timer.dart' as flame;

const double tileSize = 16;
const double tileSizePerson = 32;
const double velocidadeGamers = 85;
var colisaoSizePersonagens = Vector2(tileSizePerson / 2, tileSizePerson / 2);
var colisaoAlignPersonagens = Vector2(8, 16);
const alignIdentity = Offset(10, -50);
const alignDados = Offset(40, -200);
const alignActionPlayers = Offset(50, -280);
var timerinitial = flame.Timer(480);
var timeinitialReset = flame.Timer(480);

setTempo(int tempo) {
  var currentTime = timerinitial.limit;
  timerinitial.reset();
  timerinitial = Timer(currentTime - (tempo * 60));
}

var dados = 0;
var processados = 0;
var paginas = 0;
var clima = 0;
var qualidade = 0;
var aprendizado = 0;
var tempo = 0;
