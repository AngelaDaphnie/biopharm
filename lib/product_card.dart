import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final Map<String, String> product; // Product details including image, brand, name, and price.
  final VoidCallback onTap; // Callback to handle tap events.
  final Function(Map<String, String>) toggleFavorite; // Callback to toggle favorite status.
  final bool isFavorite; // Indicates if the product is currently a favorite.

  const ProductCard({
    required this.product,
    required this.onTap,
    required this.toggleFavorite,
    required this.isFavorite,
    super.key,
  });

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isHovered = false; // Tracks whether the mouse is hovering over the card.

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap, // Handles tap events on the card.
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Rounded corners for the card.
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Center(
                    child: MouseRegion(
                      onEnter: (_) => setState(() => _isHovered = true), // Change state when mouse enters.
                      onExit: (_) => setState(() => _isHovered = false), // Change state when mouse exits.
                      child: AnimatedScale(
                        scale: _isHovered ? 1.1 : 1.0, // Scale animation on hover.
                        duration: const Duration(milliseconds: 200), // Duration of the scale animation.
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)), // Rounded corners for the image.
                          child: Image.asset(
                            widget.product['image']!, // Product image.
                            fit: BoxFit.cover, // Ensure the image covers the entire area.
                            width: double.infinity, // Make the image width stretch to fill the card.
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0), // Padding around the text content.
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product['brand']!, // Display the product brand.
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey, // Style for the brand text.
                        ),
                      ),
                      Text(
                        widget.product['name']!, // Display the product name.
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold, // Style for the product name text.
                        ),
                      ),
                      const SizedBox(height: 4), // Space between the name and price.
                      Text(
                        widget.product['price']!, // Display the product price.
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold, // Style for the price text.
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              right: 8,
              top: 8,
              child: IconButton(
                icon: Icon(widget.isFavorite ? Icons.favorite : Icons.favorite_border, color: widget.isFavorite ? Colors.red : Colors.grey), // Display favorite icon based on state.
                onPressed: () => widget.toggleFavorite(widget.product), // Toggle favorite status when pressed.
              ),
            ),
          ],
        ),
      ),
    );
  }
}
