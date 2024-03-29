import 'package:get/get.dart';
import 'package:shoppr/core/utils/consts.dart';
import 'package:shoppr/presentation/screens/category_screen/item_details.dart';
import 'package:shoppr/presentation/widgets/bg_widget.dart';

class CategoryDetails extends StatelessWidget {

  final String? title;

  const CategoryDetails({super.key,required this.title});
  @override
  Widget build(BuildContext context) {

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.fontFamily(bold).white.make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(6, (index) => "baby Clothing".text.size(12).fontFamily(semibold).color(darkFontGrey).makeCentered().box.white.rounded.size(120, 60).margin(const EdgeInsets.symmetric(horizontal: 4)).make()),
                ),
              ),
              
              //items container ---------------------
              20.heightBox,
              Expanded(child: Container(
                color: lightGrey,
                child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 6,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 250,mainAxisSpacing: 8, crossAxisSpacing: 8), itemBuilder: (context,index){
                     return Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Image.asset(
                           imgP5,
                           height: 150,
                           width: 200,
                           fit: BoxFit.cover,
                         ),
                         "Laptop 4GB/64GB".text.fontFamily(semibold).color(darkFontGrey).make(),
                         10.heightBox,
                         "\$600".text.color(redColor).fontFamily(bold).size(16).make(),
                       ],
                     ).box.white.margin(const EdgeInsets.symmetric(horizontal: 4)).roundedSM.outerShadowSm.padding(const EdgeInsets.all(12)).make().onTap(() {
                       Get.to(() => const ItemDetails(title: "title"));
                     });
                }),
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
