import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Page'),
      ),
      body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(cartItem['imageUrl'] as String),
                radius: 30,
              ),
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            title: Text(
                              'Delete product?',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            content: const Text(
                                'are You sure you want remove product ?'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // see on stack
                                  },
                                  child: const Text('No',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold))),
                              TextButton(
                                  onPressed: () {
                                    Provider.of<CartProvider>(context,
                                            listen: false)
                                        .removeProduct(cartItem);
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'YES',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ]);
                      });
                },
                icon: Icon(Icons.delete),
                color: const Color.fromARGB(255, 177, 9, 9),
              ),
              title: Text(cartItem['title'].toString(),
                  style: Theme.of(context).textTheme.bodySmall),
              subtitle: Text('Size: ${cartItem['sizes']}'),
            );
          }),
    );
  } // minu widget
}
