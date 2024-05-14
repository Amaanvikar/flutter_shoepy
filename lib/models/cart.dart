import 'package:flutter/material.dart';
import 'package:nike_app/models/shoe.dart';

class Cart extends ChangeNotifier{
  List<Shoe> shoeShop = [
      
    Shoe(
      name: 'zoom FREAK',
      price: '236',
      imagePath: 'lib/images/nikeretro.png',
      description: 'The forward-thinking design of his latest signature shoe.',
    ),
    Shoe(
        name: 'KD Trey',
        price: '240',
        imagePath: 'lib/images/nikeair.png',
        description: 'A secure midfoot strap is suited binges and defensive',
        ),
        
     Shoe(
        name: 'Airfly',
        price: '220',
        imagePath: 'lib/images/airfly.png',
        description: 'A secure midfoot strap is suited binges and defensive',
        ),

      Shoe(
        name: 'Jorda',
        price: '200',
        imagePath: 'lib/images/jorda.png',
        description: 'A secure midfoot strap is suited binges and defensive',
        ),
           
     ];

  List<Shoe> userCart = [];

  List<Shoe> getShoelist() {
    return shoeShop;
  }

  List<Shoe> getUserCart() {
    return userCart;
  }

  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  void removeItemfromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
