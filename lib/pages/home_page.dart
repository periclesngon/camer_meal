
import 'package:flutter/material.dart';
import 'recipe_page.dart';  // Import the RecipePage

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of food items
    final List<String> foodItems = [
      'Ndolé',
      'Poulet DG',
      'Eru',
      'Koki',
      'Achu and Yellow Soup',
      'Soya',
      'Fufu Corn and Njama Njama',
      'Mbongo Tchobi',
      'Okok',
      'Kondre',
      'Brochettes',
      'Egusi Pudding',
      'Kwacoco',
      'Plantains with Beans',
      'Pepper Soup',
      'Cassava Leaves Stew',
      'Bobolo',
      'Ekwang',
      'Taro and Yellow Sauce',
      'Nnam Owondo',
      'Kpwem',
      'Corn Chaff',
      'Miondo',
      'Nchui',
      'Accra Banana',
      'Kondowolé',
      'Bongolaise',
      'Egusi Soup with Pounded Yam',
      'Bitterleaf and Groundnut Soup',
      'Nyamangoro'
    ];

    // List of colors to change dynamically
    final List<Color> colors = [
      Colors.lightBlueAccent.withOpacity(0.5),
      Colors.orangeAccent.withOpacity(0.5),
      Colors.greenAccent.withOpacity(0.5),
      Colors.pinkAccent.withOpacity(0.5),
      Colors.purpleAccent.withOpacity(0.5),
      Colors.yellowAccent.withOpacity(0.5),
      Colors.redAccent.withOpacity(0.5),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Center( 
          child: Text("Cameroonian Cuisine")
          ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns in the grid
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 3 / 2, // Aspect ratio of each item
          ),
          itemCount: foodItems.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipePage(foodItem: foodItems[index]),),
                );

              },
              child: Container(
                decoration: BoxDecoration(
                  color: colors[index % colors.length],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    foodItems[index],
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
