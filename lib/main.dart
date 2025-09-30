import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task18_m24/src/data/request/fake_start.dart';
 import 'package:task18_m24/src/di.dart';
import 'package:task18_m24/src/presentation/bloc/main_bloc.dart';
import 'package:task18_m24/src/presentation/pages/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  await seedProducts();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<MainBloc>()..add(MainInitEvent()),
      child: MaterialApp(
        title: 'M 24',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: MainPage(),
      ),
    );
   }
}

