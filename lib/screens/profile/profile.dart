import 'package:flutter/material.dart';
import 'package:tourist_application/core/utils/asset_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        elevation: 0,
        title: const Text(
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
                    backgroundImage: AssetImage(Assets.images
                        .profile), // Ensure 'Assets.images.profile' resolves to a correct path.
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Dominic Carter",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "dominic.carter@example.com",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Account Options
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Account Settings",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
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
            const SizedBox(height: 20),

            // Support and Logout
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Support",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
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
            const SizedBox(height: 20),

            // Logout Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implement logout functionality
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Logged out successfully!")),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  "Logout",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
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
