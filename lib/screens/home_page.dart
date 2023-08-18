// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import '../utils/colors.dart';
// import '../utils/consts.dart';
// import '../utils/mock.dart';
// import '../widgets/product_view.dart';
// import 'collection_detail_page.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primaryColor,
//       body: SafeArea(
//         bottom: false,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Stack(
//             children: [
//               Positioned(
//                 right: 50,
//                 top: 32,
//                 child: IconButton(
//                   padding: EdgeInsets.zero,
//                   constraints: BoxConstraints.tight(const Size(16, 60)),
//                   icon: const Icon(
//                     FontAwesomeIcons.magnifyingGlass,
//                     size: 52,
//                     color: AppColors.tertiaryColor,
//                   ),
//                   onPressed: () {},
//                 ),
//               ),
//               Positioned(
//                 left: 16,
//                 top: 16,
//                 child: Text.rich(TextSpan(
//                     text: "EPONTEX\n",
//                     style: Theme.of(context)
//                         .textTheme
//                         .displayLarge!
//                         .copyWith(color: AppColors.accentColor, fontSize: 60),
//                     children: [
//                       TextSpan(
//                           text: "COLLECTION",
//                           style: Theme.of(context)
//                               .textTheme
//                               .headlineSmall!
//                               .copyWith(color: AppColors.tertiaryColor, fontSize: 60)),
//                     ])),
//               ),
//               Positioned(
//                 top: MediaQuery.of(context).size.height * 0.18,
//                 child: DefaultTabController(
//                   length: 5,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       SizedBox(
//                         height: 60,
//                         width: MediaQuery.of(context).size.width,
//                         child: const TabBar(
//                             isScrollable: true,
//                             indicatorSize: TabBarIndicatorSize.label,
//                             indicatorColor: AppColors.tertiaryColor,
//                             tabs: [
//                               Tab(
//                                 iconMargin: EdgeInsets.zero,
//                                 child: Text(
//                                   "All",
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 16, fontFamily: Constants.secondaryFont),
//                                 ),
//                               ),
//                               Tab(
//                                 child: Text(
//                                   "Trending",
//                                   style: TextStyle(
//                                       color: AppColors.accentColor,
//                                       fontSize: 16,
//                                       fontFamily: Constants.secondaryFont),
//                                 ),
//                               ),
//                               Tab(
//                                 child: Text(
//                                   "New",
//                                   style: TextStyle(
//                                       color: AppColors.tertiaryColor,
//                                       fontSize: 16,
//                                       fontFamily: Constants.secondaryFont),
//                                 ),
//                               ),
//                               Tab(
//                                 child: Text(
//                                   "Female",
//                                   style: TextStyle(
//                                       color: AppColors.tertiaryColor,
//                                       fontSize: 16,
//                                       fontFamily: Constants.secondaryFont),
//                                 ),
//                               ),
//                               Tab(
//                                 child: Text(
//                                   "Male",
//                                   style: TextStyle(
//                                       color: AppColors.tertiaryColor,
//                                       fontSize: 16,
//                                       fontFamily: Constants.secondaryFont),
//                                 ),
//                               ),
//                             ]),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.6,
//                         width: MediaQuery.of(context).size.width - 32,
//                         child: TabBarView(
//                             children: List.generate(
//                           5,
//                           (index) => Container(
//                             height: 300,
//                             width: 300,
//                             color: AppColors.primaryColor,
//                             child: GridView.builder(
//                               itemCount: mockData.length,
//                               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                                   crossAxisCount: 2,
//                                   crossAxisSpacing: 10,
//                                   mainAxisSpacing: 10,
//                                   childAspectRatio: 2,
//                                   mainAxisExtent: 340),
//                               itemBuilder: ((context, index) {
//                                 return index.isOdd
//                                     ? Padding(
//                                         padding: const EdgeInsets.only(top: 20.0),
//                                         child: ProductView(
//                                           onProductTap: () => Navigator.of(context).push(MaterialPageRoute(
//                                             builder: (context) =>
//                                                 CollectionDetailPage(collectionType: mockData[index]),
//                                           )),
//                                           onPressed: () {
//                                             setState(() {
//                                               mockData[index].isBookmarked = !mockData[index].isBookmarked;
//                                             });
//                                           },
//                                           imagePath: mockData[index].imagePath,
//                                           collectionName: mockData[index].name,
//                                           price: mockData[index].price,
//                                           isBookmarked: mockData[index].isBookmarked,
//                                         ),
//                                       )
//                                     : ProductView(
//                                         onProductTap: () => Navigator.of(context).push(MaterialPageRoute(
//                                           builder: (context) =>
//                                               CollectionDetailPage(collectionType: mockData[index]),
//                                         )),
//                                         onPressed: () {
//                                           setState(() {
//                                             mockData[index].isBookmarked = !mockData[index].isBookmarked;
//                                           });
//                                         },
//                                         imagePath: mockData[index].imagePath,
//                                         collectionName: mockData[index].name,
//                                         price: mockData[index].price,
//                                         isBookmarked: mockData[index].isBookmarked,
//                                       );
//                               }),
//                             ),
//                           ),
//                         )),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
