import 'package:flutter/material.dart';

class BookingHistoryPage extends StatelessWidget {
  const BookingHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Booking History",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Page Title
            Text(
              "Your Past Bookings",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            // Booking History List
            Expanded(
              child: ListView(
                children: [
                  _buildBookingCard(
                    destination: "Maldives",
                    date: "Jan 15, 2025",
                    status: "Completed",
                    price: "\$1,200",
                    imagePath: "assets/maldives.jpg",
                  ),
                  _buildBookingCard(
                    destination: "Paris",
                    date: "Dec 20, 2024",
                    status: "Cancelled",
                    price: "\$800",
                    imagePath: "assets/paris.jpg",
                  ),
                  _buildBookingCard(
                    destination: "Bali",
                    date: "Nov 10, 2024",
                    status: "Completed",
                    price: "\$1,000",
                    imagePath: "assets/bali.jpg",
                  ),
                  _buildBookingCard(
                    destination: "Dubai",
                    date: "Oct 5, 2024",
                    status: "Completed",
                    price: "\$900",
                    imagePath: "assets/dubai.jpg",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget for Booking Card
  Widget _buildBookingCard({
    required String destination,
    required String date,
    required String status,
    required String price,
    required String imagePath,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Image Section
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12),

          // Details Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Date: $date",
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Price: $price",
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        status == "Completed"
                            ? Icons.check_circle
                            : Icons.cancel,
                        color: status == "Completed" ? Colors.green : Colors.red,
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Text(
                        status,
                        style: TextStyle(
                          color: status == "Completed"
                              ? Colors.green
                              : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
