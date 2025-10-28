import 'package:flutter/material.dart';
import '../model/abundante_model.dart';
import '../controller/abundante_controller.dart';
import '../widgets/input_numero.dart'; //
import '../widgets/boton_verificar.dart'; //

class AbundanteView extends StatefulWidget {
  const AbundanteView({super.key});

  @override
  State<AbundanteView> createState() => _AbundanteViewState();
}

class _AbundanteViewState extends State<AbundanteView> {
  // La Vista sigue "poseyendo" el modelo y el controlador
  late final AbundanteModel _model;
  late final AbundanteController _controller;

  @override
  void initState() {
    super.initState();
    _model = AbundanteModel();
    // Ya no pasamos el callback setState()
    _controller = AbundanteController(model: _model);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verificar Número Abundante'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            Text(
              '¿Es un Número Abundante?',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.brown[800],
              ),
            ),
            const SizedBox(height: 32),
            InputNumero(controller: _controller.numeroController),
            const SizedBox(height: 24),
            // El botón ahora llama al controlador pasándole el 'context'
            BotonVerificar(
              onPressed: () {
                _controller.onVerificar(context);
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}