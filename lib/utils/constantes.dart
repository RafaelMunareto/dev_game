import 'package:bonfire/bonfire.dart';
import 'package:flutter/cupertino.dart';

const double tileSize = 16;
const double tileSizePerson = 32;
const double velocidadeGamers = 85;
var colisaoSizePersonagens = Vector2(tileSizePerson / 2, tileSizePerson / 2);
var colisaoAlignPersonagens = Vector2(8, 16);
const alignIdentity = Offset(10, -50);
const alignActionPlayers = Offset(50, -280);
