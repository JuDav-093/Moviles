// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/bank_controller.dart';
import 'theme/theme_general.dart';
import 'views/pages/bank_pages.dart';
import 'views/pages/client_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BankController(),
      child: MaterialApp(
        title: 'Banco Bandido de Peluche',
        debugShowCheckedModeBanner: false,
        theme: appTheme, // Aplicar temas

        // Rutas
        initialRoute: BankPage.routeName, // Usamos la constante de la página
        routes: {
          BankPage.routeName: (context) => const BankPage(),
          // ¡Añadimos la nueva ruta!
          ClientDetailPage.routeName: (context) => const ClientDetailPage(),
        },
      ),
    );
  }
}