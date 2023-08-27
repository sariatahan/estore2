  import 'package:estore2/Shopping Brain/ItemsBank.dart';
  import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:flutter/material.dart';

  class ShoppingItems {
    final String name;
    final String price;
    final String image;
    final ItemState itemState;
    final String? type;
    final String? description;

    ShoppingItems({
      required this.name,
      required this.price,
      required this.image,
      required this.itemState,
      this.type = 'laptops',
      this.description = '',
    });
  }
  class RecommendedItems {
    final String name;
    final String price;
    final String image;
    final String? type;
    final String? description;

    RecommendedItems({
      required this.name,
      required this.price,
      required this.image,
      this.type = 'laptops',
      this.description = '',
    });
  }

  class BestSellerItems {
    final String name;
    final String price;
    final String image;
    final String? type;
    final String? description;

    BestSellerItems({
      required this.name,
      required this.price,
      required this.image,
      this.type = 'laptops',
      this.description = '',
    });
  }

  enum ItemState {
    Normal,
    Recommended,
    BestSeller,
  }

  void initializeItems(List<ShoppingItems> items, List<RecommendedItems> recommendedItems, List<BestSellerItems> bestSellerItems) {
    recommendedItems.clear(); // Clear the recommendedItems list before populating it
    bestSellerItems.clear(); // Clear the bestSellerItems list before populating it

    for (var item in items) {
      if (item.itemState == ItemState.Recommended) {
        final recommendedItem = RecommendedItems(
          name: item.name,
          price: item.price,
          image: item.image,
          type: item.type,
          description: item.description,
        );
        recommendedItems.add(recommendedItem);
      } else if (item.itemState == ItemState.BestSeller) {
        final bestSellerItem = BestSellerItems(
          name: item.name,
          price: item.price,
          image: item.image,
          type: item.type,
          description: item.description,
        );
        bestSellerItems.add(bestSellerItem);
      }
    }
  }