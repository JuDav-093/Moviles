
class ClientModel {
  // Datos de entrada
  final double saldoAnterior;
  final double montoCompras;
  final double pagoRealizado;

  // Datos calculados
  late double saldoActualBase;
  late double pagoMinimo;
  late double pagoParaNoGenerarIntereses;
  late double interes;
  late double multa;
  late double saldoActualFinal;
  late bool esMoroso;
  late double interesGanadoParaBanco;

  ClientModel({
    required this.saldoAnterior,
    required this.montoCompras,
    required this.pagoRealizado,
  }) {
    //  cálculos en el constructor al crear el objeto.

    // Saldo actual base
    saldoActualBase = saldoAnterior + montoCompras - pagoRealizado;

    // Pagos requeridos.
    // Asumimos que es sobre el saldo *después* del pago, pero *antes* de intereses.
    pagoMinimo = saldoActualBase * 0.15;
    pagoParaNoGenerarIntereses = saldoActualBase * 0.85;

    // Verificamos si no se realizó el pago mínimo
    // 'pago mínimo' se calcula sobre el saldo *adeudado* (anterior + compras), no sobre saldo res

    double deudaTotal = saldoAnterior + montoCompras;
    double pagoMinimoRequerido = deudaTotal * 0.15;

    if (pagoRealizado < pagoMinimoRequerido) {
      esMoroso = true;
      interes = saldoActualBase * 0.12; // 12% del saldo actual
      multa = 200.0;

      // Nuevo saldo con intereses
      saldoActualFinal = saldoActualBase + interes + multa;
      interesGanadoParaBanco = interes;
    } else {
      esMoroso = false;
      interes = 0.0;
      multa = 0.0;
      saldoActualFinal = saldoActualBase;
      interesGanadoParaBanco = 0.0; //
    }
  }
}