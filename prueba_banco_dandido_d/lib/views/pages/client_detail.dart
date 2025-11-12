
import 'package:flutter/material.dart';
import '../../models/client_model.dart';
import '../molecules/client_result_card.dart';

class ClientDetailArguments {
  final ClientModel client;
  final int clientNumber;

  ClientDetailArguments({required this.client, required this.clientNumber});
}

class ClientDetailPage extends StatelessWidget {
  const ClientDetailPage({Key? key}) : super(key: key);

  // ruta para el main.dart
  static const String routeName = '/clientDetail';

  @override
  Widget build(BuildContext context) {
    // Extraemos los argumentos  Navigator.pushNamed
    final args =
    ModalRoute.of(context)!.settings.arguments as ClientDetailArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle Cliente #${args.clientNumber}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Reutilizamos la molécula
        child: ClientResultCard(
          client: args.client,
          clientNumber: args.clientNumber,
        ),
      ),
    );
  }
}