import 'package:flutter/material.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  _BookingsScreenState createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  int selectedIndex = 0; // Default to "Upcoming" bookings

  final List<String> bookingCategories = ['Upcoming', 'Past', 'Canceled'];

  // Sample data for bookings
  final List<Map<String, String>> bookings = [
    {
      "title": "Trip to Maldives",
      "date": "Feb 20, 2025",
      "status": "Upcoming",
      "image": "assets/maldives.jpg"
    },
    {
      "title": "Visit to Paris",
      "date": "Jan 10, 2025",
      "status": "Upcoming",
      "image": "assets/paris.jpg"
    },
    {
      "title": "Trip to Bali",
      "date": "Dec 15, 2024",
      "status": "Past",
      "image": "assets/bali.jpg"
    },
    {
      "title": "Visit to Dubai",
      "date": "Nov 5, 2024",
      "status": "Canceled",
      "image": "assets/dubai.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bookings"),
        backgroundColor: Colors.blue[700],
      ),
      body: Column(
        children: [
          // Toggle for booking categories
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ToggleButtons(
              borderRadius: BorderRadius.circular(30),
              fillColor: Colors.blue[700],
              selectedColor: Colors.white,
              isSelected: List.generate(
                  bookingCategories.length, (index) => index == selectedIndex),
              onPressed: (int index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              children: bookingCategories
                  .map((category) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(category),
              ))
                  .toList(),
            ),
          ),

          // Bookings List
          Expanded(
            child: ListView.builder(
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                final booking = bookings[index];
                if (booking["status"] == bookingCategories[selectedIndex]) {
                  return _buildBookingCard(
                      title: booking["title"]!,
                      date: booking["date"]!,
                      image: booking["image"]!,
                      status: booking["status"]!);
                }
                return SizedBox(); // Skip if booking status doesn't match
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookingCard({
    required String title,
    required String date,
    required String image,
    required String status,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
            child: Image.asset(
              image,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(date, style: TextStyle(color: Colors.grey)),
                SizedBox(height: 8),
                Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getStatusColor(status).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: _getStatusColor(status),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // View Details Button
          ElevatedButton(
            onPressed: () {
              // Navigate to booking details or implement action
            },
            child: Text("View Details"),
          ),
        ],
      ),
    );
  }

  // Helper function to get status color
  Color _getStatusColor(String status) {
    switch (status) {
      case "Upcoming":
        return Colors.green;
      case "Past":
        return Colors.blue;
      case "Canceled":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
