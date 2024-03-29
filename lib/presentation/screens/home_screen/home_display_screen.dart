import 'package:shoppr/core/utils/components/featured_button.dart';
import 'package:shoppr/core/utils/consts.dart';
import 'package:shoppr/core/utils/list.dart';
import 'package:shoppr/presentation/widgets/home_display_buttons.dart';

class HomeDisplayScreen extends StatelessWidget {
  const HomeDisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(12),//12
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: Column(
          children: [
            //search bar ---------------------
            Container(
              alignment: Alignment.center,
              height: height*0.06,//60
              color: lightGrey,
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: whiteColor,
                  hintText: searchAnyThing,
                  hintStyle: TextStyle(color: textFieldGrey),
                ),
              ),
            ),
            10.heightBox,
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    //swiper brands ---------------------
                    VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: height*0.15,//150
                      enlargeCenterPage: true,
                      itemCount: slidersList.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          slidersList[index],
                          fit: BoxFit.fitWidth,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin( EdgeInsets.symmetric(horizontal: width*0.01))//8
                            .make();
                      },
                    ),
                    10.heightBox,
                    //deals Buttons ----------------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        2,
                        (index) => displayButtons(
                          height: height*0.16,//context.screenHeight * 0.15,
                          width: width*0.42,//context.screenWidth / 2.5,
                          icon: index == 0 ? icTodaysDeal : icFlashDeal,
                          title: index == 0 ? todayDeal : flashSale,
                        ),
                      ),
                    ),
                    //2nd Swiper ----------------
                    10.heightBox,
                    VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: height*0.15,//150
                      enlargeCenterPage: true,
                      itemCount: secondSlidersList.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          secondSlidersList[index],
                          fit: BoxFit.fitWidth,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin( EdgeInsets.symmetric(horizontal: width*0.02))//8
                            .make();
                      },
                    ),

                    //category buttons --------------------
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        3,
                        (index) => displayButtons(
                          height: height*0.16,//context.screenHeight * 0.15,
                          width: width*0.3,//context.screenWidth / 3.5,
                          icon: index == 0
                              ? icTopCategories
                              : index == 1
                                  ? icBrands
                                  : icTopSeller,
                          title: index == 0
                              ? topCategory
                              : index == 1
                                  ? brand
                                  : topSellers,
                        ),
                      ),
                    ).box.padding( EdgeInsets.symmetric(horizontal: width*0.001)).make(),
                    //featured categories -----------------------------
                    10.heightBox,
                    Align(
                        alignment: Alignment.centerLeft,
                        child: featuredCategories.text
                            .color(darkFontGrey)
                            .size(18)
                            .fontFamily(semibold)
                            .make()),
                    20.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          3,
                          (index) => Column(
                            children: [
                              featuredButton(
                                  icon: featuredImages1[index],
                                  title: featuredTitles1[index]),
                              10.heightBox,
                              featuredButton(
                                  icon: featuredImages2[index],
                                  title: featuredTitles2[index]),
                            ],
                          ),
                        ).toList(),
                      ),
                    ),

                    //featured product -----------------
                    20.heightBox,
                    Container(
                      padding: const EdgeInsets.all(12),
                      width: double.infinity,
                      decoration: const BoxDecoration(color: redColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          featuredProduct.text.white
                              .fontFamily(bold)
                              .size(18)
                              .make(),
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
                        ],
                      ),
                    ),
                    //3rd Swiper ---------------------------
                    20.heightBox,
                    VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: height*0.15,//150
                      enlargeCenterPage: true,
                      itemCount: secondSlidersList.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          secondSlidersList[index],
                          fit: BoxFit.fitWidth,
                        ).box.rounded.clip(Clip.antiAlias).margin( EdgeInsets.symmetric(horizontal: width*0.01)).make();
                      },
                    ),

                    //All Products--------------------------------------
                    20.heightBox,
                    GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 6,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                imgP5,
                                height: height*0.1,
                                width: width*0.35,
                                fit: BoxFit.cover,
                              ),
                              const Spacer(),
                              "Laptop 4GB/64GB".text.fontFamily(semibold).color(darkFontGrey).make(),
                              // 10.heightBox,
                              "\$600".text.color(redColor).fontFamily(bold).size(16).make(),
                            ],
                          ).box.white.margin( EdgeInsets.symmetric(horizontal: width*0.01)).roundedSM.padding(const EdgeInsets.all(12)).make();
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
