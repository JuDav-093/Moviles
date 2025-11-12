
import 'package:flutter/material.dart';
import '../molecules/client_input_form.dart';
import '../organims/client_list.dart';
import '../organims/total_interest_display.dart';

class BankPage extends StatelessWidget {
  const BankPage({Key? key}) : super(key: key);

  static const String routeName = '/'; // Ruta para el main

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banco "Bandido de peluche"'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            // Formulario de entrada
            ClientInputForm(),

            SizedBox(height: 16),

            // Total de intereses (Global)
            TotalInterestDisplay(),

            SizedBox(height: 16),

            // Título para la lista de clientes
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Clientes Procesados',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),

            // Lista de resultados (tiles)
            ClientList(),
          ],
        ),
      ),
    );
  }
}