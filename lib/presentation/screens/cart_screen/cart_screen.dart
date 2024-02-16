import 'package:shoppr/core/utils/consts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: "Cart is Empty!".text.fontFamily(semibold).color(darkFontGrey).makeCentered(),
    );
  }
}
