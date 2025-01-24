import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  // Notification preferences
  bool _promoNotifications = true;
  bool _bookingUpdates = true;
  bool _generalNotifications = false;

  void _saveNotificationPreferences() {
    // Implement save logic here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Notification preferences saved."),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              "Manage Notification Preferences",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            // Promotional Notifications
            SwitchListTile(
              title: Text("Promotional Notifications"),
              subtitle: Text("Receive updates on special deals and offers."),
              value: _promoNotifications,
              onChanged: (value) {
                setState(() {
                  _promoNotifications = value;
                });
              },
            ),

            // Booking Updates
            SwitchListTile(
              title: Text("Booking Updates"),
              subtitle: Text("Get notifications about your bookings."),
              value: _bookingUpdates,
              onChanged: (value) {
                setState(() {
                  _bookingUpdates = value;
                });
              },
            ),

            // General Notifications
            SwitchListTile(
              title: Text("General Notifications"),
              subtitle: Text("Receive general updates and announcements."),
              value: _generalNotifications,
              onChanged: (value) {
                setState(() {
                  _generalNotifications = value;
                });
              },
            ),

            Spacer(),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveNotificationPreferences,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Save Changes",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
