import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:oodle/provider/google_SignIn.dart';
import 'package:oodle/routes/app_routes.dart';
import 'package:provider/provider.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.deepPurple,
          ),
          useMaterial3: true,
        ),
        initialRoute: AppRoutes.homepage,
        routes: AppRoutes.routes,
      ),
    );
  }
}
