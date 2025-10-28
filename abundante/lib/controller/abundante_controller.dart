import 'package:flutter/material.dart';
import '../model/abundante_model.dart';

class AbundanteController {
  final AbundanteModel model;
  final TextEditingController numeroController = TextEditingController();

  AbundanteController({required this.model});


  /// inicia el cálculo y pasa la pantalla de resultados.(usuario presiona "Verificar")
  void onVerificar(BuildContext context) {
    // 1. Llama a la lógica del modelo
    final resultado = model.verificar(numeroController.text);

    // 2. Navega a la ruta '/resultado' y pasa el objeto como parámetro (arguments).
    Navigator.pushNamed(context, '/resultado', arguments: resultado);
  }

  void dispose() {
    numeroController.dispose();
  }
}