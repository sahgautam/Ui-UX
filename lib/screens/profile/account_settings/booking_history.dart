import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookingHistoryPage extends StatelessWidget {
  const BookingHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
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
            const Text(
              "Your Past Bookings",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Booking History List
            Expanded(
              child: ListView(
                children: [
                  _buildBookingCard(
                    destination: "Maldives",
                    date: "Jan 15, 2025",
                    status: "Completed",
                    price: "\$1,200",
                    imageUrl:
                        "https://visitmaldives.s3.amazonaws.com/kobdmEY8/c/4yvh1rdl-shareable_image.jpg",
                  ),
                  _buildBookingCard(
                    destination: "Paris",
                    date: "Dec 20, 2024",
                    status: "Cancelled",
                    price: "\$800",
                    imageUrl:
                        "https://upload.wikimedia.org/wikipedia/commons/7/75/Tour_Eiffel_-_night_%282016%29.jpg",
                  ),
                  _buildBookingCard(
                    destination: "Bali",
                    date: "Nov 10, 2024",
                    status: "Completed",
                    price: "\$1,000",
                    imageUrl:
                        "https://balidave.com/wp-content/uploads/2022/11/best-hotel-bali.jpeg",
                  ),
                  _buildBookingCard(
                    destination: "Dubai",
                    date: "Oct 5, 2024",
                    status: "Completed",
                    price: "\$900",
                    imageUrl:
                        "https://images.musement.com/cover/0002/45/dubai-skyline-at-dusk-jpg_header-144981.jpeg",
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
    required String imageUrl,
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
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          // Details Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Date: $date",
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Price: $price",
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        status == "Completed"
                            ? Icons.check_circle
                            : Icons.cancel,
                        color:
                            status == "Completed" ? Colors.green : Colors.red,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        status,
                        style: TextStyle(
                          color:
                              status == "Completed" ? Colors.green : Colors.red,
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
