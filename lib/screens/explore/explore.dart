import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:toursandtravel/core/utils/util.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Explore",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[700],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Search destinations, activities, etc.",
                  prefixIcon: Icon(Icons.search),
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Categories Section
              Text(
                "Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategoryIcon(Icons.beach_access, "Beaches"),
                  _buildCategoryIcon(Icons.terrain, "Mountains"),
                  _buildCategoryIcon(Icons.location_city, "Cities"),
                  _buildCategoryIcon(Icons.local_parking, "Parks"),
                ],
              ),
              SizedBox(height: 20),

              // Featured Section
              Text(
                "Featured Destinations",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildDestinationCard(
                      "Santorini",
                      "Greece",
                      "assets/santorini.jpg",
                    ),
                    _buildDestinationCard(
                      "Paris",
                      "France",
                      "assets/paris.jpg",
                    ),
                    _buildDestinationCard(
                      "Bali",
                      "Indonesia",
                      "assets/bali.jpg",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Trending Section
              Text(
                "Trending Destinations",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  _buildTrendingCard(
                    "Dubai",
                    "United Arab Emirates",
                    "assets/dubai.jpg",
                    "\$400 - \$1000",
                  ),
                  _buildTrendingCard(
                    "Rome",
                    "Italy",
                    "assets/rome.jpg",
                    "\$300 - \$800",
                  ),
                  _buildTrendingCard(
                    "Kyoto",
                    "Japan",
                    "assets/kyoto.jpg",
                    "\$500 - \$1200",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Category Icon Widget
  Widget _buildCategoryIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.blue[100],
          child: Icon(
            icon,
            color: Colors.blue[700],
            size: 28,
          ),
        ),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }

  // Destination Card Widget
  Widget _buildDestinationCard(
      String title, String location, String imagePath) {
    return Container(
      width: 180,
      margin: EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                  imageUrl:
                      'https://hips.hearstapps.com/hmg-prod/images/vienna-best-cities-to-visit-europe-alexander-spatari-66a221dd448d1.jpg')),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            location,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // Trending Card Widget
  Widget _buildTrendingCard(
      String title, String location, String imagePath, String priceRange) {
    return Container(
      height: 150,
      margin: EdgeInsets.symmetric(
          horizontal: kHorizontalMargin, vertical: kVerticalMargin),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                  imageUrl:
                      'https://i.pinimg.com/736x/d1/77/e0/d177e0ec95b35bec311c534628db1d8f.jpg',
                  fit: BoxFit.cover)),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  location,
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 4),
                Text(
                  priceRange,
                  style: TextStyle(
                    color: Colors.blue[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
