import 'package:flutter/material.dart';
import 'package:grocery_store/Model/GroceryProduct.dart';


class GrocreyDetails extends StatefulWidget 
{

  final GroceryProduct product;
  final VoidCallback onProductAddes;

  const GrocreyDetails({Key key, @required this.product, this.onProductAddes}) : super(key: key);

  @override
  _GrocreyDetailsState createState() => _GrocreyDetailsState();
}

class _GrocreyDetailsState extends State<GrocreyDetails> 
{
  String heroTag = '';

  void _addToCard(BuildContext context){

    setState(() {
      heroTag = 'details';
    });
    widget.onProductAddes();
    Navigator.of(context).pop();

  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Colors.black87),
      ),
      body: Column(
        children: [

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Hero(
                    tag: 'list_${widget.product.nombre}$heroTag',
                    child: Image.asset(
                      widget.product.image,
                      fit: BoxFit.contain,
                      height: MediaQuery.of(context).size.height * 0.36,
                    ),
                  ),
                  Text(
                    widget.product.nombre,
                    style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Text(
                    widget.product.weight,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Spacer(),
                      Text(
                        '\$${widget.product.price}',
                        style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    'About the product',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    widget.product.descripcion,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.black),
                  ),
                ],
              ),
            )
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: IconButton(icon: Icon(Icons.favorite_border), onPressed: () => null)
                ),
                Expanded(
                  flex: 4,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFF4C459)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                        )
                      )
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text('Add to Cart', style: TextStyle(color: Colors.black)),
                    ),
                    onPressed: () => _addToCard(context),
                  )
                )
              ],
            ),
          )

        ],
      )
    );
  }
}
