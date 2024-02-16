import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shoppr/core/utils/consts.dart';
import 'package:shoppr/firebase_options.dart';
import 'package:shoppr/presentation/screens/splash_screen/splash_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    // cause using GetX I have to change materialApp to getMaterialApp
    return GetMaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          color: darkFontGrey,
        ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        fontFamily: regular,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
