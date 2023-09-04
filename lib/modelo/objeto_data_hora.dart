import 'package:app_lista_tarefas/modelo/objeto_data_hora.dart';
import 'package:app_lista_tarefas/widgets/itens_lista.dart';
import 'package:flutter/material.dart';

class Data_Hora {
  Data_Hora({required this.titulo, required this.data_hora});

  String titulo;
  DateTime data_hora;

  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'data_hora': data_hora.toIso8601String(),
    };
  }
}
