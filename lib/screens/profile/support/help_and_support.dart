import 'package:flutter/material.dart';

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Help & Support",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search for help topics",
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

            // FAQ Section
            Text(
              "Frequently Asked Questions",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildFAQItem(
                    question: "How do I reset my password?",
                    answer:
                    "To reset your password, go to the login screen, click on 'Forgot Password', and follow the instructions sent to your email.",
                  ),
                  _buildFAQItem(
                    question: "How can I change my account details?",
                    answer:
                    "You can update your account details by navigating to 'Edit Profile' in your account settings.",
                  ),
                  _buildFAQItem(
                    question: "How do I contact customer support?",
                    answer:
                    "You can contact our support team via email at support@example.com or call us at +1-234-567-890.",
                  ),
                  _buildFAQItem(
                    question: "What is the refund policy?",
                    answer:
                    "Refunds are processed according to our policy. Please visit the 'Refund Policy' section for detailed information.",
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Contact Support Section
            Text(
              "Contact Support",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                _buildContactOption(
                  icon: Icons.email,
                  label: "Email Us",
                  onTap: () {
                    // Navigate to email
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Opening email...")),
                    );
                  },
                ),
                SizedBox(width: 16),
                _buildContactOption(
                  icon: Icons.phone,
                  label: "Call Us",
                  onTap: () {
                    // Open phone dialer
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Opening dialer...")),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget for FAQ Item
  Widget _buildFAQItem({required String question, required String answer}) {
    return ExpansionTile(
      title: Text(
        question,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            answer,
            style: TextStyle(height: 1.5),
          ),
        ),
      ],
    );
  }

  // Helper Widget for Contact Option
  Widget _buildContactOption(
      {required IconData icon, required String label, required VoidCallback onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Icon(icon, color: Colors.blue[700], size: 28),
              SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
