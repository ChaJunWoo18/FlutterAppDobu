import 'package:flutter/material.dart';
import 'package:prob/db/sqflite_control.dart';
import 'package:prob/db/use_sqflite.dart';
import 'package:prob/provider/look_list_provider.dart';
import 'package:prob/screens/consumption_history.dart';
import 'package:prob/screens/home.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SqfliteControl.initializeDatabase();
  SqfliteControl.deleteTestData();
  var useSqflite = UseSqflite();
  await useSqflite.insertTestData();

  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LookListProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffFEBBCC),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Color.fromARGB(255, 206, 122, 143),
          ),
        ),
        cardColor: const Color(0xffFFEECC),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/history': (context) => const ConsumptionHistory(),
        //'/settings': (context) => SettingsScreen(),
      },
    );
  }
}
