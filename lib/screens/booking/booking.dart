import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:toursandtravel/core/utils/util.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({Key? key}) : super(key: key);

  @override
  _BookingsScreenState createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  int selectedIndex = 0;

  final List<String> bookingCategories = ['Upcoming', 'Past', 'Canceled'];

  final List<Map<String, dynamic>> bookings = [
    {
      "title": "Trip to Maldives",
      "date": "Feb 20, 2025",
      "status": "Upcoming",
      "image":
          "https://lilybeachmaldives.com/wp-content/uploads/2017/09/aerial-2.jpg"
    },
    {
      "title": "Visit to Paris",
      "date": "Jan 10, 2025",
      "status": "Upcoming",
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/La_Tour_Eiffel_vue_de_la_Tour_Saint-Jacques%2C_Paris_ao%C3%BBt_2014_%282%29.jpg/800px-La_Tour_Eiffel_vue_de_la_Tour_Saint-Jacques%2C_Paris_ao%C3%BBt_2014_%282%29.jpg"
    },
    {
      "title": "Trip to Bali",
      "date": "Dec 15, 2024",
      "status": "Past",
      "image":
          "https://www.viceroybali.com/wp-content/uploads/2024/11/Bali-Trip-Cost-1.webp"
    },
    {
      "title": "Visit to Dubai",
      "date": "Nov 5, 2024",
      "status": "Canceled",
      "image":
          "https://cdn.jumeirah.com/-/mediadh/dh/hospitality/jumeirah/article/stories/dubai/dubai-architecture-five-inspiring-designers/hero-burj-al-arab/hero-burj-al-arab__square.jpg"
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
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: kHorizontalMargin, vertical: kVerticalMargin),
            child: SizedBox(
              width: double.infinity,
              child: ToggleButtons(
                borderRadius: BorderRadius.circular(30),
                fillColor: Colors.blue[700],
                selectedColor: Colors.white,
                isSelected: List.generate(bookingCategories.length,
                    (index) => index == selectedIndex),
                onPressed: (int index) {
                  setState(() => selectedIndex = index);
                },
                children: bookingCategories
                    .map((category) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(category),
                        ))
                    .toList(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                final booking = bookings[index];
                if (booking["status"] == bookingCategories[selectedIndex]) {
                  return _buildBookingCard(
                    title: booking["title"],
                    date: booking["date"],
                    image: booking["image"],
                    status: booking["status"],
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookingCard(
      {required String title,
      required String date,
      required String image,
      required String status}) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
            child: CachedNetworkImage(
              imageUrl: image,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(height: 4),
                Text(date, style: TextStyle(color: Colors.grey)),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getStatusColor(status).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(status,
                      style: TextStyle(
                        color: _getStatusColor(status),
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "View Details",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],
              ),
            ),
          ),
        ],
      ),
    );
  }

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
