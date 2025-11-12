
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/bank_controller.dart';
import '../../theme/schema_color.dart';

class TotalInterestDisplay extends StatelessWidget {
  const TotalInterestDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Escucha al controlador para el total global
    final totalIntereses = Provider.of<BankController>(context).totalInteresesGanados;

    return Container(
      padding: const EdgeInsets.all(16.0),
      color: primaryColor.withOpacity(0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total Intereses Ganados por Banco:',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            '\$${totalIntereses.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: successColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}