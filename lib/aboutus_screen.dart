import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  final List<String> imgList = [
    'assets/carousel1.jpg',
    'assets/carousel2.jpg',
    'assets/carousel3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromRGBO(126, 175, 207, 1),

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                height: 300.0,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.easeInOut,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: imgList.map((imgUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[200],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/placeholder.jpg',
                          image: imgUrl,
                          fit: BoxFit.cover,
                          imageErrorBuilder: (context, error, stackTrace) {
                            return const Center(
                              child: Text(
                                'Image not available',
                                style: TextStyle(color: Colors.red),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Text(
                    'Welcome to Biopharm Pharmacy, where we provide convenient access to affordable and reliable medications for all your healthcare needs.\n\nOur mission is to make healthcare accessible to people in Agoncillo, regardless of their location or circumstances. We understand that buying medicines can be a challenge for many people, whether it\'s due to mobility issues, lack of transportation, or simply the time constraints of a busy schedule. That\'s why we offer a user-friendly online ordering system that allows you to easily browse our over-the-counter medications, place your order, and have it delivered right to your doorstep. We are committed to providing exceptional customer service and ensuring that our customers receive the highest quality products at competitive prices.\n\nThank you for choosing Biopharm Pharmacy, and we look forward to serving you with excellence and professionalism!',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Contact Us',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(color: const Color.fromRGBO(126, 175, 207, 1)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Email: biopharm@gmail.com\nPhone: 09551747442\nAddress: Agoncillo Batangas',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
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