import 'package:estore2/Shopping Brain/ItemsBank.dart';

class ShoppingItems {
  final String name;
  final String price;
  final String assetImage;
  final ItemState itemState;

  ShoppingItems({
    required this.name,
    required this.price,
    required this.assetImage,
    required this.itemState,
  });
}

class RecommendedItems {
  final String name;
  final String price;
  final String assetImage;

  RecommendedItems({
    required this.name,
    required this.price,
    required this.assetImage,
  });
}

class BestSellerItems {
  final String name;
  final String price;
  final String assetImage;

  BestSellerItems({
    required this.name,
    required this.price,
    required this.assetImage,
  });
}

enum ItemState {
  Normal,
  Recommended,
  BestSeller,
}
void initializeItems() {
  recommendedItems.clear(); // Clear the recommendedItems list before populating it
  bestSellerItems.clear(); // Clear the bestSellerItems list before populating it

  for (var item in items) {
    if (item.itemState == ItemState.Recommended) {
      final recommendedItem = RecommendedItems(
        name: item.name,
        price: item.price,
        assetImage: item.assetImage,
      );
      recommendedItems.add(recommendedItem);
    } else if (item.itemState == ItemState.BestSeller) {
      final bestSellerItem = BestSellerItems(
        name: item.name,
        price: item.price,
        assetImage: item.assetImage,
      );
      bestSellerItems.add(bestSellerItem);
    }
  }
}