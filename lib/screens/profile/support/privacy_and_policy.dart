import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue[700],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                "Privacy Policy",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),

              // Introduction
              Text(
                "Your privacy is important to us. This privacy policy explains how we collect, use, and protect your information when you use our application.",
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
              SizedBox(height: 24),

              // Section 1: Data Collection
              Text(
                "1. Data Collection",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "We may collect the following types of information:\n\n"
                    "- Personal Information: Name, email address, and contact details.\n"
                    "- Usage Data: Information about how you use our application.\n"
                    "- Location Data: If you grant permission, we may collect location data for personalized services.",
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
              SizedBox(height: 24),

              // Section 2: How We Use Your Data
              Text(
                "2. How We Use Your Data",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "We use the information we collect to:\n\n"
                    "- Provide and improve our services.\n"
                    "- Personalize your user experience.\n"
                    "- Communicate with you about updates, offers, and promotions.\n"
                    "- Ensure security and prevent fraudulent activities.",
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
              SizedBox(height: 24),

              // Section 3: Data Sharing
              Text(
                "3. Data Sharing",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "We do not share your personal information with third parties, except in the following cases:\n\n"
                    "- With your explicit consent.\n"
                    "- To comply with legal obligations.\n"
                    "- With service providers who assist us in delivering services.",
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
              SizedBox(height: 24),

              // Section 4: Data Security
              Text(
                "4. Data Security",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "We implement appropriate technical and organizational measures to protect your data from unauthorized access, loss, or misuse. However, no method of transmission over the internet or electronic storage is completely secure.",
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
              SizedBox(height: 24),

              // Section 5: Your Rights
              Text(
                "5. Your Rights",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "You have the following rights regarding your personal information:\n\n"
                    "- Access: Request access to the information we hold about you.\n"
                    "- Correction: Request corrections to any inaccurate information.\n"
                    "- Deletion: Request deletion of your data, subject to applicable laws.\n"
                    "- Opt-Out: Opt-out of receiving promotional communications.",
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
              SizedBox(height: 24),

              // Contact Information
              Text(
                "Contact Us",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "If you have any questions or concerns about this privacy policy, you can contact us at:\n\n"
                    "Email: support@example.com\n"
                    "Phone: +1 234 567 890",
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
              SizedBox(height: 24),

              // Last Updated
              Text(
                "Last Updated: January 25, 2025",
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
