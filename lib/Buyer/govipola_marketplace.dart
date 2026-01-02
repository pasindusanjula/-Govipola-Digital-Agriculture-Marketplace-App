// govipola_marketplace.dart
import 'package:flutter/material.dart';
import 'opencard.dart';

class GoviPolaMarketplace extends StatelessWidget {
  const GoviPolaMarketplace({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth > 900
        ? 4
        : screenWidth > 600
        ? 3
        : 2;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: const [
            Icon(Icons.eco, color: Color(0xFF2E7D32)),
            SizedBox(width: 8),
            Text(
              'GoviPola',
              style: TextStyle(
                color: Color(0xFF2E7D32),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: _products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            return _ProductCard(product: _products[index]);
          },
        ),
      ),
    );
  }
}

// Product Card Widget
class _ProductCard extends StatelessWidget {
  final Product product;

  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: product),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image.asset(
                product.assetPath,
                height: 140,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Rs. ${product.price}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2E7D32),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          product.location,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Product Model
class Product {
  final String name;
  final String price;
  final String location;
  final String assetPath;

  Product({
    required this.name,
    required this.price,
    required this.location,
    required this.assetPath,
  });
}

// Dummy Data
final List<Product> _products = [
  Product(
    name: 'Fresh Organic Tomatoes',
    price: '350 / kg',
    location: 'Kurunegala',
    assetPath: 'assets/images/tomato.jpg',
  ),
  Product(
    name: 'Green Coconuts (Bulk)',
    price: '120 each',
    location: 'Gampaha',
    assetPath: 'assets/images/coconut.jpg',
  ),
  Product(
    name: 'Red Rice (Traditional)',
    price: '220 / kg',
    location: 'Anuradhapura',
    assetPath: 'assets/images/rice.jpg',
  ),
  Product(
    name: 'Fresh Carrots',
    price: '300 / kg',
    location: 'Nuwara Eliya',
    assetPath: 'assets/images/carrot.jpg',
  ),
  Product(
    name: 'Banana – Ambul',
    price: '180 / dozen',
    location: 'Embilipitiya',
    assetPath: 'assets/images/banana.jpg',
  ),
  Product(
    name: 'Fresh Cow Milk',
    price: '250 / liter',
    location: 'Badulla',
    assetPath: 'assets/images/milk.jpg',
  ),
];