import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mald_registration_app02/pages/home_page.dart';
import 'package:mald_registration_app02/pages/login_page.dart';
import 'package:mald_registration_app02/services/auth.dart';
import 'package:mald_registration_app02/services/data_lists.dart';
import 'package:mald_registration_app02/ui/my_dialog_box_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase

  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyBE-0TdxHzQVlpHWD1BF1b9ZbNXJbD0Aic",
    authDomain: "mald-application-app.firebaseapp.com",
    projectId: "mald-application-app",
    storageBucket: "mald-application-app.appspot.com",
    messagingSenderId: "333166939389",
    appId: "1:333166939389:web:005c94d80ada237a0dc294",
  ));

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => MyDialogBoxService(),
    ),
    ChangeNotifierProvider(
      create: (context) => DateTimeProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => FormFieldService(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // To dfine a method called getUserInfo to invoke the getUser function
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future getUserInfo() async {
    await getUser();
    setState(() {});
    print(uid);
  }

  @override
  void initState() {
    // TODO: implement initState
    getUserInfo();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MALD Registration',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home:
          const LoginPage(), //_auth.currentUser != null ? const HomePage() : const LoginPage(), //const LoginPage(),
    );
  }
}
