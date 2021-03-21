
class GroceryProduct{

  final double price;
  final String nombre;
  final String descripcion;
  final String image;
  final String weight;

  const GroceryProduct({
      this.price,
      this.nombre,
      this.descripcion,
      this.image,
      this.weight
  });

}

const groceryProducts = <GroceryProduct> [

      GroceryProduct(
        price: 8.30,
        nombre: "Avacado",
        descripcion: "The avacado is a fleshy exotic fruit obtained from the tropical",
        image: "Assets/palta.png",
        weight: '500g'
        ),
      GroceryProduct(
        price: 11.00,
        nombre: "Banana",
        descripcion: "It is good fruit for everyone except diabetics and obese because of its heih starch and more",
        image: "Assets/banana.png",
        weight: '1000g'
        ),
      GroceryProduct(
        price: 15.0,
        nombre: "Mango",
        descripcion: "The Mango is a fleshy exotic fruit obtained from the tropical",
        image: "Assets/mango.png",
        weight: '800g'
        ),
      GroceryProduct(
        price: 20.5,
        nombre: "Pneapple",
        descripcion: "The Pneapple is a fleshy exotic fruit obtained from the tropical",
        image: "Assets/pina.png",
        weight: '1000g'
        ),
      GroceryProduct(
        price: 14.30,
        nombre: "Cherry",
        descripcion: "The Cherry is a fleshy exotic fruit obtained from the tropical",
        image: "Assets/cereza.png",
        weight: '500g'
        ),
      GroceryProduct(
        price: 6.15,
        nombre: "Orange",
        descripcion: "The Orange is a fleshy exotic fruit obtained from the tropical",
        image: "Assets/orange.png",
        weight: '1000g'
        ),
        
  ];