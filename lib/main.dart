import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_state.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final aceitouTermos = prefs.getBool('aceitouTermos') ?? false;
  final appState = AppState();
  runApp(MyApp(aceitouTermos: aceitouTermos, appState: appState));
}

class MyApp extends StatelessWidget {
  final bool aceitouTermos;
  final AppState appState;

  const MyApp({
    super.key,
    required this.aceitouTermos,
    required this.appState,
  });

  @override
  Widget build(BuildContext context) {
    return AppStateProvider(
      state: appState,
      child: MaterialApp(
        title: 'Ajuda Solidaria',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFE53935),
            brightness: Brightness.light,
          ),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(centerTitle: true, elevation: 2),
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
          ),
        ),
        initialRoute: aceitouTermos ? AppRoutes.home : AppRoutes.termos,
        routes: AppRoutes.staticRoutes,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
