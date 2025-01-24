import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Us",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[700],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/company_logo.jpg"), // Replace with actual logo
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Our Travel App",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Connecting people to extraordinary experiences.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            // Mission Section
            Text(
              "Our Mission",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "At Our Travel App, we aim to make travel planning seamless and enjoyable. "
                  "Our mission is to connect travelers with unforgettable destinations, unique experiences, and unparalleled convenience.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 30),

            // Values Section
            Text(
              "Our Values",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                _buildValueItem(
                  icon: Icons.explore,
                  title: "Exploration",
                  description: "We believe in exploring new places and helping others do the same.",
                ),
                _buildValueItem(
                  icon: Icons.group,
                  title: "Community",
                  description: "We foster a global community of travelers and explorers.",
                ),
                _buildValueItem(
                  icon: Icons.eco,
                  title: "Sustainability",
                  description: "We promote responsible and sustainable travel practices.",
                ),
              ],
            ),
            SizedBox(height: 30),

            // Team Section
            Text(
              "Meet the Team",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                _buildTeamMember(
                  name: "John Doe",
                  role: "CEO & Founder",
                  imagePath: "assets/team_member_1.jpg", // Replace with actual image
                ),
                _buildTeamMember(
                  name: "Jane Smith",
                  role: "Head of Product",
                  imagePath: "assets/team_member_2.jpg", // Replace with actual image
                ),
                _buildTeamMember(
                  name: "Alex Johnson",
                  role: "Lead Designer",
                  imagePath: "assets/team_member_3.jpg", // Replace with actual image
                ),
              ],
            ),
            SizedBox(height: 30),

            // Contact Section
            Text(
              "Contact Us",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "If you have any questions or feedback, feel free to reach out to us at:",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.email, color: Colors.blue[700]),
                SizedBox(width: 8),
                Text(
                  "contact@travelapp.com",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget for Values
  Widget _buildValueItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.blue[700], size: 28),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(fontSize: 16, height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper Widget for Team Members
  Widget _buildTeamMember({
    required String name,
    required String role,
    required String imagePath,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath), // Replace with actual image
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                role,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
