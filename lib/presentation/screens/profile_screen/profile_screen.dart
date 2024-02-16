import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shoppr/core/utils/consts.dart';
import 'package:shoppr/core/utils/list.dart';
import 'package:shoppr/presentation/controller/auth_controller.dart';
import 'package:shoppr/presentation/controller/profile_controller.dart';
import 'package:shoppr/presentation/screens/auth_screen/login_screen.dart';
import 'package:shoppr/presentation/screens/profile_screen/edit_profile_screen.dart';
import 'package:shoppr/presentation/screens/profile_screen/widget/details_card.dart';
import 'package:shoppr/presentation/widgets/bg_widget.dart';
import 'package:shoppr/services/firestore_services.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    final width = MediaQuery.of(context).size.width;
    return bgWidget(
      child: Scaffold(
        body: StreamBuilder(
            stream: FirestoreServices.getUser(currentUser!.uid),
            builder:(BuildContext context, AsyncSnapshot <QuerySnapshot>snapshot){
             if (!snapshot.hasData) {
               return const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(redColor),),);
             }  else{
               var data = snapshot.data!.docs[0];
               return  SafeArea(
                   child: Column(
                 children: [
                   //edit profile button
                    Padding(
                       padding: const EdgeInsets.all(8.0),
                     child: const Align(alignment: Alignment.topRight,child: Icon(Icons.edit,color: whiteColor),).onTap(() {
                       controller.nameController.text= data['name'];
                       controller.passwordController.text= data['password'];
                       Get.to(()=> EditProfileScreen(data: data));
                     }),
                   ),

                   //users details section ------------
                   Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),
                   child: Row(
                     children: [
                       data['imageUrl'] == ''?
                       Image.asset(imgProfile2,width: 100, fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make():
                       Image.network(data['imageUrl'],width: 100, fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),
                       10.widthBox,
                       Expanded(
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               "${data['name']}".text.fontFamily(semibold).white.make(),
                               "${data['email']}".text.white.make(),
                             ],
                           ),
                       ),
                       OutlinedButton( style: OutlinedButton.styleFrom(
                         side: const BorderSide(
                           color: whiteColor,
                         ),
                       ),onPressed: () async{
                         await Get.put(AuthController()).signOutMethod(context);
                         Get.offAll(() => const LoginScreen());
                       },
                           child: logout.text.fontFamily(semibold).white.make(),),
                     ],
                   ),
                   ),
                   20.heightBox,
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       detailsCard(count: data['cart_count'],title: "in your cart",width: context.screenWidth / 3.4),
                       detailsCard(count: data['wishlist_count'],title: "in your wishlist",width: context.screenWidth/3.4),
                       detailsCard(count: data['order_count'],title: "your orders",width: context.screenWidth/3.4),
                     ],
                   ),

                   ListView.separated(
                       shrinkWrap: true,
                       separatorBuilder: (context, index) {
                         return const Divider(color: lightGrey,);
                       },
                       itemCount: profileButtonsList.length,
                       itemBuilder: (BuildContext context, int index){
                         return ListTile(
                           leading: Image.asset(profileButtonsIcon[index],
                           width: 22,
                           ),
                           title: profileButtonsList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                         );
                       },
                   ).box.white.rounded.margin(const EdgeInsets.all(12)).padding(const EdgeInsets.symmetric(horizontal: 16)).shadowSm.make().box.color(redColor).make(),
                   ],
                 ),
               );
             }

            },
        ),
      ),
    );
  }
}
