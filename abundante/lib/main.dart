import 'package:flutter/material.dart';
import 'view/abundante_view.dart';
import 'view/resultado_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Número Abundante',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //nuevo color
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.brown[700],
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            backgroundColor: Colors.brown[600],
            foregroundColor: Colors.white,
          ),
        ),
      ),
      // la ruta inicial
      initialRoute: '/',
      // todas las rutas de la app
      routes: {
        '/': (context) => const AbundanteView(),
        '/resultado': (context) => const ResultadoView(),
      },
    );
  }
}