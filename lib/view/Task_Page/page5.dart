import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gridview_6_pages/model/product.dart';
import 'package:gridview_6_pages/view/Home_Page/home_cart.dart';
import 'package:gridview_6_pages/view/Task_Page/rating.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class Page5 extends StatefulWidget {
  const Page5({super.key});

  @override
  Page5State createState() => Page5State();
}

class Page5State extends State<Page5> {
  final List<String> productImages = [
    'Asset/Image/nike1.png',
    'Asset/Image/nike2.png',
    'Asset/Image/nike3.png',
    'Asset/Image/nike4.png',
    'Asset/Image/nike5.png',
    'Asset/Image/nike6.png',
    'Asset/Image/nike7.png',
    'Asset/Image/nike8.png',
  ];

  final List<Product> products = [
    Product(
      name: 'Nike Air Zoom Pegasus',
      description:
          'A breathable shoe with excellent cushioning and durability.',
      price: 49.99,
      imageUrl: 'Asset/Image/nike1.png',
    ),
    Product(
      name: 'Nike React Infinity',
      description: 'Designed for long-distance running with a foam midsole.',
      price: 59.99,
      imageUrl: 'Asset/Image/nike2.png',
    ),
    Product(
      name: 'Nike ZoomX Vaporfly',
      description:
          'Built for speed with a lightweight design and responsive cushioning.',
      price: 79.99,
      imageUrl: 'Asset/Image/nike3.png',
    ),
    Product(
      name: 'Nike Air Force 1',
      description:
          'A timeless classic with a durable leather upper and cushioned sole.',
      price: 89.99,
      imageUrl: 'Asset/Image/nike4.png',
    ),
    Product(
      name: 'Nike Air Max 270',
      description: 'Offers all-day comfort with a large air unit in the heel.',
      price: 99.99,
      imageUrl: 'Asset/Image/nike5.png',
    ),
    Product(
      name: 'Nike Blazer Mid',
      description: 'A vintage basketball shoe with a sleek leather design.',
      price: 69.99,
      imageUrl: 'Asset/Image/nike6.png',
    ),
    Product(
      name: 'Nike SB Dunk Low',
      description:
          'A skateboarding shoe with a low-top design and padded tongue.',
      price: 59.99,
      imageUrl: 'Asset/Image/nike7.png',
    ),
    Product(
      name: 'Nike Air Huarache',
      description: 'A flexible shoe with a neoprene bootie for a snug fit.',
      price: 74.99,
      imageUrl: 'Asset/Image/nike8.png',
    ),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      carouselSection(),
                      const SizedBox(height: 20),
                      pageIndicator(),
                      const SizedBox(height: 20),
                      productDetails(),
                      const SizedBox(height: 20),
                      productDescription(),
                      const SizedBox(height: 30),
                      ratingSection(),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: productDetailsFooter(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget carouselSection() {
    return Stack(
      children: [
        Container(
          color: Colors.grey[200], // Set the background color to grey
          width: double.infinity,
          height: 400,
          child: CarouselSlider.builder(
            itemCount: productImages.length,
            itemBuilder: (context, index, realIndex) {
              return Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: Transform.rotate(
                  angle: -45 * 3.141592653589793 / 180,
                  child: Image.asset(
                    productImages[index],
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: 400,
              viewportFraction: 1.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (index, reason) {
                setState(() {
                  currentPage = index;
                });
              },
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 10,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: 10,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shop,
              color: Colors.black,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }

  // Page Indicator Section
  Widget pageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(productImages.length, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          width: currentPage == index ? 12.0 : 8.0,
          height: currentPage == index ? 12.0 : 8.0,
          decoration: BoxDecoration(
            color: currentPage == index ? Colors.blue : Colors.grey,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }

  // Product Details Section
  Widget productDetails() {
    final product = products[currentPage];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }

  // Product Description Section
  Widget productDescription() {
    final product = products[currentPage];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        product.description,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
    );
  }

  // Rating Section
  Widget ratingSection() {
    return rating();
  }

  Widget productDetailsFooter() {
    final product = products[
        currentPage]; // Fetch current product based on the carousel page index

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Total Amount positioned at the bottom left
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price:',
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '\$${product.price}', // Fetching dynamic price
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 24,
                ),
              ),
            ],
          ),
          // Add to Cart Button positioned at the bottom right
          CupertinoButton(
            borderRadius: BorderRadius.circular(25),
            color: Colors.blue.shade400,
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.shopping_cart, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  'Add to Cart',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            onPressed: () {
              // Handle add to cart action
              Get.to(const HomeCart());
            },
          ),
        ],
      ),
    );
  }
}
