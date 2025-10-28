import 'package:flutter/material.dart';

class TextoResultado extends StatelessWidget {
  final String mensaje;
  final bool? esResultadoPositivo;

  const TextoResultado({
    super.key,
    required this.mensaje,
    this.esResultadoPositivo, // Puede ser true, false, o null
  });

  @override
  Widget build(BuildContext context) {
    if (mensaje.isEmpty) {
      return const SizedBox.shrink();
    }

    IconData icono;
    Color color;

    if (esResultadoPositivo == null) { // Error o Neutral
      icono = Icons.error_outline;
      color = Colors.red[700]!;
    } else if (esResultadoPositivo == true) { // Éxito (BAJO)
      icono = Icons.check_circle;
      color = Colors.green[700]!;
    } else { // Advertencia (SUBIO)
      icono = Icons.cancel;
      color = Colors.orange[800]!;
    }

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: color, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icono, color: color, size: 28),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              mensaje,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}