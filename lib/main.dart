import 'package:etec_center/spash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authentication/log_in.dart';
import 'check_auth/fuction_signin.dart';
import 'home_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<Auth>(
            create: (context) => Auth(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) => context.read<Auth>().authStateChange,
            initialData: null,
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => const Splash_screen(),
            '/auth': (context) => const CheckAuthentication(),
            '/home': (context) => const Homepage()
          },
        ));
  }
}

class CheckAuthentication extends StatelessWidget {
  const CheckAuthentication({Key, key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return const Homepage();
        } else {
          return const Login();
        }
      },
    );
  }
}
