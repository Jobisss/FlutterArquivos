import 'package:flutter/material.dart';
import 'package:app_lista_tarefas/paginas/pagina_listas.dart';

void main() {
  runApp(Meuapp());
}

class Meuapp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Pagina_lista(),
    );
  }
}

