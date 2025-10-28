
class ResultadoVerificacion {
  final int numero;
  final bool? esAbundante; // Null si hay error
  final int sumaDivisores;
  final List<int> divisores;
  final String? mensajeError; // Null si no hay error

  ResultadoVerificacion({
    this.numero = 0,
    this.esAbundante,
    this.sumaDivisores = 0,
    required this.divisores,
    this.mensajeError,
  });
}


class AbundanteModel {

  ResultadoVerificacion verificar(String numeroTexto) { // verifica si es abundante
    // validación de datos
    final n = int.tryParse(numeroTexto);
    if (n == null) {
      return ResultadoVerificacion(
        divisores: [],
        mensajeError: "Error: Ingrese un número valido.",
      );
    }
    if (n <= 0) {
      return ResultadoVerificacion(
        divisores: [],
        mensajeError: "Error: El número debe ser un entero positivo.",
      );
    }

    // logica similar al número perfecto)
    int sumaDivisores = 0;
    List<int> divisores = [];

    for (int i = 1; i <= n / 2; i++) {
      if (n % i == 0) {
        sumaDivisores += i;
        divisores.add(i);
      }
    }

    // 3. Comprobar la condición de "Abundante"
    bool esAbundante = sumaDivisores > n;

    // 4. Retornar el objeto de resultado
    return ResultadoVerificacion(
      numero: n,
      esAbundante: esAbundante,
      sumaDivisores: sumaDivisores,
      divisores: divisores,
    );
  }
}