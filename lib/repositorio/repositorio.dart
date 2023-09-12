import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_lista_tarefas/modelo/objeto_data_hora.dart';

class Repositorio { 
  Repositorio() { 
    SharedPreferences.getInstance().then((value) => sharedPreferences=value); //construtor para 
    //instanciar o repositorio 
  }
  late SharedPreferences sharedPreferences;

  void salvarLista(List<Data_Hora> lista){ 
    final jsonString = jsonEncode(lista);
    print(jsonString);
  }
}