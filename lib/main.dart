import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/crudappcubit/crudfirebase/crudfirebase_cubit.dart';
import 'package:flutter_firebase/home_page.dart';

import 'crudappbloc/firebasecrud/firebasecrud_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyBJcHsZTUtOVcjIbgxSLVJp40EZi8eiTdA",
        authDomain: "flutter-firebase-c9620.firebaseapp.com",
        projectId: "flutter-firebase-c9620",
        storageBucket: "flutter-firebase-c9620.appspot.com",
        messagingSenderId: "1032951591597",
        appId: "1:1032951591597:web:327c4a49e631236c5c4c24",
        measurementId: "G-YRZB82ETRB",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FirebasecrudBloc()..add(ReadDataEvent()),
        ),
        BlocProvider(
          create: (context) => CrudfirebaseCubit()..readData(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomePage(),
      ),
    );
  }
}
