import 'package:flutter/material.dart';
import 'package:grocery_store/Model/GroceryProduct.dart';

enum GroceryState {
  normal,
  datails,
  cart
}

class GroceryStoreBloc with ChangeNotifier
{
   GroceryState groceryState = GroceryState.normal;

    // Para que la lista no se pueda modificar unmodifiable
    List<GroceryProduct> catalog = List.unmodifiable(groceryProducts);
    List<GroceryProductItem> cart = [];


   void changeToNormal()
   {
     groceryState = GroceryState.normal;
     notifyListeners();
   }

   void changeToCart()
   {
     groceryState = GroceryState.cart;
     notifyListeners();
   }

   void addProduct(GroceryProduct product){

     for( GroceryProductItem item in cart ){

        if( item.product.nombre == product.nombre ){

            item.increment();
            notifyListeners();
            return;
        }
     }

     cart.add(GroceryProductItem(product: product));
     notifyListeners();
   }

   void deleteProduct(GroceryProductItem product){

     cart.remove(product);
     notifyListeners();
   }

   int totalCartElement() => cart.fold<int>(0, (previousValue, element) => previousValue + element.quantity);

   double totalPriceElement() => cart.fold<double>( 0.0, (previousValue, element) => previousValue + element.quantity * element.product.price);

}

class GroceryProductItem 
{
  int quantity;
  final GroceryProduct product;

  GroceryProductItem({this.quantity = 1, @required this.product});

  void increment(){
    quantity++;
  }

  void decrement(){}
}