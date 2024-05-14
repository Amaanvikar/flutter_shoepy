import 'package:flutter/material.dart';
import 'package:nike_app/models/cart.dart';
import 'package:nike_app/models/shoe.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final BuildContext context;
 final Shoe shoe;


 CartItem({
    super.key,
    required this.shoe, 
    required this.context,
  });

  void removeItemFromCart(){
    Provider.of<Cart>(context, 
    listen: false).removeItemfromCart(shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[100],
      borderRadius: BorderRadius.circular(8),
      ),

      child: ListTile(
        leading: Image.asset(shoe.imagePath),
        title: Text(shoe.name),
        subtitle: Text(shoe.price),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
        onPressed: removeItemFromCart,
        ),
        ),
      
    );
  }
}
