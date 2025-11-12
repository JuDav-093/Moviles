
import 'package:flutter/foundation.dart';
import '../models/client_model.dart';

class BankController with ChangeNotifier {
  final List<ClientModel> _clients = [];
  double _totalInteresesGanados = 0.0;

  List<ClientModel> get clients => _clients;
  double get totalInteresesGanados => _totalInteresesGanados;

  // Procesar un nuevo cliente
  void agregarCliente(double saldoAnterior, double compras, double pago) {
    // Enviar valores al modelo para que calcule
    final client = ClientModel(
      saldoAnterior: saldoAnterior,
      montoCompras: compras,
      pagoRealizado: pago,
    );

    // Agregar a la lista
    _clients.add(client);

    // Acumular intereses totales
    _totalInteresesGanados += client.interesGanadoParaBanco;

    // Notifica a la Vista (View) para actualizar
    notifyListeners();
  }
}