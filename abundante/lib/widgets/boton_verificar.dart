import 'package:flutter/material.dart';

class BotonVerificar extends StatelessWidget {
  final VoidCallback onPressed;

  const BotonVerificar({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.check_circle_outline),
      label: const Text('Verificar'),
      onPressed: onPressed,
    );
  }
}