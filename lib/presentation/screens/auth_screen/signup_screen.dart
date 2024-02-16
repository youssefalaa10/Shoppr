import 'package:get/get.dart';
import 'package:shoppr/core/utils/consts.dart';
import 'package:shoppr/presentation/controller/auth_controller.dart';
import 'package:shoppr/presentation/screens/home_screen/home_screen.dart';
import 'package:shoppr/presentation/widgets/applogo_widget.dart';
import 'package:shoppr/presentation/widgets/bg_widget.dart';
import 'package:shoppr/presentation/widgets/custom_button.dart';
import 'package:shoppr/presentation/widgets/textfield_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isChecked = false;
  var controller = Get.put(AuthController());

  //text controllers -------------
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                "Join to $appName".text.fontFamily(bold).white.size(18).make(),
                15.heightBox,
                Obx(
                  () => Column(
                    children: [
                      buildTextField(
                        title: name,
                        hint: nameHint,
                        controller: nameController,
                        isPass: false,
                      ),
                      buildTextField(
                        title: email,
                        hint: emailHint,
                        controller: emailController,
                        isPass: false,
                      ),
                      buildTextField(
                        title: password,
                        hint: passwordHint,
                        controller: passwordController,
                        isPass: true,
                      ),
                      buildTextField(
                        title: repeatPassword,
                        hint: passwordHint,
                        controller: passwordRetypeController,
                        isPass: true,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: forgetPassword.text.make()),
                      ),

                      //Terms and Policy
                      Row(
                        children: [
                          Checkbox(
                            checkColor: redColor,
                            value: isChecked,
                            onChanged: (newValue) {
                              setState(() {
                                isChecked = newValue;
                              });
                            },
                          ),
                          10.widthBox,
                          Expanded(
                            child: RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: "I agree to the ",
                                    style: TextStyle(
                                      fontFamily: regular,
                                      color: fontGrey,
                                    ),
                                  ),
                                  TextSpan(
                                    text: termsAndConditions,
                                    style: TextStyle(
                                      fontFamily: regular,
                                      color: redColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " &",
                                    style: TextStyle(
                                      fontFamily: regular,
                                      color: fontGrey,
                                    ),
                                  ),
                                  TextSpan(
                                    text: privacyPolicy,
                                    style: TextStyle(
                                      fontFamily: regular,
                                      color: redColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      5.heightBox,
                      controller.isLoading.value
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(redColor),
                            )
                          : customButton(
                              color: isChecked == true ? redColor : lightGrey,
                              title: signup,
                              textColor: whiteColor,
                              onPress: () async {
                                if (isChecked != false) {
                                  controller.isLoading(true);
                                  try {
                                    await controller
                                        .signUpMethod(
                                      context: context,
                                      email: emailController.text,
                                      password: passwordController.text,
                                    )
                                        .then((value) {
                                      return controller.storeUserData(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        name: nameController.text,
                                      );
                                    }).then((value) {
                                      VxToast.show(context, msg: loggedIn);
                                      Get.offAll(() => const HomeScreen());
                                    });
                                  } catch (e) {
                                    auth.signOut();
                                    VxToast.show(context, msg: e.toString());
                                    controller.isLoading(false);
                                  }
                                }
                              }).box.width(context.screenWidth - 50).make(),
                      10.heightBox,
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: alreadyHaveAccount,
                              style: TextStyle(
                                fontFamily: bold,
                                color: fontGrey,
                              ),
                            ),
                            TextSpan(
                              text: login,
                              style: TextStyle(
                                fontFamily: bold,
                                color: redColor,
                              ),
                            ),
                          ],
                        ),
                      ).onTap(() {
                        //using GetX
                        Get.back();
                      }),
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
