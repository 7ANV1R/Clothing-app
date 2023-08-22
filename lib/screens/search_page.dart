import 'package:clothing_app/models/collection_model.dart';
import 'package:clothing_app/utils/colors.dart';
import 'package:clothing_app/utils/mock.dart';
import 'package:flutter/material.dart';

import 'collection_detail_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final controller = TextEditingController();
  List<CollectionModel> data = mockData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Product'),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              onChanged: searchProduct,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.secondaryColor,
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.secondaryColor,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.secondaryColor,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: controller.text.isEmpty
                  ? Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/gifs/searching.gif',
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text('Start Searching'),
                      ],
                    )
                  : data.isEmpty
                      ? Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/gifs/nodata.gif',
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              '\'${controller.text}\' not found',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )
                      : ListView.separated(
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CollectionDetailPage(collectionType: data[index]),
                                ));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: AppColors.tertiaryColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        data[index].imagePath,
                                        height: 1204 / 8,
                                        width: 1000 / 8,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data[index].name,
                                            style: const TextStyle(
                                              fontSize: 20,
                                              letterSpacing: 0.8,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'BDT ${data[index].price}',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 8,
                          ),
                          itemCount: data.length,
                        ),
            ),
          ],
        ),
      ),
    );
  }

  void searchProduct(String query) {
    final results = mockData.where((element) {
      final name = element.name.toLowerCase();
      final searchLower = query.toLowerCase();
      return name.contains(searchLower);
    });
    setState(() {
      data = results.toList();
    });
  }
}
