import 'package:flutter/material.dart';
import 'package:grocery_store/Pages/GroceryDetails.dart';
import 'package:grocery_store/Pages/Home.dart';

import 'package:grocery_store/Providers/GroceryProvider.dart';
import 'package:grocery_store/Widgets/StaggeredDualView.dart';

class GroceryList extends StatelessWidget 
{

  @override
  Widget build(BuildContext context) 
  {
    final bloc = GroceryProvider.of(context).bloc;
    
    return Container(
        color: backgroundColor,
        padding: EdgeInsets.only(top: carBarHeigh, left: 10.0, right: 10.0),
        child: StaggeredDualView(
          spacing: 5,
          alturaElement: 0.3,
          aspectRatio: 0.7,
          itemCount: bloc.catalog.length,
          itemBuilder: (context, index){
            
            final product = bloc.catalog[index];

            return GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                  PageRouteBuilder( 
                    transitionDuration: Duration(milliseconds: 700),
                    pageBuilder: (context, animation, _) {
                    
                    return FadeTransition(
                      opacity: animation,
                      child: GrocreyDetails(
                        product: product, 
                        onProductAddes: (){
                          bloc.addProduct(product);
                        }
                      )
                    );
                }));
              },
              child: Card(
                shadowColor: Colors.black26,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 10.0,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: 
                        Hero(
                          tag: 'list_${product.nombre}',
                          child: Image.asset(product.image, fit: BoxFit.contain, height: 100)
                        )
                      ),
                      Text('\$${product.price}', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 15,),
                      Text(product.nombre, style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500 )),
                      Text(product.weight, style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500 )),
                    ],
                  ),
                ),
              ),
            );
            
          },
      ),
    );
  }
}