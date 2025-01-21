import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_flutter/svg.dart';

import '../../../bloc/core/colors.dart';
import '../../../bloc/core/text_styles.dart';
import '../../../widgets/custom_text_fields.dart';

class FoodPandaHomePage extends StatelessWidget {
  const FoodPandaHomePage({super.key});
  static const id = "home_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // SliverAppBar for the fixed header with icons and location
          SliverAppBar(
            backgroundColor: whiteColor,
            elevation: 0,
            pinned: true, // Keeps the AppBar visible at the top
            floating: false,
            automaticallyImplyLeading: false,
            scrolledUnderElevation: 10.0,
            expandedHeight: 160.0,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                // Get the height of the app bar and determine if it's collapsed
                var top = constraints.biggest.height;
                bool isCollapsed = top <= kToolbarHeight + MediaQuery.of(context).padding.top;
                return FlexibleSpaceBar(
                  titlePadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  title: isCollapsed
                      ? const CustomTextField(
                          hintText: "Search for shops & restaurants",
                        )
                      : null,
                  background: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.menu,
                              size: 30,
                              color: mainColor,
                            ),
                            const Spacer(),
                            SvgPicture.asset("assets/icons/fab_icon.svg"),
                            const SizedBox(width: 20),
                            SvgPicture.asset("assets/icons/cart_icon.svg"),
                          ],
                        ),
                        const CustomTextField(
                          hintText: "Search for shops & restaurants",
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Main content with staggered grid and list
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // Top Section with Greeting and Image
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Text(
                              'Good Evening, Smrity',
                              style: textStyleF14W700(),
                            ),
                            Text(
                              'What’s for dinner? There are 567\nrestaurants in your area',
                              style: textStyleF10W400(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/images/food_1.png",
                          height: 90,
                          width: 90,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
                // Food Delivery Section
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(color: mainColor, borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Food Delivery',
                              style: textStyleF14W700(color: whiteColor),
                            ),
                            Text(
                              'Order food you love',
                              style: textStyleF11W400(color: whiteColor),
                            ),
                          ],
                        ),
                      ),
                      Image.asset('assets/images/food_2.png'),
                    ],
                  ),
                ),
                // Staggered Grid Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: StaggeredGrid.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: [
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2.5,
                        child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                            decoration: BoxDecoration(color: yellowColor, borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/food_3.png',
                                  height: 100,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'pandamart',
                                  style: textStyleF14W700(),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Everyday up to\n20% off',
                                  style: textStyleF10W400(),
                                ),
                              ],
                            )),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 1.5,
                        child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(color: pinkColor, borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/food_4.png',
                                  height: 50,
                                  width: double.infinity,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'Pick-Up',
                                  style: textStyleF14W700(),
                                ),
                                Text(
                                  'Everyday up to\n25% off',
                                  style: textStyleF10W400(),
                                ),
                              ],
                            )),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 1,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(color: blueColor, borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/food_5.png',
                                height: 40,
                                width: double.infinity,
                              ),
                              Text(
                                'Shops',
                                style: textStyleF14W700(),
                              ),
                              Text(
                                'Grocery & more..',
                                style: textStyleF10W400(),
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Your Restaurants Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Your Restaurants',
                    style: textStyleF14W600(),
                  ),
                ),
                // Restaurants List Section
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 200,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    separatorBuilder: (context, index) => const SizedBox(width: 10),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Handle navigation to detail page
                        },
                        child: Container(
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: const Color(0xffE0E0E0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Image.asset("assets/images/food_6.png"),
                                  Positioned(
                                    top: 5,
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: darkPinkColor,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Text(
                                        'Best Food Deals',
                                        style: textStyleF8W500(color: whiteColor),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    left: 10,
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: whiteColor,
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(color: Colors.white54, width: 1),
                                      ),
                                      child: Text(
                                        '30 min',
                                        style: textStyleF8W500(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Subway - Dhaka',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Fast Food, American, Meat, Halal',
                                style: textStyleF10W400(color: blackColor.withValues(alpha: 0.7)),
                              ),
                              Text(
                                '৳150 delivery free',
                                style: textStyleF8W500(),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // Top Section with Greeting and Image
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Text(
                              'Good Evening, Smrity',
                              style: textStyleF14W700(),
                            ),
                            Text(
                              'What’s for dinner? There are 567\nrestaurants in your area',
                              style: textStyleF10W400(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/images/food_1.png",
                          height: 90,
                          width: 90,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
                // Food Delivery Section
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(color: mainColor, borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Food Delivery',
                              style: textStyleF14W700(color: whiteColor),
                            ),
                            Text(
                              'Order food you love',
                              style: textStyleF11W400(color: whiteColor),
                            ),
                          ],
                        ),
                      ),
                      Image.asset('assets/images/food_2.png'),
                    ],
                  ),
                ),
                // Staggered Grid Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: StaggeredGrid.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: [
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2.5,
                        child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                            decoration: BoxDecoration(color: yellowColor, borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/food_3.png',
                                  height: 100,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'pandamart',
                                  style: textStyleF14W700(),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Everyday up to\n20% off',
                                  style: textStyleF10W400(),
                                ),
                              ],
                            )),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 1.5,
                        child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(color: pinkColor, borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/food_4.png',
                                  height: 50,
                                  width: double.infinity,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'Pick-Up',
                                  style: textStyleF14W700(),
                                ),
                                Text(
                                  'Everyday up to\n25% off',
                                  style: textStyleF10W400(),
                                ),
                              ],
                            )),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 1,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(color: blueColor, borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/food_5.png',
                                height: 40,
                                width: double.infinity,
                              ),
                              Text(
                                'Shops',
                                style: textStyleF14W700(),
                              ),
                              Text(
                                'Grocery & more..',
                                style: textStyleF10W400(),
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Your Restaurants Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Your Restaurants',
                    style: textStyleF14W600(),
                  ),
                ),
                // Restaurants List Section
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 200,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    separatorBuilder: (context, index) => const SizedBox(width: 10),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Handle navigation to detail page
                        },
                        child: Container(
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: const Color(0xffE0E0E0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Image.asset("assets/images/food_6.png"),
                                  Positioned(
                                    top: 5,
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: darkPinkColor,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Text(
                                        'Best Food Deals',
                                        style: textStyleF8W500(color: whiteColor),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    left: 10,
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: whiteColor,
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(color: Colors.white54, width: 1),
                                      ),
                                      child: Text(
                                        '30 min',
                                        style: textStyleF8W500(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Subway - Dhaka',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Fast Food, American, Meat, Halal',
                                style: textStyleF10W400(color: blackColor.withValues(alpha: 0.7)),
                              ),
                              Text(
                                '৳150 delivery free',
                                style: textStyleF8W500(),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class _SearchBarDelegate extends SliverPersistentHeaderDelegate {
//   @override
//   Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
//     // Adjusting for possible overlap and proper layout behavior
//     return Container(
//       color: whiteColor,
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       alignment: Alignment.center,
//       child: const CustomTextField(
//         hintText: "Search for shops & restaurants",
//       ),
//     );
//   }
//
//   @override
//   double get maxExtent => 60.0;
//
//   @override
//   double get minExtent => 60.0;
//
//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
//     return false;
//   }
// }
