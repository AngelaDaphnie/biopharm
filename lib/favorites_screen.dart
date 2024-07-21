import 'package:flutter/material.dart';

/// A screen that displays a list of favorite products.
///
/// This screen is implemented as a stateless widget and is designed to show
/// a list of favorite items with options to remove them from favorites.
class FavoritesScreen extends StatelessWidget {
  /// A list of favorite products to display.
  final List<Map<String, String>> favorites;

  /// A callback function to handle the toggle of favorite status.
  final Function(Map<String, String>) toggleFavorite;

  /// The height of the product image.
  final double imageHeight;

  /// The width of the product image.
  final double imageWidth;

  /// Optional style for the title text of the product.
  final TextStyle? titleStyle;

  /// Optional style for the subtitle text (e.g., price) of the product.
  final TextStyle? subtitleStyle;

  /// Creates a [FavoritesScreen] instance.
  ///
  /// The [favorites] and [toggleFavorite] parameters are required.
  /// [imageHeight] and [imageWidth] have default values.
  /// [titleStyle] and [subtitleStyle] are optional.
  const FavoritesScreen({
    required this.favorites,
    required this.toggleFavorite,
    this.imageHeight = 70.0, // default value for image height
    this.imageWidth = 70.0, // default value for image width
    this.titleStyle, // optional parameter for title text style
    this.subtitleStyle, // optional parameter for subtitle text style
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'), // Title of the AppBar
      ),
      body: ListView.builder(
        itemCount: favorites.length, // Number of items in the favorites list
        itemBuilder: (context, index) {
          final product = favorites[index]; // Get the product data for the current index
          return ListTile(
            leading: SizedBox(
              height: imageHeight, // Set the height of the product image
              width: imageWidth, // Set the width of the product image
              child: Image.asset(product['image']!, fit: BoxFit.cover), // Display the product image
            ),
            title: Text(
              product['name']!, // Display the product name
              style: titleStyle, // Apply the optional title style
            ),
            subtitle: Text(
              product['price']!, // Display the product price
              style: subtitleStyle, // Apply the optional subtitle style
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete), // Icon button to remove the product from favorites
              onPressed: () {
                toggleFavorite(product); // Call the callback to toggle the favorite status
                Navigator.pop(context); // Close the current screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoritesScreen(
                      favorites: favorites, // Pass the list of favorites
                      toggleFavorite: toggleFavorite, // Pass the callback function
                      imageHeight: imageHeight, // Pass the image height
                      imageWidth: imageWidth, // Pass the image width
                      titleStyle: titleStyle, // Pass the title style
                      subtitleStyle: subtitleStyle, // Pass the subtitle style
                    ),
                  ),
                ); // Navigate to the updated FavoritesScreen
              },
            ),
          );
        },
      ),
    );
  }
}
