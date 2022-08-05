// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FaseModel {
  int dados;
  int processados;
  int paginas;
  int clima;
  int qualidade;
  int aprendizado;
  int tempo;

  FaseModel({
    this.dados = 0,
    this.processados = 0,
    this.paginas = 0,
    this.clima = 0,
    this.qualidade = 0,
    this.aprendizado = 0,
    this.tempo = 0,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dados': dados,
      'processados': processados,
      'paginas': paginas,
      'clima': clima,
      'qualidade': qualidade,
      'aprendizado': aprendizado,
      'tempo': tempo,
    };
  }

  factory FaseModel.fromMap(Map<String, dynamic> map) {
    return FaseModel(
      dados: map['dados'] as int,
      processados: map['processados'] as int,
      paginas: map['paginas'] as int,
      clima: map['clima'] as int,
      qualidade: map['qualidade'] as int,
      aprendizado: map['aprendizado'] as int,
      tempo: map['tempo'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory FaseModel.fromJson(String source) =>
      FaseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
