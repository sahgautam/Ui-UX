import 'package:flutter/material.dart';

class PaymentMethodsPage extends StatefulWidget {
  const PaymentMethodsPage({super.key});

  @override
  _PaymentMethodsPageState createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage> {
  // Sample list of payment methods
  final List<Map<String, String>> _paymentMethods = [
    {"type": "Credit Card", "details": "**** **** **** 1234"},
    {"type": "PayPal", "details": "user@example.com"},
  ];

  void _addPaymentMethod() {
    // Implement adding a new payment method
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Add Payment Method functionality coming soon.")),
    );
  }

  void _removePaymentMethod(int index) {
    setState(() {
      _paymentMethods.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Payment method removed.")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment Methods",
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
              "Manage Your Payment Methods",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            // List of Payment Methods
            Expanded(
              child: ListView.builder(
                itemCount: _paymentMethods.length,
                itemBuilder: (context, index) {
                  final method = _paymentMethods[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Icon(
                        method["type"] == "Credit Card"
                            ? Icons.credit_card
                            : Icons.account_balance_wallet,
                        color: Colors.blue[700],
                      ),
                      title: Text(method["type"]!),
                      subtitle: Text(method["details"]!),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _removePaymentMethod(index),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),

            // Add Payment Method Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _addPaymentMethod,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Add Payment Method",
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
