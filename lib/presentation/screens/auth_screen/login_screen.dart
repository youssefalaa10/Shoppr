import 'package:get/get.dart';
import 'package:shoppr/core/utils/consts.dart';
import 'package:shoppr/core/utils/list.dart';
import 'package:shoppr/presentation/controller/auth_controller.dart';
import 'package:shoppr/presentation/screens/auth_screen/signup_screen.dart';
import 'package:shoppr/presentation/screens/home_screen/home_screen.dart';
import 'package:shoppr/presentation/widgets/applogo_widget.dart';
import 'package:shoppr/presentation/widgets/bg_widget.dart';
import 'package:shoppr/presentation/widgets/custom_button.dart';
import 'package:shoppr/presentation/widgets/textfield_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                (context.screenHeight * 0.1).heightBox,
                appLogoWidget(),
                10.heightBox,
                "Log in to $appName"
                    .text
                    .fontFamily(bold)
                    .white
                    .size(18)
                    .make(),
                15.heightBox,
                Obx(
                  () => Column(
                    children: [
                      buildTextField(
                          title: email,
                          hint: emailHint,
                          isPass: false,
                          controller: controller.emailController),
                      buildTextField(
                          title: password,
                          hint: passwordHint,
                          isPass: true,
                          controller: controller.passwordController),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: forgetPassword.text.make()),
                      ),
                      5.heightBox,
                      controller.isLoading.value
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(redColor),
                            )
                          : customButton(
                              color: redColor,
                              title: login,
                              textColor: whiteColor,
                              onPress: () async {
                                controller.isLoading(true);
                                await controller.loginMethod(context: context)
                                    .then((value) {
                                  if (value != null) {
                                    VxToast.show(context, msg: loggedIn);
                                    Get.offAll(() => const HomeScreen());
                                  }else{
                                    controller.isLoading(false);
                                  }
                                });
                                //using GetX
                                // Get.to(()=>const HomeScreen());
                              }).box.width(context.screenWidth - 50).make(),
                      5.heightBox,
                      createNewAccount.text.color(fontGrey).make(),
                      5.heightBox,
                      customButton(
                          color: lightGolden,
                          title: signup,
                          textColor: redColor,
                          onPress: () {
                            //using GetX
                            Get.to(() => const SignupScreen());
                          }).box.width(context.screenWidth - 50).make(),
                      10.heightBox,
                      loginWith.text.color(fontGrey).make(),
                      5.heightBox,
                      //Social ICon Design
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: lightGrey,
                              radius: 25,
                              child: Image.asset(
                                socialListIcon[index],
                                width: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                      .box
                      .white
                      .rounded
                      .padding(const EdgeInsets.all(16))
                      .width(context.screenWidth - 70)
                      .shadowSm
                      .make(),
                ), //=> this make white box shape that fit content
              ],
            ),
          ),
        ),
      ),
    );
  }
}
