import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        elevation: 0,
        title: const Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hello! Dominic",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("assets/profile.jpg"), // Replace with actual image
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top section
            Container(
              color: Colors.blue[700],
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Where would you like to go?",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCategoryIcon(Icons.flight, "Flights"),
                      _buildCategoryIcon(Icons.hotel, "Stays"),
                      _buildCategoryIcon(Icons.attractions, "Things to do"),
                      _buildCategoryIcon(Icons.directions_car, "Cars"),
                    ],
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Search Stays",
                      prefixIcon: Icon(Icons.search),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Horizontal List for Popular Locations
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildCircleImage("Dubai"),
                        _buildCircleImage("Maldives"),
                        _buildCircleImage("Bali"),
                        _buildCircleImage("Antarctica"),
                        _buildCircleImage("London"),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Recommended Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionHeader("Recommended", "View All"),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildRecommendationCard("Golden Gate", "Idaho", 40, 4.5),
                        _buildRecommendationCard("Maligne Lake", "Canada", 40, 4.5),
                        _buildRecommendationCard("Lake McDonald", "Canada", 40, 4.5),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Popular Destination
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionHeader("Popular Destination", "View All"),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      _buildDestinationCard("Enjoy Summer Vacation", "Mossley, UK", 200, 4.7),
                      _buildDestinationCard("Best place for honeymoon", "Switzerland", 250, 4.8),
                      _buildDestinationCard("Enjoy in a Farm House", "Switzerland", 250, 4.8),
                    ],
                  ),
                ],
              ),
            ),

            // Last Minute Deal
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Last Minute Deal",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  _buildLastMinuteDeal(),
                ],
              ),
            ),

            // Map Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Find Places in a Map",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: AssetImage("assets/map_placeholder.jpg"), // Replace with actual map image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Bookmarks"),
          BottomNavigationBarItem(icon: Icon(Icons.video_library), label: "Shorts"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget _buildCategoryIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          child: Icon(icon, color: Colors.blue[700], size: 30),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget _buildCircleImage(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage("assets/$label.jpg"), // Replace with actual images
          ),
          SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, String actionText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(actionText, style: TextStyle(color: Colors.blue)),
      ],
    );
  }

  Widget _buildRecommendationCard(String title, String location, int price, double rating) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset("assets/$title.jpg", height: 120, fit: BoxFit.cover),
          ),
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(location, style: TextStyle(color: Colors.grey)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$$price / Visit"),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow, size: 16),
                  Text("$rating"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDestinationCard(String title, String location, int price, double rating) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset("assets/$title.jpg", width: 80, height: 80, fit: BoxFit.cover),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(location, style: TextStyle(color: Colors.grey)),
                Text("From \$$price / person"),
              ],
            ),
          ),
          Column(
            children: [
              Icon(Icons.star, color: Colors.yellow),
              Text("$rating"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLastMinuteDeal() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[200],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset("assets/Maldives.jpg", width: 100, height: 80, fit: BoxFit.cover),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Maldives", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Classic Room"),
                Row(
                  children: [
                    Text("\$165", style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey)),
                    SizedBox(width: 8),
                    Text("\$118 / night", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
          ElevatedButton(onPressed: () {}, child: Text("View Details")),
        ],
      ),
    );
  }
}