import 'package:flutter/material.dart';
import 'package:nike_app/components/shoe_tile.dart';
import 'package:nike_app/models/cart.dart';
import 'package:nike_app/models/shoe.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {


  void addShoeToCart(Shoe shoe){
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    showDialog(context: context, 
    builder: (context) => AlertDialog(
      title: Text(
        'Succesfully added!'),
        content: Text('Check your cart'),
        ),
        );


      }



  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) => Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Search',
                style: TextStyle(color: Colors.grey),
              ),
              Icon(
                Icons.search,
                color: Colors.grey,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Text(
            'your only limit is you',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                'Hot picks',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Text(
                'see all',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Shoe shoe = value.getShoelist()[index];


              return ShoeTile(
                shoe: shoe,
                onTap: () => addShoeToCart(shoe),
              );
            },
          ),
        ),

       const Padding(
          padding: EdgeInsets.only(
            top: 25.0,
            left: 25.0,
            right: 25.0),
          child: Divider(
            color: Colors.white,),
        )

      ],
    ),
    );
  }
}
