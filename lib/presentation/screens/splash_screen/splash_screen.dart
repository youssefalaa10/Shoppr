import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoppr/core/utils/consts.dart';
import 'package:shoppr/presentation/screens/auth_screen/login_screen.dart';
import 'package:shoppr/presentation/screens/home_screen/home_display_screen.dart';
import 'package:shoppr/presentation/screens/home_screen/home_screen.dart';
import 'package:shoppr/presentation/widgets/applogo_widget.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  changeScreen(){
    Future.delayed(const Duration(seconds: 3),(){
      //use GetX
      // Get.to(()=> const LoginScreen());
      auth.authStateChanges().listen((User? user) {
        if(user == null && mounted){
          Get.to(()=> const LoginScreen());
        }else{
          Get.to(()=> const HomeDisplayScreen());
        }
      });
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
            Align(alignment: Alignment.topLeft,child: Image.asset(icSplashBg,width: 300,)),
            20.heightBox,
            appLogoWidget(),
            10.heightBox,
            appName.text.fontFamily(bold).size(22).white.make(),
            5.heightBox,
            appSubName.text.white.make(),
            const Spacer(),
            credits.text.white.fontFamily(semibold).make(),
            30.heightBox,
          ],
        ),
      ),
    );
  }
}
