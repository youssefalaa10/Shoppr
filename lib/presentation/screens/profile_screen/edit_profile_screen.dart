import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppr/core/utils/consts.dart';
import 'package:shoppr/presentation/controller/profile_controller.dart';
import 'package:shoppr/presentation/widgets/bg_widget.dart';
import 'package:shoppr/presentation/widgets/custom_button.dart';
import 'package:shoppr/presentation/widgets/textfield_widget.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
   const EditProfileScreen({super.key,this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    final width = MediaQuery.of(context).size.width;
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Obx(()=> Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              controller.profileImgPath.isEmpty
                  ? Image.asset(
                      imgProfile2,
                      width: width * 0.21, //100
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make()
                  : Image.file(
                  File(controller.profileImgPath.value),
                   width: width*0.21,//100
                   fit: BoxFit.cover,
              ).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              customButton(
                color: redColor,
                onPress: () {
                  controller.changeImage(context);
                },
                textColor: whiteColor,
                title: change,
              ),
              const Divider(),
              20.heightBox,
              buildTextField(
                controller: controller.nameController,
                hint: nameHint,
                title: name,
                isPass: false,
              ),
              buildTextField(
                controller: controller.passwordController,
                hint: passwordHint,
                title: password,
                isPass: true,
              ),
              20.heightBox,
              controller.isLoading.value ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              ): SizedBox(
                width: context.screenWidth - 60,
                child: customButton(
                  color: redColor,
                  onPress: () async{
                    controller.isLoading(true);
                   await controller.uploadProfileImage();
                   await controller.updateProfile(
                     imgUrl: controller.profileImageLink,
                     name: controller.nameController.text,
                     password: controller.passwordController.text,
                   );
                   VxToast.show(context, msg: "Updated");

                  },
                  textColor: whiteColor,
                  title: save,
                ),
              ),
            ],
          )
              .box
              .white
              .shadowSm
              .padding(const EdgeInsets.all(16))
              .margin(const EdgeInsets.only(top: 50, left: 12, right: 12))
              .rounded
              .make(),
        ),
      ),
    );
  }
}
