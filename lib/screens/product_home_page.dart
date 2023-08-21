import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/colors.dart';
import '../utils/consts.dart';
import '../utils/mock.dart';
import '../utils/utils_methods.dart';
import '../widgets/product_view.dart';
import 'collection_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _controller;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 5, vsync: this);
    _controller.addListener(() {
      if (_controller.indexIsChanging) {
        setState(() {
          currentIndex = -1;
        });
      } else {
        setState(() {
          currentIndex = _controller.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final item = ;
    // log('GGEZ ${item.length}');
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text.rich(TextSpan(
                        text: "EPONTEX\n",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(color: AppColors.accentColor, fontSize: 60),
                        children: [
                          TextSpan(
                              text: "COLLECTION",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: AppColors.tertiaryColor, fontSize: 60)),
                        ])),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FontAwesomeIcons.magnifyingGlass,
                      size: 56,
                      color: AppColors.tertiaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: TabBar(
                        isScrollable: true,
                        controller: _controller,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: AppColors.tertiaryColor,
                        tabs: const [
                          Tab(
                            iconMargin: EdgeInsets.zero,
                            child: Text(
                              "All",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16, fontFamily: Constants.secondaryFont),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Trending",
                              style: TextStyle(
                                  color: AppColors.accentColor,
                                  fontSize: 16,
                                  fontFamily: Constants.secondaryFont),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "New",
                              style: TextStyle(
                                  color: AppColors.tertiaryColor,
                                  fontSize: 16,
                                  fontFamily: Constants.secondaryFont),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Female",
                              style: TextStyle(
                                  color: AppColors.tertiaryColor,
                                  fontSize: 16,
                                  fontFamily: Constants.secondaryFont),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Male",
                              style: TextStyle(
                                  color: AppColors.tertiaryColor,
                                  fontSize: 16,
                                  fontFamily: Constants.secondaryFont),
                            ),
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: currentIndex == -1
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.accentColor,
                            ),
                          )
                        : TabBarView(
                            controller: _controller,
                            children: List.generate(
                              5,
                              (index) {
                                return Container(
                                  height: 300,
                                  width: 300,
                                  color: AppColors.primaryColor,
                                  child: GridView.builder(
                                    itemCount: indexToData(mockData, currentIndex).length,
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        childAspectRatio: 2,
                                        mainAxisExtent: 340),
                                    itemBuilder: ((context, index) {
                                      return index.isOdd
                                          ? Padding(
                                              padding: const EdgeInsets.only(top: 20.0),
                                              child: ProductView(
                                                onProductTap: () =>
                                                    Navigator.of(context).push(MaterialPageRoute(
                                                  builder: (context) => CollectionDetailPage(
                                                      collectionType:
                                                          indexToData(mockData, currentIndex)[index]),
                                                )),
                                                onPressed: () {
                                                  setState(() {
                                                    indexToData(mockData, currentIndex)[index].isBookmarked =
                                                        !indexToData(mockData, currentIndex)[index]
                                                            .isBookmarked;
                                                  });
                                                },
                                                imagePath:
                                                    indexToData(mockData, currentIndex)[index].imagePath,
                                                collectionName:
                                                    indexToData(mockData, currentIndex)[index].name,
                                                price: indexToData(mockData, currentIndex)[index].price,
                                                isBookmarked:
                                                    indexToData(mockData, currentIndex)[index].isBookmarked,
                                              ),
                                            )
                                          : ProductView(
                                              onProductTap: () =>
                                                  Navigator.of(context).push(MaterialPageRoute(
                                                builder: (context) => CollectionDetailPage(
                                                    collectionType:
                                                        indexToData(mockData, currentIndex)[index]),
                                              )),
                                              onPressed: () {
                                                setState(() {
                                                  indexToData(mockData, currentIndex)[index].isBookmarked =
                                                      !indexToData(mockData, currentIndex)[index]
                                                          .isBookmarked;
                                                });
                                              },
                                              imagePath: indexToData(mockData, currentIndex)[index].imagePath,
                                              collectionName: indexToData(mockData, currentIndex)[index].name,
                                              price: indexToData(mockData, currentIndex)[index].price,
                                              isBookmarked:
                                                  indexToData(mockData, currentIndex)[index].isBookmarked,
                                            );
                                    }),
                                  ),
                                );
                              },
                            )),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
