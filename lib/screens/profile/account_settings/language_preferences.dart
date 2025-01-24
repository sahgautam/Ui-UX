import 'package:flutter/material.dart';

class LanguagePreferencesPage extends StatefulWidget {
  const LanguagePreferencesPage({super.key});

  @override
  _LanguagePreferencesPageState createState() =>
      _LanguagePreferencesPageState();
}

class _LanguagePreferencesPageState extends State<LanguagePreferencesPage> {
  // List of available languages
  final List<String> _languages = [
    "English",
    "Spanish",
    "French",
    "German",
    "Chinese",
    "Hindi",
    "Arabic",
    "Russian"
  ];

  // Currently selected language
  String _selectedLanguage = "English";

  void _saveLanguagePreference() {
    // Implement save logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Language preference saved: $_selectedLanguage"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Language Preferences",
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
              "Select Your Preferred Language",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            // Language List
            Expanded(
              child: ListView.builder(
                itemCount: _languages.length,
                itemBuilder: (context, index) {
                  final language = _languages[index];
                  return RadioListTile<String>(
                    title: Text(language),
                    value: language,
                    groupValue: _selectedLanguage,
                    onChanged: (value) {
                      setState(() {
                        _selectedLanguage = value!;
                      });
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 20),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveLanguagePreference,
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
