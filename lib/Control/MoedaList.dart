import 'package:flutter/services.dart';

import '../Model/Dados.dart';
import '../Model/Moeda.dart';
import 'dart:convert';

class MoedaList {
  int cont = 0;
  Future lerMoeda() async {
    List<dynamic> minhaLista;
    Moeda nMoeda = Moeda();
     final String response = await rootBundle.loadString('criptomoedas.json');
    var jsonDados = jsonDecode(response);
    



    return jsonDados["data"];
  }

  Future<Dados> lerDados() async {
    Dados meuDados = Dados();
    final String response = await rootBundle.loadString('criptomoedas.json');
    var jsonDados = jsonDecode(response);
    meuDados.balance = jsonDados["user_balance"];
    meuDados.id = jsonDados["wallet_id"];
    return meuDados;
  }
}
