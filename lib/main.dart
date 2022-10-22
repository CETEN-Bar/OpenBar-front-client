import 'package:flutter/material.dart';
import 'package:openbar/authentication/auth.page.dart';
import 'package:provider/provider.dart';
import 'authentication/auth.model.dart';
import 'basket/basket.model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Basket()),
      ChangeNotifierProvider(create: (context) => AuthModel())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const appName = 'OpenBar';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color.fromARGB(255, 103, 80, 164),
            onPrimary: Color.fromARGB(255, 255, 255, 255),
            primaryContainer: Color.fromARGB(255, 234, 221, 255),
            onPrimaryContainer: Color.fromARGB(255, 33, 0, 93),
            secondary: Color.fromARGB(255, 98, 91, 113),
            onSecondary: Color.fromARGB(255, 255, 255, 255),
            secondaryContainer: Color.fromARGB(255, 232, 222, 248),
            onSecondaryContainer: Color.fromARGB(255, 29, 25, 43),
            tertiary: Color.fromARGB(255, 125, 82, 96),
            onTertiary: Color.fromARGB(255, 255, 255, 255),
            tertiaryContainer: Color.fromARGB(255, 255, 216, 228),
            onTertiaryContainer: Color.fromARGB(255, 49, 17, 29),
            error: Color.fromARGB(255, 179, 38, 30),
            onError: Color.fromARGB(255, 255, 255, 255),
            errorContainer: Color.fromARGB(255, 249, 222, 220),
            onErrorContainer: Color.fromARGB(255, 65, 14, 11),
            background: Color.fromARGB(255, 253, 253, 245),
            onBackground: Color.fromARGB(255, 25, 28, 24),
            surface: Color.fromARGB(255, 253, 253, 245),
            onSurface: Color.fromARGB(255, 25, 28, 24),
            surfaceVariant: Color.fromARGB(255, 224, 229, 215),
            onSurfaceVariant: Color.fromARGB(255, 67, 72, 62),
            outline: Color.fromARGB(255, 114, 119, 108)),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 234, 221, 255),
          foregroundColor: Color.fromARGB(255, 33, 0, 93),
        ),
      ),
      home: const LoginPage(),
    );
  }
}
