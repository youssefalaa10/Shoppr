import 'package:shoppr/core/utils/consts.dart';
import 'package:shoppr/core/utils/list.dart';
import 'package:shoppr/presentation/widgets/custom_button.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key, required this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.share,)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_outline,)),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: Padding(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                //swiper section -----------------
                  VxSwiper.builder(
                      autoPlay: true,
                      height: 350,
                      aspectRatio: 16/9,
                      itemCount: 3, itemBuilder: (context,index){
                    return Image.asset(imgFc5,width: double.infinity,fit: BoxFit.cover,);
                  }),
                  10.heightBox,
                  //title & details section ---------------
                  title!.text.size(16).color(darkFontGrey).fontFamily(semibold).make(),
                  10.heightBox,
                  //rating ----------------------------------
                  VxRating(
                  onRatingUpdate: (value){},
                  normalColor: textFieldGrey,
                  selectionColor: golden,
                  // maxRating: 5,
                  count: 5,
                  size: 25,
                  stepInt: false,
                  ),
                  10.heightBox,
                  "\$50,00".text.color(redColor).fontFamily(bold).make(),
                  10.heightBox,
                  Row(
                    children: [
                      Expanded(child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Seller".text.white.fontFamily(semibold).make(),
                          5.heightBox,
                          "In House Brands".text.fontFamily(semibold).color(darkFontGrey).size(16).make(),
                        ],
                      ),),
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.message_rounded,color: darkFontGrey,),
                      ),
                    ],
                  ).box.height(60).padding(const EdgeInsets.symmetric(horizontal: 16)).color(textFieldGrey).make(),
                  // choose Color Section---------------
                  20.heightBox,
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Color: ".text.color(textFieldGrey).make(),
                          ),
                          Row(
                            children: List.generate(3, (index) => VxBox().size(40, 40).roundedFull.color(Vx.randomPrimaryColor).margin(const EdgeInsets.symmetric(horizontal: 4)).make(),),
                          ),
                        ],
                      ).box.padding(const EdgeInsets.all(8)).make(),

                      //quantity row --------------
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Quantity: ".text.color(textFieldGrey).make(),
                          ),
                          Row(
                            children: [
                              IconButton(onPressed: (){}, icon: const Icon(Icons.remove),),
                              "0".text.size(16).color(darkFontGrey).fontFamily(bold).make(),
                              IconButton(onPressed: (){}, icon: const Icon(Icons.add),),
                              10.widthBox,
                              "(0 available)".text.color(textFieldGrey).make(),
                            ],
                          ),
                        ],
                      ).box.padding(const EdgeInsets.all(8)).make(),
                    // Total row ------------------
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Total: ".text.color(textFieldGrey).make(),
                          ),
                          "\$0.00".text.color(redColor).size(16).fontFamily(bold).make(),
                        ],
                      ).box.padding(const EdgeInsets.all(8)).make(),

                    ],
                  ).box.white.shadowSm.make(),

                  //description section -------------
                  10.heightBox,
                  "Description".text.color(darkFontGrey).fontFamily(semibold).make(),
                  10.heightBox,
                  "this box for typing description ...".text.color(darkFontGrey).make(),
                 //buttons section------------------
                  10.heightBox,
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(
                      itemDetailButtonsList.length,
                      (index) => ListTile(
                      title: itemDetailButtonsList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                      trailing: const Icon(Icons.arrow_forward),
                    ),),
                  ),
                  20.heightBox,
                  //products you may like---------------
                  productsYouMayLike.text.fontFamily(bold).size(16).color(darkFontGrey).make(),
                  10.heightBox,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        6,
                            (index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              imgP1,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            10.heightBox,
                            "Laptop 4GB/64GB"
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                            10.heightBox,
                            "\$600"
                                .text
                                .color(redColor)
                                .fontFamily(bold)
                                .size(16)
                                .make(),
                          ],
                        )
                            .box
                            .white
                            .margin(const EdgeInsets.symmetric(
                            horizontal: 4))
                            .roundedSM
                            .padding(const EdgeInsets.all(8))
                            .make(),
                      ),
                    ),
                  ),
                // ----------------------
                ],
              ),
            ),
          ),),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: customButton(
              color: redColor,
              onPress: (){},
              textColor: whiteColor,
              title: "Add to cart",
            ),
          ),
        ],
      ),
    );
  }
}
