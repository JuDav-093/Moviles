
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/bank_controller.dart';
import '../atoms/custom_textfield.dart';
import '../atoms/primary_button.dart';

class ClientInputForm extends StatefulWidget {
  const ClientInputForm({Key? key}) : super(key: key);

  @override
  State<ClientInputForm> createState() => _ClientInputFormState();
}

class _ClientInputFormState extends State<ClientInputForm> {
  final _formKey = GlobalKey<FormState>();
  final _saldoAnteriorController = TextEditingController();
  final _comprasController = TextEditingController();
  final _pagoController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Leer datos de la vista
      final saldoAnterior = double.parse(_saldoAnteriorController.text);
      final compras = double.parse(_comprasController.text);
      final pago = double.parse(_pagoController.text);

      // Enviar datos al controlador
      Provider.of<BankController>(context, listen: false)
          .agregarCliente(saldoAnterior, compras, pago);

      // Limpiar formularios
      _saldoAnteriorController.clear();
      _comprasController.clear();
      _pagoController.clear();
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              controller: _saldoAnteriorController,
              label: 'Saldo Anterior',
              icon: Icons.account_balance_wallet,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _comprasController,
              label: 'Monto de Compras',
              icon: Icons.shopping_cart,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _pagoController,
              label: 'Pago Realizado',
              icon: Icons.payment,
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              text: 'Calcular y Agregar Cliente',
              onPressed: _submitForm,
            ),
          ],
        ),
      ),
    );
  }
}