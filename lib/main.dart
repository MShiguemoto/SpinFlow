import 'package:flutter/material.dart';
import 'package:in_class/pages/dashboard.dart';
import 'package:in_class/pages/recados.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  // 1. Transforme a função main
  // 2. Garanta que o Flutter esteja inicializado antes de mais nada
  WidgetsFlutterBinding.ensureInitialized();

  // 3. Inicialize os dados de formatação para Português do Brasil
  await initializeDateFormatting('pt_BR', null);

  // 4. Rode seu app normalmente
  runApp(const MyApp()); // Substitua MyApp pelo seu widget principal
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: TelaDashboard(),
      routes: {
        "": (context) => TelaDashboard(),
        "dashboard": (context) => TelaDashboard(),
        "recados": (context) => TelaRecados(),
      },
    );
  }
}
