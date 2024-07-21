import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Map<String, String> product; // Product details including image, brand, name, description, and price.
  final Function(Map<String, String>) toggleFavorite; // Callback to toggle favorite status.
  final bool isFavorite; // Indicates if the product is currently a favorite.

  const ProductDetailsScreen({
    required this.product,
    required this.toggleFavorite,
    required this.isFavorite,
    super.key,
  });

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite; // Initialize favorite status based on the passed parameter.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product['name']!), // Display the product name in the app bar.
        actions: [
          IconButton(
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border), // Display favorite icon based on state.
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite; // Toggle favorite status.
              });
              widget.toggleFavorite(widget.product); // Update favorite status in the parent widget.
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the main content.
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0), // Rounded corners for the container.
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Shadow color and opacity.
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // Shadow offset.
                ),
              ],
            ),
            padding: const EdgeInsets.all(16.0), // Padding inside the container.
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 600) {
                  // Wide screen layout
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Product Image
                      Flexible(
                        flex: 1,
                        child: SizedBox(
                          width: 500,
                          height: 500,
                          child: Image.asset(
                            widget.product['image']!,
                            fit: BoxFit.cover, // Ensure the image covers the entire area.
                          ),
                        ),
                      ),
                      const SizedBox(width: 50),
                      // Product Details
                      Flexible(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 90),
                            Text(
                              widget.product['brand']!,
                              style: const TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 30),
                            Text(
                              widget.product['name']!,
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 30),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Text(
                                  widget.product['description']!,
                                  style: const TextStyle(fontSize: 22),
                                ),
                              ),
                            ),
                            const SizedBox(height: 80),
                            Text(
                              widget.product['price']!,
                              style: const TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 130),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  // Narrow screen layout
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Product Image
                        SizedBox(
                          width: 300,
                          height: 300,
                          child: Image.asset(
                            widget.product['image']!,
                            fit: BoxFit.cover, // Ensure the image covers the entire area.
                          ),
                        ),
                        const SizedBox(height: 50),
                        // Product Details
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.product['brand']!,
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              widget.product['name']!,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              widget.product['description']!,
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              widget.product['price']!,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
