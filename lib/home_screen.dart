import 'package:biopharm/aboutus_screen.dart';
import 'package:flutter/material.dart';
import 'product_card.dart';
import 'product_details_screen.dart';
import 'favorites_screen.dart';

/// The main screen displaying a grid of products and search functionality.
///
/// This screen is implemented as a stateful widget to manage the state of products,
/// favorites, search, and cart functionality.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// A list of products available for display.
  final List<Map<String, String>> products = [
    {
      'brand': 'Unilab',
      'name': 'Biogesic',
      'description': 'Biogesic is a brand of paracetamol that provides fast and effective relief for fever and pain.',
      'price': '₱75.50',
      'image': 'assets/biogesic.jpg'
    },
    {
      'brand': 'Medicol',
      'name': 'Ibuprofen',
      'description': 'For different types of pain like headache, migraine, toothache, dysmenorrhea, body pain or nerve pain, get fast relief with Medicol®',
      'price': '₱12.00',
      'image': 'assets/medicol.jpg'
    },
    {
      'brand': 'Neozep',
      'name': 'Phenylephrine HCI Chrorphenamine',
      'description': 'Neozep is the no.1 colds medicine that has been trusted by Filipinos for more than 60 years.',
      'price': '₱6.00',
      'image': 'assets/neozep.jpg'
    },
    {
      'brand': 'Benadryl',
      'name': 'Cetirizine',
      'description': 'Watsons Cetirizine is used for the treatment of allergic rhinitis, conjunctivitis, pruritis (itch), and chronic idiopathic urticaria',
      'price': '₱15.00',
      'image': 'assets/cetirizine.jpg'
    },
    {
      'brand': 'Alaxan',
      'name': 'Ibuprofen + Paracetamol',
      'description': 'In as fast as 15 minutes, Alaxan stops body pain and inflammation at its source, with the synergy of Ibuprofen and Paracetamol.',
      'price': '₱9.00',
      'image': 'assets/alaxan.jpg'
    },
    {
      'brand': 'Bioflu',
      'name': 'Phenylephrine HCl Chlorphenamine Maleate Paracetamol',
      'description': 'Bioflu® provides relief from flu and its multiple symptoms such as fever, body pain, headache, colds, cough from post-nasal drip and sore throat.',
      'price': '₱9.00',
      'image': 'assets/bioflu.jpg'
    },
    {
      'brand': 'Calpol',
      'name': 'Paracetamol',
      'description': 'Relief of fever and mild to moderate pain such as toothache, headache, sore throat and other aches and pain associated with colds and flu.',
      'price': '₱156.00',
      'image': 'assets/calpol.jpg'
    },
    {
      'brand': 'Ceelin',
      'name': 'Ascorbic Acid',
      'description': 'Ceelin® is the most trusted and most prescribed Vitamin C supplement for kids which helps boost the immune system for their protection from sickness. For strong immunity at any age, there is Ceelin® Drops for babies, Ceelin® Syrup for younger kids, and Ceelin® Chewtab for kids 7 and up.',
      'price': '₱135.00',
      'image': 'assets/ceelin.jpg'
    },
    {
      'brand': 'Plemex Forte',
      'name': 'Vitex negundo L',
      'description': 'Relief of cough due to common cold, flu & mild to moderate bronchitis; cough of bacterial origin; relief of reversible, mild to moderate bronchospasm in adult & childn w/ obstructive airway disease eg asthma, chronic bronchitis & other broncho-pulmonary disorders.',
      'price': '₱175.00',
      'image': 'assets/plemex.jpg'
    },
    {
      'brand': 'Sinutab Cold',
      'name': 'Paracetamol + Phenylephrine HCI',
      'description': 'This combination medication is used to temporarily treat symptoms caused by the common cold, flu, allergies, or other breathing illnesses (such as sinusitis, bronchitis). Decongestants help relieve stuffy nose,sinus, and ear congestion symptoms.',
      'price': '₱13.00',
      'image': 'assets/sinutab.jpg'
    },
    {
      'brand': 'Solmux',
      'name': 'Carbocisteine',
      'description': 'Solmux is the trusted cough with phlegm solution that is scientifically proven to melt phlegm, making it less thick and stick, expel phlegm with bacteria, and stop excess production of phlegm',
      'price': '₱11.00',
      'image': 'assets/solmux.jpg'
    },
    {
      'brand': 'Tuseran Forte',
      'name': 'Dextromethorphan HBr Phenylpropanolamine HCl Paracetamol',
      'description': 'Tuseran® Forte contains a Multi-Stopping Formula that relieves cough, colds, headache and other accompanying ailments.',
      'price': '₱12.00',
      'image': 'assets/tuseran.jpg'
    },
  ];

  /// A list of products marked as favorites.
  List<Map<String, String>> favorites = [];

  /// A list of products filtered based on search query.
  List<Map<String, String>> filteredProducts = [];

  /// Controller for the search text field.
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize filtered products to show all products by default.
    filteredProducts.addAll(products);
  }

  /// Toggles the favorite status of a product.
  ///
  /// If the product is already in favorites, it will be removed; otherwise, it will be added.
  void toggleFavorite(Map<String, String> product) {
    setState(() {
      if (favorites.contains(product)) {
        favorites.remove(product);
      } else {
        favorites.add(product);
      }
    });
  }

  /// Checks if a product is marked as favorite.
  ///
  /// Returns true if the product is in the favorites list, otherwise false.
  bool isFavorite(Map<String, String> product) {
    return favorites.contains(product);
  }

  /// Filters the list of products based on the search query.
  ///
  /// Updates the [filteredProducts] list to only include products that match the search query.
  void filterProducts() {
    String query = searchController.text;
    List<Map<String, String>> tempFilteredProducts = List.from(products);
    if (query.isNotEmpty) {
      tempFilteredProducts.retainWhere((product) {
        String searchTerm = query.toLowerCase();
        String productName = product['name']!.toLowerCase();
        String productBrand = product['brand']!.toLowerCase();
        String productDescription = product['description']!.toLowerCase();
        return productName.contains(searchTerm) ||
            productBrand.contains(searchTerm) ||
            productDescription.contains(searchTerm);
      });
    }
    setState(() {
      filteredProducts.clear();
      filteredProducts.addAll(tempFilteredProducts);
    });
  }

  /// Shows a dialog to confirm logout.
  ///
  /// Provides options to either confirm or cancel logout.
  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Do you want to logout?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog without logging out
              },
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BioPharm', style: TextStyle(color: Colors.white)), // Title of the AppBar
        backgroundColor: const Color.fromRGBO(126, 175, 207, 1),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutUsPage()));
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text(
              'About Us',
              style: TextStyle(fontSize: 15, color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white),
            ),
          ),
            // Button to navigate to the Favorites screen
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.red),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesScreen(
                    favorites: favorites,
                    toggleFavorite: toggleFavorite,
                  ),
                ),
              );
            },
          ),
          // Button to show the logout confirmation dialog
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _showLogoutDialog,
          ),
        ],
      ),
      body: Column(
        children: [
          // Search field to filter products
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      labelText: 'Search for products',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: filterProducts,
                ),
              ],
            ),
          ),
          // Grid view to display filtered products
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount;
                  double childAspectRatio;

                  // Determine grid layout based on screen width
                  if (constraints.maxWidth > 1600) {
                    crossAxisCount = 4; // 4x4 layout for large screens
                    childAspectRatio = 1.0;
                  } else if (constraints.maxWidth > 1200) {
                    crossAxisCount = 3; // 3x3 layout for medium screens
                    childAspectRatio = 1.0;
                  } else if (constraints.maxWidth > 800) {
                    crossAxisCount = 2; // 2x2 layout for smaller screens
                    childAspectRatio = 1.0;
                  } else {
                    crossAxisCount = 1; // 1x1 layout for very small screens
                    childAspectRatio = 1.0;
                  }

                  return GridView.builder(
                    itemCount: filteredProducts.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      childAspectRatio: childAspectRatio,
                      mainAxisSpacing: 16.0,
                      crossAxisSpacing: 16.0,
                    ),
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];
                      return ProductCard(
                        product: product,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsScreen(
                                product: product,
                                toggleFavorite: toggleFavorite,
                                isFavorite: isFavorite(product),
                              ),
                            ),
                          );
                        },
                        toggleFavorite: toggleFavorite,
                        isFavorite: isFavorite(product),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
