// lib/pages/checkout_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _addressCtrl.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: cart.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Your cart is empty'),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Back'),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Order Summary',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            ...cart.itemsList.map((item) {
                              return ListTile(
                                leading: Text(item.product.emoji, style: const TextStyle(fontSize: 28)),
                                title: Text(item.product.name),
                                subtitle: Text('Qty: ${item.quantity}'),
                                trailing: Text('Rp ${item.totalPrice.toStringAsFixed(0)}'),
                              );
                            }).toList(),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
                                Text('Rp ${cart.totalPrice.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Shipping Information',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _nameCtrl,
                            decoration: const InputDecoration(labelText: 'Full name'),
                            validator: (v) => (v == null || v.trim().isEmpty) ? 'Enter your name' : null,
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _addressCtrl,
                            decoration: const InputDecoration(labelText: 'Address'),
                            maxLines: 2,
                            validator: (v) => (v == null || v.trim().isEmpty) ? 'Enter address' : null,
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _phoneCtrl,
                            decoration: const InputDecoration(labelText: 'Phone number'),
                            keyboardType: TextInputType.phone,
                            validator: (v) => (v == null || v.trim().isEmpty) ? 'Enter phone' : null,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OutlinedButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancel'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (!_formKey.currentState!.validate()) return;

                                  // In a real app, you'd send order to backend here.
                                  final name = _nameCtrl.text.trim();

                                  // Clear cart and show confirmation
                                  cart.clear();

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Thank you $name — order placed!')),
                                  );

                                  // Return to home (product list)
                                  Navigator.of(context).popUntil((route) => route.isFirst);
                                },
                                child: const Text('Place Order'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
