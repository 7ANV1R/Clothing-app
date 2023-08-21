import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/consts.dart';

class ProductView extends StatelessWidget {
  final String imagePath, collectionName, price;
  final bool? isBookmarked;
  final Function()? onPressed;
  final Function()? onProductTap;

  const ProductView(
      {super.key,
      required this.imagePath,
      required this.collectionName,
      required this.price,
      this.onPressed,
      this.isBookmarked = false,
      this.onProductTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onProductTap,
      child: Column(
        children: [
          Hero(
            tag: imagePath,
            child: Container(
              height: 250,
              width: 180,
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.tertiaryColor,
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 180,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${collectionName.split(" ").first}\n${collectionName.split(" ").last}",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.grey,
                          fontFamily: Constants.secondaryFont,
                          fontWeight: FontWeight.w500)),
                  Text(
                    "BDT $price",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.white,
                        fontFamily: Constants.secondaryFont,
                        // fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
