import 'package:flutter/material.dart';
import 'screens/pantalla_principal.dart';
import 'screens/pantalla_inicio_sesion.dart';
import 'screens/pantalla_registro.dart';
import 'screens/pantalla_campos_personales.dart';

void main() {
  runApp(const MatchRoomApp());
}

class MatchRoomApp extends StatelessWidget {
  const MatchRoomApp({super.key});

  static const Color brandBlue = Color(0xFF2A5DA8);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: brandBlue),
      useMaterial3: false,
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 40, fontWeight: FontWeight.w800, color: brandBlue, height: 1.0),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: brandBlue,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 1.5,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black87,
          side: const BorderSide(color: Colors.black26),
          minimumSize: const Size.fromHeight(50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );

    return MaterialApp(
      title: 'MatchRoom',
      theme: theme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => const PantallaPrincipal(),
        '/login': (_) => const PantallaInicioSesion(),
        '/register': (_) => const PantallaRegistro(),
        '/personal': (_) => const PantallaCamposPersonales(),
      },
    );
  }
}
