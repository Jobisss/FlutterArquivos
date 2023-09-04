import 'package:app_lista_tarefas/modelo/objeto_data_hora.dart';
import 'package:flutter/material.dart';
import 'package:app_lista_tarefas/main.dart';
import 'package:intl/intl.dart';
import 'package:app_lista_tarefas/paginas/pagina_listas.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'dart:math' as math;

class TudoItemLista extends StatelessWidget {
  const TudoItemLista({
    super.key,
    required this.mensagem_data_hora,
    required this.item_deletar_tarefas,
  });

  final Data_Hora mensagem_data_hora;
  final Function(Data_Hora) item_deletar_tarefas;
  
  Color corAleatoria() { 
    List<Color> cores = [Colors.red, Colors.blue, Colors.green, Colors.yellow];
    int randomN = math.Random().nextInt(cores.length);
    Color retornar = cores[randomN];
    return retornar;
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            flex: 2,
            onPressed: (context) {
              item_deletar_tarefas(mensagem_data_hora);
            },
            backgroundColor: Color.fromARGB(255, 255, 0, 0),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Deletar',
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: corAleatoria(),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  DateFormat("dd/MM/yyyy")
                      .format(mensagem_data_hora.data_hora),
                  //mensagem_data_hora.data_hora.toString(),

                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  mensagem_data_hora.titulo,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}