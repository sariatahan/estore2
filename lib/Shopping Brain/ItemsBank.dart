import 'package:estore2/Shopping Brain/ItemsManagement.dart';

final List<ShoppingItems> items = [
  ShoppingItems(
    name: 'Asus rog strix g15',
    price: '1000£',
    assetImage: 'images/Laptops/21621_2xtp.jpg',
    itemState: ItemState.BestSeller,
  ),
  ShoppingItems(
    name: 'iPhone 14 Pro Max',
    price: '1500£',
    assetImage:
        'images/Phones/iphone-14-pro-finish-select-202209-6-7inch-spaceblack.jpeg',
    itemState: ItemState.Recommended,
  ),
  ShoppingItems(
    name: 'SAMSUNG Galaxy S23',
    price: '1200£',
    assetImage: 'images/Phones/ASSET_MMS_101835605.webp',
    itemState: ItemState.BestSeller,
  ),
];
List<RecommendedItems> recommendedItems = [];
List<BestSellerItems> bestSellerItems = [];
