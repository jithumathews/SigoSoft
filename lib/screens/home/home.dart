// ignore_for_file: unused_element

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sigosoft_test/screens/home/controller/home_controller.dart';
import 'package:sigosoft_test/screens/home/model/home_model.dart';
import 'package:sigosoft_test/utils/custom_text_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FishMarketApp extends StatelessWidget {
  const FishMarketApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());
  final activeIndex = 0.obs;

  Widget _buildHeader() {
    return Container(
      color: Colors.red,
      height: 160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                ),
                SizedBox(width: 5),
                CustomTextWidget(
                    text: 'Whitefield, bengaluru',
                    color: Colors.white,
                    fontSize: 16),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 200,
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Type fish name to search",
                              hintStyle: GoogleFonts.poppins(fontSize: 14)),
                        ),
                      ),
                      const Icon(
                        Icons.search,
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.notifications_active_outlined,
                  color: Colors.red,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),

            _buildHeader(),

            const SizedBox(height: 20),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() {
                        return Column(
                          children: [
                            CarouselSlider.builder(
                              itemCount: controller.homeModel.value.data
                                      ?.mainSlider?.length ??
                                  0,
                              options: CarouselOptions(
                                height: 150,
                                viewportFraction: 1,
                                enlargeCenterPage: true,
                                autoPlay: true,
                                onPageChanged: (index, reason) {
                                  activeIndex.value = index;
                                },
                              ),
                              itemBuilder: (context, index, realIndex) {
                                final banner = controller
                                    .homeModel.value.data?.mainSlider?[index];

                                return Container(
                                  width: double.infinity,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      "https://ourworks.co.in/sigofish-backend/public/storage/${banner?.image}" ??
                                          '',
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Container(
                                          color: Colors.grey[300],
                                          child: const Center(
                                            child: Icon(Icons.error_outline),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 10),
                            Obx(() => AnimatedSmoothIndicator(
                                  activeIndex: activeIndex.value,
                                  count: controller.homeModel.value.data
                                          ?.mainSlider?.length ??
                                      0,
                                  effect: const WormEffect(
                                    dotWidth: 10,
                                    dotHeight: 10,
                                    activeDotColor: Colors.red,
                                    dotColor: Colors.grey,
                                  ),
                                )),
                            const SizedBox(height: 20),
                          ],
                        );
                      }),

                      // Grand Offer Section
                      const CustomTextWidget(
                        text: 'Grand Offer',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(height: 10),

                      SizedBox(
                          height: 260, // Set a fixed height for the container
                          child: Obx(() {
                            return GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 0.8,
                              ),
                              itemCount: controller
                                  .homeModel
                                  .value
                                  .data
                                  ?.trendingProducts
                                  ?.length, // Use the products from controller
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return _buildProductCard(
                                  controller
                                          .homeModel
                                          .value
                                          .data
                                          ?.trendingProducts?[index]
                                          .productName ??
                                      "",
                                  controller
                                          .homeModel
                                          .value
                                          .data
                                          ?.trendingProducts?[index]
                                          .productPrice
                                          .toString() ??
                                      "",
                                  controller
                                          .homeModel
                                          .value
                                          .data
                                          ?.trendingProducts?[index]
                                          .productImage ??
                                      "",
                                  // originalPrice: controller.products[index].originalPrice?.toString(),
                                  // weight: controller.products[index].weight,
                                );
                              },
                            );
                          })),

                      const SizedBox(height: 20),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomTextWidget(
                              text: 'Categories',
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            const SizedBox(height: 5),
                            Obx(() {
                              return GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  childAspectRatio: 0.7,
                                  crossAxisSpacing: 7,
                                  mainAxisSpacing: 4,
                                ),
                                itemCount: controller.homeModel.value.data
                                        ?.categories?.length ??
                                    0,
                                itemBuilder: (context, index) {
                                  final category = controller
                                      .homeModel.value.data?.categories?[index];
                                  return _buildCategoryCard(
                                    category?.name ?? "",
                                    category?.image ?? "",
                                  );
                                },
                              );
                            }),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Grand Offer Section

                      Obx(() => ProductListingSection(
                            title: controller
                                    .homeModel.value.data?.listings?[0].title ??
                                "",
                            products:
                                controller.homeModel.value.data?.listings?[0],
                            buildCard: _buildDealsCard,
                          )),

                      const SizedBox(height: 20),

                      // Popular Items Section
                      Obx(() => ProductListingSection(
                            title: controller
                                    .homeModel.value.data?.listings?[1].title ??
                                "",
                            products:
                                controller.homeModel.value.data?.listings?[1],
                            buildCard: _buildDealsCard,
                          )),

                      const SizedBox(height: 20),

                      // New Arrivals Section
                      Obx(() => ProductListingSection(
                            title: controller
                                    .homeModel.value.data?.listings?[2].title ??
                                "",
                            products:
                                controller.homeModel.value.data?.listings?[2],
                            buildCard: _buildDealsCard,
                          )),

                      const SizedBox(
                        height: 30,
                      ),
                      Obx(() {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller
                                  .homeModel.value.data?.mainSlider?.length ??
                              0,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                // height: 150,
                                child: _buildBottomSlideCard(
                                  controller.homeModel.value.data
                                          ?.mainSlider?[index].image ??
                                      "",
                                  controller.homeModel.value.data
                                          ?.mainSlider?[index].image ??
                                      "",
                                ),
                              ),
                            );
                          },
                        );
                      })
                    ],
                  ),
                ),
              ),
            ),
            // Categories Section
          ],
        ),
        bottomNavigationBar: Obx(() {
          return BottomNavigationBar(
            // selectedItemColor: Colors.red,
            type: BottomNavigationBarType.fixed,
            onTap: controller.setIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  color:
                      controller.index.value == 0 ? Colors.red : Colors.black,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.category,
                    color:
                        controller.index.value == 1 ? Colors.red : Colors.black,
                  ),
                  label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_border,
                    color:
                        controller.index.value == 2 ? Colors.red : Colors.black,
                  ),
                  label: 'Wishlist'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color:
                        controller.index.value == 3 ? Colors.red : Colors.black,
                  ),
                  label: 'Cart'),
              BottomNavigationBarItem(
                  backgroundColor:
                      controller.index.value == 4 ? Colors.red : Colors.black,
                  icon: Icon(
                    Icons.person_outline,
                    color:
                        controller.index.value == 4 ? Colors.red : Colors.black,
                  ),
                  label: 'Account'),
            ],
          );
        }));
  }

  Widget _buildProductCard(String name, String price, String imageUrl,
      {String? originalPrice, String? weight}) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            child: Image.network(
              "https://ourworks.co.in/sigofish-backend/public/storage/$imageUrl",
              width: double.infinity,
              height: 150, // You can adjust this value as needed
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  text: name,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    CustomTextWidget(
                      text: '₹$price',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    if (originalPrice != null) ...[
                      const SizedBox(width: 8),
                      CustomTextWidget(
                        text: '₹$originalPrice',
                        color: Colors.grey,
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDealsCard(
      String name, String price, String imageUrl, String orgprice, String stock,
      {String? originalPrice, String? weight}) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            child: Image.network(
              "https://ourworks.co.in/sigofish-backend/public/storage/$imageUrl",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                CustomTextWidget(
                  text: name,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBox(height: 4),
                CustomTextWidget(
                  text: "Net : $stock g",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBox(height: 4),
                CustomTextWidget(
                  fontSize: 14,
                  text: '₹$originalPrice',
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                ),
                CustomTextWidget(
                  text: '₹$price',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String title, String imageUrl) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.network(
            "https://ourworks.co.in/sigofish-backend/public/storage/$imageUrl",
            fit: BoxFit.fill,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[100],
                child: const Icon(
                  Icons.category_outlined,
                  color: Colors.grey,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8), // Add some spacing between image and text
        Flexible(
          fit: FlexFit.loose,
          child: CustomTextWidget(
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            text: title,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

Widget _buildBottomSlideCard(String title, String imageUrl) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Image.network(
          "https://ourworks.co.in/sigofish-backend/public/storage/$imageUrl",
          fit: BoxFit.fill,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[100],
              child: const Icon(
                Icons.category_outlined,
                color: Colors.grey,
              ),
            );
          },
        ),
      ),
    ],
  );
}

class ProductListingSection extends StatelessWidget {
  final String title;
  final Listings? products;
  final Function(String, String, String, String, String) buildCard;

  const ProductListingSection({
    Key? key,
    required this.title,
    required this.products,
    required this.buildCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: title,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 260,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products?.products?.length ?? 0,
            itemBuilder: (context, index) {
              final product = products;
              return Container(
                width: MediaQuery.of(context).size.width *
                    0.45, // Adjust width as needed
                margin: const EdgeInsets.only(right: 10),
                child: buildCard(
                  product?.products?[index].productName ?? "",
                  product?.products?[index].offerPrice.toString() ?? "",
                  product?.products?[index].cuttingImage ?? "",
                  product?.products?[index].originalPrice.toString() ?? "",
                  product?.products?[index].stock.toString() ?? "",
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
