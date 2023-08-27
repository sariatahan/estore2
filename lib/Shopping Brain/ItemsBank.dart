import 'package:estore2/Shopping Brain/ItemsManagement.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final List<ShoppingItems> items = [];

Future<void> fetchItemsFromFirestore(List<ShoppingItems> items) async {
  try {
    final snapshot = await FirebaseFirestore.instance.collection('Product').get();

    for (var doc in snapshot.docs) {
      final data = doc.data();
      final item = ShoppingItems(
        name: data['name'] ?? '',
        price: data['price']?.toString() ?? '',
        image: data['image'] ?? '',
        itemState: ItemState.BestSeller, // Set the appropriate item state based on your requirements
        type: data['type'] ?? 'laptops',
        description: data['description'] ?? '',
      );
      items.add(item);
    }
  } catch (e) {
    print('Error fetching items from Firestore: $e');
  }
}

List<RecommendedItems> recommendedItems = [];
List<BestSellerItems> bestSellerItems = [];



