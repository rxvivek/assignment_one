import 'package:assignment_one/presentation/cubit/seriescubit/series_cubit.dart';
import 'package:assignment_one/presentation/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: BlocProvider(
        create: (BuildContext context) => di.sl<SeriesCubit>(),
        child: const HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}


