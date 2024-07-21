import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Map<String, String>> favorites;
  final Function(Map<String, String>) toggleFavorite;
  final double imageHeight;
  final double imageWidth;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

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
        title: const Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final product = favorites[index];
          return ListTile(
            leading: SizedBox(
              height: imageHeight,
              width: imageWidth,
              child: Image.asset(product['image']!, fit: BoxFit.cover),
            ),
            title: Text(
              product['name']!,
              style: titleStyle,
            ),
            subtitle: Text(
              product['price']!,
              style: subtitleStyle,
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                toggleFavorite(product);
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoritesScreen(
                      favorites: favorites,
                      toggleFavorite: toggleFavorite,
                      imageHeight: imageHeight, // pass the image height
                      imageWidth: imageWidth, // pass the image width
                      titleStyle: titleStyle, // pass the title style
                      subtitleStyle: subtitleStyle, // pass the subtitle style
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
