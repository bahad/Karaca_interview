import 'package:flutter/material.dart';
import 'package:trytiptop/src/utils/constants.dart';
import 'package:trytiptop/src/widgets/custom_text.dart';

class GridItem extends StatelessWidget {
  final String img;
  final String lbl;
  final bool isAvailable;
  final num prc;
  const GridItem(
      {Key? key,
      required this.img,
      required this.lbl,
      required this.prc,
      required this.isAvailable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        isAvailable
            ? Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45),
                    borderRadius: BorderRadius.circular(6)),
                child: Stack(
                  children: [
                    Image.asset(
                      img,
                    ),
                    Positioned(
                        bottom: 3,
                        right: 3,
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: AppColors.primaryColor)),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: AppColors.primaryColor,
                              size: size.width > 500
                                  ? 31
                                  : size.width < 390
                                      ? 18
                                      : 24,
                            ),
                          ),
                        ))
                  ],
                ))
            : Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45),
                    borderRadius: BorderRadius.circular(6)),
                child: Stack(
                  children: [
                    Image.asset(
                      img,
                    ),
                    Positioned.fill(
                      child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: size.height * 0.038, //36,
                            decoration: BoxDecoration(
                                color: AppColors.disabledColor.withOpacity(0.8),
                                border:
                                    Border.all(color: AppColors.disabledColor)),
                            child: Center(
                                child: CustomText(
                              text: 'Out of stock',
                              sizes: Sizes.small,
                            )),
                          )),
                    )
                  ],
                )),
        const SizedBox(height: 5),
        CustomText(
          sizes: Sizes.normal,
          text: lbl,
          color: Colors.black,
        )
      ],
    );
  }
}
