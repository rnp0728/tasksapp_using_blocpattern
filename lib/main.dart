import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import './screens/tasks_screen.dart';
import 'blocs/bloc_exports.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: await getApplicationDocumentsDirectory());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc(),
      child: MaterialApp(
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        title: 'Tasks App',
        theme: ThemeData(
            primarySwatch: Colors.indigo,
            useMaterial3: true
        ),
        home: TasksScreen(),
      ),
    );
  }
}
