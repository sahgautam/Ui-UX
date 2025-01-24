import 'package:flutter/material.dart';
import 'package:tourist_application/screens/explore/explore.dart';

import '../booking/booking.dart';
import '../profile/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeContent(),
    ExplorePage(),
    BookingsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: _pages[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Bookings'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  int selectedIndex = 0;
  final List<String> segments = ['Today', 'This Week', 'This Month'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Discover the World',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black)),
                SizedBox(height: 8),
                Text('Hello, Dominic! Ready for your next adventure?',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
                SizedBox(height: 24),
                _buildSectionTitle('Top Destinations'),
                _buildHorizontalList('destination', 4),
                _buildSectionTitle('Weekend Getaways'),
                _buildHorizontalList('getaway', 3),
                _buildSectionTitle('Cultural Experiences'),
                _buildHorizontalList('culture', 2),
                _buildSectionTitle('Trip Tracker'),
                _buildProgressTracker(),
                SizedBox(height: 20),
                _buildInfoCardsGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black)),
        SizedBox(height: 8),
        Text('Curated just for you.',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildHorizontalList(String category, int count) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: count,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            width: MediaQuery.of(context).size.width * 0.63,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset(
                      'assets/$category$index.jpg', // Replace with actual images
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Place ${index + 1}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProgressTracker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: ToggleButtons(
            borderColor: Colors.grey,
            fillColor: Colors.orange,
            selectedBorderColor: Colors.orange,
            selectedColor: Colors.white,
            borderRadius: BorderRadius.circular(30),
            constraints: BoxConstraints.expand(
                height: 45, width: MediaQuery.of(context).size.width / 3.5),
            isSelected: List.generate(
                segments.length, (index) => index == selectedIndex),
            onPressed: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
            children: segments.map((e) => Text(e)).toList(),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildInfoCardsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: EdgeInsets.all(8),
      children: [
        infoCard('5 Trips', 'Total Trips', Icons.map),
        infoCard('3 Countries', 'Visited', Icons.public),
        infoCard('8', 'Bucket List Items', Icons.favorite),
        infoCard('2 Achievements', 'Awards', Icons.emoji_events),
      ],
    );
  }

  Widget infoCard(String data, String title, IconData icon) {
    return Card(
      elevation: 2,
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 30, color: Colors.orange),
            SizedBox(height: 8),
            Text(data,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(title, style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}





