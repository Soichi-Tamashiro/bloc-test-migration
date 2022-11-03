import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Product extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String category;
  @HiveField(3)
  final String imageUrl;
  @HiveField(4)
  final double price;
  @HiveField(5)
  final bool isRecommended;
  @HiveField(6)
  final bool isPopular;
  @HiveField(7)
  final String? description;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
    this.description,
  });

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      id: snap.id,
      name: snap['name'],
      category: snap['category'],
      imageUrl: snap['imageUrl'],
      price: snap['price'],
      isRecommended: snap['isRecommended'],
      isPopular: snap['isPopular'],
      description: snap['description'],
    );
    return product;
  }

  @override
  List<Object?> get props => [
        id,
        name,
        category,
        imageUrl,
        price,
        isRecommended,
        isPopular,
        description,
      ];

  static List<Product> products = [
    const Product(
      id: '1',
      name: 'Macbook Air',
      category: 'APPLE',
      imageUrl:
          'https://images.unsplash.com/photo-1606248897732-2c5ffe759c04?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
      price: 1400,
      isRecommended: true,
      isPopular: true,
    ),
    const Product(
      id: '2',
      name: 'Iphone XR',
      category: 'APPLE',
      imageUrl:
          'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
      price: 1500,
      isRecommended: true,
      isPopular: true,
    ),
    const Product(
      id: '3',
      name: 'Iphone SE',
      category: 'APPLE',
      imageUrl:
          'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
      price: 900,
      isRecommended: true,
      isPopular: true,
    ),
    const Product(
        id: '4',
        name: 'Alienware',
        category: 'PC',
        imageUrl:
            'https://images.unsplash.com/photo-1593640408182-31c70c8268f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1442&q=80',
        price: 3000,
        isRecommended: false,
        isPopular: true),
    const Product(
        id: '5',
        name: 'Mavic Mini',
        category: 'DRONES',
        imageUrl:
            'https://images.unsplash.com/photo-1579829366248-204fe8413f31?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
        price: 300,
        isRecommended: false,
        isPopular: false),
  ];
}
