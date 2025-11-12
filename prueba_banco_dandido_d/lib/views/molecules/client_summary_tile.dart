// lib/views/molecules/client_summary_tile.dart
import 'package:flutter/material.dart';
import '../../models/client_model.dart';
import '../pages/client_detail.dart';

class ClientSummaryTile extends StatelessWidget {
  final ClientModel client;
  final int clientNumber;

  const ClientSummaryTile({
    Key? key,
    required this.client,
    required this.clientNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          child: Text(
            '$clientNumber',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text('Cliente #$clientNumber'),
        subtitle: Text('Saldo Final: \$${client.saldoActualFinal.toStringAsFixed(2)}'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          // Navegación a la nueva página (ruta)
          Navigator.pushNamed(
            context,
            ClientDetailPage.routeName,
            arguments: ClientDetailArguments(
              client: client,
              clientNumber: clientNumber,
            ),
          );
        },
      ),
    );
  }
}