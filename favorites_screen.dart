import 'package:flutter/material.dart';

/// A screen that displays a list of favorite products.
///
/// This screen is implemented as a stateful widget and is designed to show
/// a list of favorite items with options to remove them from favorites.
class FavoritesScreen extends StatefulWidget {
  /// A list of favorite products to display.
  final List<Map<String, String>> favorites;

  /// A callback function to handle the toggle of favorite status.
  final Function(Map<String, String>) toggleFavorite;

  /// The height of the product image.
  final double imageHeight;

  /// The width of the product image.
  final double imageWidth;

  /// The height of the product container.
  final double containerHeight;

  /// The width of the product container.
  final double containerWidth;

  /// Optional style for the title text of the product.
  final TextStyle? titleStyle;

  /// Optional style for the subtitle text (e.g., price) of the product.
  final TextStyle? subtitleStyle;

  /// Creates a [FavoritesScreen] instance.
  ///
  /// The [favorites] and [toggleFavorite] parameters are required.
  /// [imageHeight] and [imageWidth] have default values.
  /// [containerHeight] and [containerWidth] have default values.
  /// [titleStyle] and [subtitleStyle] are optional.
  const FavoritesScreen({
    required this.favorites,
    required this.toggleFavorite,
    this.imageHeight = 80.0, // default value for image height
    this.imageWidth = 80.0, // default value for image width
    this.containerHeight = 130.0, // default value for container height
    this.containerWidth = double.infinity, // default value for container width
    this.titleStyle, // optional parameter for title text style
    this.subtitleStyle, // optional parameter for subtitle text style
    super.key,
  });

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late List<Map<String, String>> _favorites;
  int? _hoveredIndex;

  @override
  void initState() {
    super.initState();
    _favorites = List.from(widget.favorites);
  }

  void _removeFavorite(Map<String, String> product) {
    setState(() {
      _favorites.remove(product);
    });
    widget.toggleFavorite(product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 22),
        backgroundColor: const Color.fromRGBO(126, 175, 207, 1), // Title of the AppBar
      ),
      body: ListView.builder(
        itemCount: _favorites.length, // Number of items in the favorites list
        itemBuilder: (context, index) {
          final product = _favorites[index]; // Get the product data for the current index
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // Add margin around the container
            height: widget.containerHeight, // Set the height of the container
            width: widget.containerWidth, // Set the width of the container
            decoration: BoxDecoration(
              color: Colors.white, // Background color of the container
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Shadow color with opacity
                  spreadRadius: 1, // Spread radius of the shadow
                  blurRadius: 5, // Blur radius of the shadow
                  offset: const Offset(0, 3), // Offset of the shadow
                ),
              ],
              borderRadius: BorderRadius.circular(10), // Optional: add rounded corners
            ),
            child: Row(
              
              children: [
                const SizedBox(width: 20),
                SizedBox(
                  height: widget.imageHeight, // Set the height of the product image
                  width: widget.imageWidth, // Set the width of the product image
                  child: Image.asset(product['image']!, fit: BoxFit.cover), // Display the product image
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            product['name']!, // Display the product name
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20), // Apply the optional title style
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Flexible(
                          child: Text(
                            product['price']!, // Display the product price
                            style: widget.subtitleStyle, // Apply the optional subtitle style
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      _hoveredIndex = index;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      _hoveredIndex = null;
                    });
                  },
                  child: IconButton(
                    icon: Icon(Icons.delete, color: _hoveredIndex == index ? Colors.red : Colors.grey), // Icon button to remove the product from favorites
                    onPressed: () {
                      _removeFavorite(product); // Remove the product and update the UI
                  }, 
                  ),
                ),
                const SizedBox(width: 25),
              ],
            ),
          );
        },
      ),
    );
  }
}
