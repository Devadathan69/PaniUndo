import 'package:flutter/material.dart';

import 'screens/employer_shell.dart';
import 'screens/landing_screen.dart';
import 'screens/worker_shell.dart';

void main() {
  runApp(const PaniUndoApp());
}

class PaniUndoApp extends StatelessWidget {
  const PaniUndoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PaniUndo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0D9488)),
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        useMaterial3: true,
      ),
      routes: {
        '/': (_) => const LandingScreen(),
        WorkerShell.routeName: (_) => const WorkerShell(),
        EmployerShell.routeName: (_) => const EmployerShell(),
      },
    );
  }
}
