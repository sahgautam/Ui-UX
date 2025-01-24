import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        elevation: 0,
        title: Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profile Header
            Container(
              color: Colors.blue[700],
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/profile.jpg"), // Replace with actual image
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Dominic Carter",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "dominic.carter@example.com",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Account Options
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Account Settings",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildOption(
                    context,
                    icon: Icons.person,
                    title: "Edit Profile",
                    route: '/edit_profile',
                  ),
                  _buildOption(
                    context,
                    icon: Icons.lock,
                    title: "Change Password",
                    route: '/change_password',
                  ),
                  _buildOption(
                    context,
                    icon: Icons.payment,
                    title: "Payment Methods",
                    route: '/payment_methods',
                  ),
                  _buildOption(
                    context,
                    icon: Icons.history,
                    title: "Booking History",
                    route: '/booking_history',
                  ),
                  _buildOption(
                    context,
                    icon: Icons.notifications,
                    title: "Notifications",
                    route: '/notifications',
                  ),
                  _buildOption(
                    context,
                    icon: Icons.language,
                    title: "Language Preferences",
                    route: '/language_preferences',
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Support and Logout
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Support",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildOption(
                    context,
                    icon: Icons.help_outline,
                    title: "Help & Support",
                    route: '/help_support',
                  ),
                  _buildOption(
                    context,
                    icon: Icons.privacy_tip_outlined,
                    title: "Privacy Policy",
                    route: '/privacy_policy',
                  ),
                  _buildOption(
                    context,
                    icon: Icons.info_outline,
                    title: "About Us",
                    route: '/about_us',
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Logout Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implement logout functionality
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Logged out successfully!")),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  "Logout",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Widget to build an account option
  Widget _buildOption(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String route,
      }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: Colors.blue[100],
        child: Icon(icon, color: Colors.blue[700]),
      ),
      title: Text(title, style: TextStyle(fontSize: 16)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
















// Helper Function to Build Simple Pages
// Widget _buildSimplePage(String title) {
//   return Scaffold(
//     appBar: AppBar(
//       backgroundColor: Colors.blue[700],
//       title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
//     ),
//     body: Center(
//       child: Text(
//         title,
//         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//       ),
//     ),
//   );
// }
