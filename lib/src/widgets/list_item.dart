import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trytiptop/src/widgets/custom_text.dart';

import '../utils/constants.dart';
import '../viewmodel/shop_viewmodel.dart';

class ListItem extends StatefulWidget {
  final String img;
  final String title;
  final num price;
  const ListItem(
      {Key? key, required this.img, required this.title, required this.price})
      : super(key: key);

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  int sayi = 1;
  @override
  void initState() {
    final shopProvider = Provider.of<ShopProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final shopProvider = Provider.of<ShopProvider>(context);
    return Row(
      // mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: size.height * 0.107, // 0.100,
          width: size.width * 0.233, //100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.black54, width: 0.6),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(widget.img))),
        ),
        SizedBox(width: size.width * 0.038),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                sizes: Sizes.normal,
                text: widget.title,
              ),
              const SizedBox(height: 5),
              CustomText(
                sizes: Sizes.small,
                text: '(6 pcs x ${sayi.toString()} pack)',
              ),
              const SizedBox(height: 5),
              CustomText(
                sizes: Sizes.normal,
                text: (widget.price * sayi).toString() + " " + "TRY",
                fontWeight: FontWeight.bold,
              )
            ],
          ),
        ),
        SizedBox(width: size.width * 0.046),
        GestureDetector(
          onTap: () {
            setState(() {
              if (sayi > 1) {
                sayi--;
                shopProvider.calculateTotalPrice(widget.price, -1);
              }
            });
          },
          child: Container(
            height: size.height * 0.043, //40,
            width: size.width * 0.070, // 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black54, width: 0.7),
                borderRadius: BorderRadius.circular(4)),
            child: Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.015), //10
              child: Center(
                child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(
                      Icons.minimize,
                      size: size.width > 500
                          ? 31
                          : size.width < 390
                              ? 18
                              : 24,
                    )),
              ),
            ),
          ),
        ),
        Container(
          height: size.height * 0.043, //40,
          width: size.width * 0.070, // 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              border: Border.all(color: Colors.black54, width: 0.7),
              borderRadius: BorderRadius.circular(4)),
          child: Center(
              child: CustomText(
            sizes: Sizes.big,
            text: sayi.toString(),
          )),
        ),
        Container(
          height: size.height * 0.043, //40,
          width: size.width * 0.070, // 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black54, width: 0.7),
              borderRadius: BorderRadius.circular(4)),
          child: Center(
            child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  setState(() {
                    sayi++;
                    shopProvider.calculateTotalPrice(widget.price, 1);
                  });
                },
                icon: Icon(
                  Icons.add,
                  size: size.width > 500
                      ? 31
                      : size.width < 390
                          ? 18
                          : 24,
                )),
          ),
        ),
      ],
    );
  }
}
