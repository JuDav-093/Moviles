import 'package:flutter/material.dart';

class InputNumero extends StatelessWidget {
  final TextEditingController controller;

  const InputNumero({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'Ingresa un número (ej. 28)',
        prefixIcon: Icon(Icons.numbers),
        border: OutlineInputBorder(),
      ),
      // Teclado numérico
      keyboardType: TextInputType.number,
    );
  }
}