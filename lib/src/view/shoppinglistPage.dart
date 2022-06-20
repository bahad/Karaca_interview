import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trytiptop/src/utils/constants.dart';
import 'package:trytiptop/src/widgets/custom_text.dart';

import '../viewmodel/shop_viewmodel.dart';
import '../widgets/list_item.dart';

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({Key? key}) : super(key: key);

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  num quantity = 1;

  @override
  void initState() {
    final shopProvider = Provider.of<ShopProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final shopProvider = Provider.of<ShopProvider>(context);
    //print(shopProvider.shopList[0].img);
    return Scaffold(
      appBar: _buildAppBar(size),
      bottomSheet: _buildBottomSheet(size),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(6),
                itemCount: shopProvider.shopList.length,
                itemBuilder: ((context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(6),
                      child: ListItem(
                          img: shopProvider.shopList[index].img!,
                          title: shopProvider.shopList[index].text!,
                          price: shopProvider.shopList[index].price!));
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildBottomSheet(Size size) {
    final shopProvider = Provider.of<ShopProvider>(context);
    return Container(
        decoration: BoxDecoration(color: AppColors.secondaryColor),
        width: size.width,
        height: size.height * 0.13,
        child: Center(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  maximumSize: Size(size.width / 1.2, 50),
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6))),
              onPressed: () {},
              child: Row(
                children: [
                  Flexible(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6),
                              bottomLeft: Radius.circular(6)),
                          color: AppColors.primaryColor,
                        ),
                        child: Center(
                            child: CustomText(
                          sizes: Sizes.title,
                          text: 'Check Out',
                          color: Colors.black,
                        )),
                      )),
                  Flexible(
                      flex: 3,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(6),
                                  bottomRight: Radius.circular(6)),
                              color: Colors.white),
                          child: Center(
                              child: CustomText(
                            sizes: Sizes.big,
                            text: shopProvider.totalPrice.toString() + " TRY",
                            color: Colors.black,
                          )))),
                ],
              )),
        ));
  }

  AppBar _buildAppBar(Size size) {
    final shopProvider = Provider.of<ShopProvider>(context);
    return AppBar(
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
      title: CustomText(
        sizes: Sizes.title,
        text: 'Market Card',
        color: Colors.black,
      ),
      actions: [
        IconButton(
            onPressed: () {
              shopProvider.removeAll();
              shopProvider.nullTotalPrice();
            },
            icon: Icon(
              Icons.delete_outline,
              color: Colors.black,
              size: size.width > 500
                  ? 31
                  : size.width < 390
                      ? 18
                      : 24,
            ))
      ],
    );
  }
}
