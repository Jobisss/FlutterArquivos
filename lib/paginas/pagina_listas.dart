import 'package:app_lista_tarefas/modelo/objeto_data_hora.dart';
import 'package:flutter/material.dart';
import '../widgets/itens_lista.dart';
import 'package:app_lista_tarefas/repositorio/repositorio.dart';


class Pagina_lista extends StatefulWidget {
  @override
  State<Pagina_lista> createState() => _Pagina_listaState();
}

class _Pagina_listaState extends State<Pagina_lista> {
  final TextEditingController mensagensControlador = TextEditingController();
  final Repositorio repositorio = Repositorio();
  


  List<Data_Hora> Mensagens = [];

  


  void limparTudo(){
    setState(() {
      Mensagens.clear();
    });
    Navigator.of(context).pop();
  }

  void mostrarConfirmacao() {
    showDialog(
      context: context,
      builder:(BuildContext context) {
        return AlertDialog(
          title: Text("Limpar tarefas"),
          content: Text("tem certeza que deseja apagar?"),
          actions: [
            TextButton(
              onPressed: () { 
                Navigator.of(context).pop();
              },
              child: Text("Cancelar")
              ),

            TextButton(
              onPressed: limparTudo, 
              child: Text("Apagar", style: TextStyle(color: Colors.red),)
                )        
                ],
            
        );
      });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: mensagensControlador,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Adicione uma tarefa",
                          hintText: "Digite aqui"),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      String qualquercoisa = mensagensControlador.text;
                      

                      setState(() {
                        Data_Hora item_data_hora = Data_Hora(
                            titulo: qualquercoisa,
                            data_hora: DateTime.now());
                        Mensagens.add(item_data_hora);
                        repositorio.salvarLista(Mensagens);
                      });

                      mensagensControlador.clear();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xff0ffa00),
                        padding: EdgeInsets.all(20)),
                    child: Icon(
                      Icons.add,
                      size: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (Data_Hora mensagem_controle in Mensagens)
                      TudoItemLista(
                        mensagem_data_hora: mensagem_controle,
                        item_deletar_tarefas: deletar_tarefas,     
     
                      ),
                     
                      
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text("Você possui ${Mensagens.length} tarefas pendentes"),
                  ),

                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: mostrarConfirmacao,
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xff0ffa00),
                        padding: EdgeInsets.all(20)),
                    child: Text("Limpar"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  
  void deletar_tarefas(Data_Hora item_data_hora) {
    setState(() {
      Mensagens.remove(item_data_hora);
    });
    
  }


}