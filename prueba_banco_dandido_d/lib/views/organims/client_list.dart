import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/bank_controller.dart';
import '../molecules/client_summary_tile.dart';

class ClientList extends StatelessWidget {
  const ClientList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BankController>(context);

    if (controller.clients.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text('Aún no hay clientes. Agregue uno para ver los resultados.'),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.clients.length,
      itemBuilder: (ctx, index) {
        final client = controller.clients[index];
        // usamos ClientSummaryTile
        return ClientSummaryTile(
          client: client,
          clientNumber: index + 1,
        );
      },
    );
  }
}