import 'package:get/get.dart';
import 'package:shoppr/core/utils/consts.dart';
import 'package:shoppr/core/utils/list.dart';
import 'package:shoppr/presentation/screens/category_screen/category_details.dart';
import 'package:shoppr/presentation/widgets/bg_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return  bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: categories.text.fontFamily(bold).white.make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: GridView.builder(
            shrinkWrap: true,
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 200),
              itemBuilder: (context,index){
                return Column(
                  children: [
                    Image.asset(
                      categoryImages[index],
                      height: height*0.14,//120
                      width: width*0.24,//200
                      fit: BoxFit.fill,
                    ),
                    10.heightBox,
                    categoriesList[index].text.color(darkFontGrey).align(TextAlign.center).make(),
                  ],
                ).box.white.rounded.clip(Clip.antiAlias).outerShadowSm.make().onTap(() {
                  Get.to(() => CategoryDetails(title: categoriesList[index]));
                });
              },
          ),
        ),
      ),
    );
  }
}
