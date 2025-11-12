
import 'package:flutter/material.dart';
import '../../models/client_model.dart';
import '../../theme/schema_color.dart';

class ClientResultCard extends StatelessWidget {
  final ClientModel client;
  final int clientNumber;

  const ClientResultCard({
    Key? key,
    required this.client,
    required this.clientNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Resultados Cliente #$clientNumber',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Divider(),
            // Muestra de datos del cliente
            _buildResultRow('Saldo Anterior:', client.saldoAnterior),
            _buildResultRow('Compras:', client.montoCompras),
            _buildResultRow('Pago Realizado:', client.pagoRealizado),
            const SizedBox(height: 8),
            _buildResultRow(
              'Saldo Actual:',
              client.saldoActualFinal,
              isBold: true,
            ),
            _buildResultRow('Pago Mínimo (Referencia):', client.pagoMinimo),
            _buildResultRow(
                'Pago s/intereses (Ref.):', client.pagoParaNoGenerarIntereses),

            if (client.esMoroso)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CLIENTE MOROSO',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: errorColor, fontWeight: FontWeight.bold),
                    ),
                    _buildResultRow('Interés (12%):', client.interes),
                    _buildResultRow('Multa:', client.multa),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultRow(String label, double value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        Text(
          '\$${value.toStringAsFixed(2)}',
          style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
        ),
      ],
    );
  }
}