import 'package:flutter/material.dart';
import '../model/abundante_model.dart';
import '../widgets/texto_resultado.dart';

class ResultadoView extends StatelessWidget {
  const ResultadoView({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Recibe el parámetro (el objeto ResultadoVerificacion)
    //    enviado desde la ruta anterior.
    final resultado =
    ModalRoute.of(context)!.settings.arguments as ResultadoVerificacion;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado'),
        // El botón de "atrás" es agregado automáticamente por el AppBar
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            // 2. Comprueba si hubo un error
            if (resultado.mensajeError != null)
              TextoResultado(
                mensaje: resultado.mensajeError!,
                esResultadoPositivo: null, // 'null' para color de error
              )
            else
            // 3. Si no hay error, muestra el resultado
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextoResultado(
                    mensaje: resultado.esAbundante!
                        ? '¡El número ${resultado.numero} SÍ es abundante!'
                        : 'El número ${resultado.numero} NO es abundante.',
                    esResultadoPositivo: resultado.esAbundante,
                  ),
                  const SizedBox(height: 24),
                  _buildDivisores(
                      resultado.divisores, resultado.sumaDivisores),
                ],
              ),
          ],
        ),
      ),
    );
  }

  /// Widget helper para mostrar la lista de divisores
  Widget _buildDivisores(List<int> divisores, int suma) {
    String divisoresStr = divisores.join(' + ');
    String sumaStr = suma.toString();

    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Text(
        'Suma de divisores: $divisoresStr = $sumaStr',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey[700],
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}