import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trytiptop/src/utils/constants.dart';
import 'package:trytiptop/src/model/shopping_model.dart';
import 'package:trytiptop/src/view/homepage.dart';
import 'package:trytiptop/src/view/shoppinglistPage.dart';
import 'package:trytiptop/src/viewmodel/shop_viewmodel.dart';
import 'package:trytiptop/src/widgets/custom_text.dart';

import '../widgets/grid_item.dart';

class NavHome extends StatefulWidget {
  const NavHome({Key? key}) : super(key: key);

  @override
  State<NavHome> createState() => _NavHomeState();
}

class _NavHomeState extends State<NavHome> {
  int _selectedNavIndex = 0;
  int _selectedCategoryIndex = 0;

  @override
  void initState() {
    final shopProvider = Provider.of<ShopProvider>(context, listen: false);
    super.initState();
  }

  void changeIndex(int index) {
    setState(() {
      _selectedNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final shopProvider = Provider.of<ShopProvider>(context);
    //print(shopProvider.shopList[0].img);
    return DefaultTabController(
        length: 7,
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
            width: size.width > 500
                ? 80
                : size.width < 390
                    ? 50
                    : 60,
            height: size.width > 500
                ? 80
                : size.width < 390
                    ? 50
                    : 60,
            child: FittedBox(
              child: FloatingActionButton(
                backgroundColor: AppColors.thirdColor,
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColors.primaryColor,
                  size: size.width > 500
                      ? 45
                      : size.width < 390
                          ? 24
                          : 30,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShoppingListPage()));
                },
              ),
            ),
          ),
          appBar: _buildAppbar(size),
          body: TabBarView(
            children: [
              _buildBody(size),
              Text('Water'),
              Text('Dairy'),
              Text('Meat'),
              Text('Bread'),
              Text('Fruits'),
              Text('Wegan'),
            ],
          ),
          bottomNavigationBar: _buildBottomNav(size),
        ));
  }

  AppBar _buildAppbar(Size size) {
    final shopProvider = Provider.of<ShopProvider>(context);
    return AppBar(
        elevation: 0,
        title: CustomText(
          sizes: Sizes.big,
          text: 'Products',
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              children: [
                Container(
                  height: size.height * 0.038, //36,
                  width: size.width * 0.120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                          bottomRight: Radius.circular(6)),
                      color: Colors.white),
                  child: Center(
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: AppColors.secondaryColor,
                      size: size.width > 500
                          ? 31
                          : size.width < 390
                              ? 18
                              : 24,
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.038, //36,
                  width: size.width * 0.178,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(6),
                          bottomRight: Radius.circular(6)),
                      color: AppColors.secondaryColor),
                  child: Center(
                      child: CustomText(
                    textAlign: TextAlign.center,
                    text: shopProvider.totalPrice.toString() + " TRY",
                    sizes: Sizes.small,
                  )),
                ),
              ],
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.061), //
          child: Container(
            height: size.height * 0.049, //40,
            color: Color(0xFFebd496),
            child: TabBar(
              labelColor: Colors.black,
              indicatorColor: AppColors.secondaryColor,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 5,
              isScrollable: true,
              tabs: [
                CustomText(
                  sizes: Sizes.normal,
                  text: 'Drinks',
                  color: Colors.black,
                ),
                CustomText(
                  sizes: Sizes.normal,
                  text: 'Water',
                  color: Colors.black,
                ),
                CustomText(
                  sizes: Sizes.normal,
                  text: 'Dairy',
                  color: Colors.black,
                ),
                CustomText(
                  sizes: Sizes.normal,
                  text: 'Meat',
                  color: Colors.black,
                ),
                CustomText(
                  sizes: Sizes.normal,
                  text: 'Bread',
                  color: Colors.black,
                ),
                CustomText(
                  sizes: Sizes.normal,
                  text: 'Fruits',
                  color: Colors.black,
                ),
                CustomText(
                  sizes: Sizes.normal,
                  text: 'Wegan',
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ));
  }

  BottomNavigationBar _buildBottomNav(size) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFF293251),
      currentIndex: _selectedNavIndex,
      unselectedIconTheme: IconThemeData(color: Colors.white38),
      iconSize: size.width > 500
          ? 45
          : size.width < 390
              ? 26
              : 34,
      selectedIconTheme: IconThemeData(
        color: Color(0xFFffc63b),
      ),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_outlined), label: 'Favorite'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: 'Profile'),
      ],
    );
  }

  Widget _buildContentList(size) {
    List contentArr = [
      "Soft Drinks",
      "Energy Drinks",
      "Iced Tea && Coffee",
      "Malt Drinks"
    ];
    return Container(
      height: size.height * 0.053, //50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: contentArr.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedCategoryIndex = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: index == _selectedCategoryIndex
                          ? AppColors.secondaryColor
                          : Colors.white,
                      border: Border.all(color: Colors.black54, width: 0.5),
                      borderRadius: BorderRadius.circular(6)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: CustomText(
                            sizes: Sizes.small,
                            text: contentArr[index],
                            color: _selectedCategoryIndex == index
                                ? Colors.white
                                : Colors.black)),
                  ),
                ),
              ),
            );
          })),
    );
  }

  Widget _buildBody(size) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildContentList(size),
              const SizedBox(height: 15),
              _buildGridView(),
            ],
          ),
        ));
  }

  Widget _buildGridView() {
    final shopProvider = Provider.of<ShopProvider>(context);
    List images = [
      "assets/images/coke.jpeg",
      "assets/images/fanta.jpeg",
      "assets/images/icetea.jpeg",
      "assets/images/lemonade.jpeg",
      "assets/images/pomegranate.jpeg",
      "assets/images/redbull.jpeg",
      "assets/images/strawberry_juice.jpeg",
    ];
    List labels = [
      "Coke",
      "Fanta",
      "Icetea",
      "Lemonade",
      "Pomegranate",
      "Redbull",
      "Straw Juice"
    ];
    List isAvailable = [
      true,
      true,
      true,
      true,
      true,
      true,
      false,
    ];
    List<num> price = [2200, 2200, 2200, 1000, 1000, 2000, 1000];
    return Container(
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: labels.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              crossAxisCount: 3,
              childAspectRatio: 0.8),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                if (isAvailable[index]) {
                  shopProvider.addToList(ShoppingModel(
                      img: images[index],
                      text: labels[index],
                      price: price[index]));
                  shopProvider.calculateTotalPrice(price[index], 1);
                }
              },
              child: GridItem(
                img: images[index],
                lbl: labels[index],
                prc: price[index],
                isAvailable: isAvailable[index],
              ),
            );
          }),
    );
  }
}
