import 'package:flutter/material.dart';
import 'recipe_page.dart';  // Import the RecipePage


class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of food items with associated images
    final List<Map<String, String>> foodItems = [


{'name': 'Ndolé', 'image': 'lib/assets/ndole.jpg'},
{'name': 'Poulet DG', 'image': 'lib/assets/poulet_dg.jpg'},
{'name': 'Eru', 'image': 'lib/assets/eru.jpg'},
{'name': 'Koki', 'image': 'lib/assets/koki.jpg'},
{'name': 'Achu and Yellow Soup', 'image': 'lib/assets/achu_yellow_soup.jpg'},
{'name': 'Soya', 'image': 'lib/assets/soya.jpg'},
{'name': 'Fufu Corn and Njama Njama', 'image': 'lib/assets/fufu_corn_njama_njama.jpg'},
{'name': 'Mbongo Tchobi', 'image': 'lib/assets/mbongo_tchobi.jpg'},
{'name': 'Okok', 'image': 'lib/assets/okok.jpg'},
{'name': 'Kondre', 'image': 'lib/assets/kondre.jpg'},
{'name': 'Brochettes', 'image': 'lib/assets/brochettes.jpg'},
{'name': 'Egusi Pudding', 'image': 'lib/assets/egusi_pudding.jpg'},
{'name': 'Kwacoco', 'image': 'lib/assets/kwacoco.jpg'},
{'name': 'Plantains with Beans', 'image': 'lib/assets/plantains_with_beans.jpg'},
{'name': 'Pepper Soup', 'image': 'lib/assets/pepper_soup.jpg'},
{'name': 'Cassava Leaves Stew', 'image': 'lib/assets/cassava_leaves_stew.jpg'},
{'name': 'Bobolo', 'image': 'lib/assets/bobolo.jpg'},
{'name': 'Ekwang', 'image': 'lib/assets/ekwang.jpg'},
{'name': 'Riz Sauté', 'image': 'lib/assets/riz_saute.jpg'},
{'name': 'Nnam Owondo', 'image': 'lib/assets/nnam_owondo.jpg'},
{'name': 'Kpwem', 'image': 'lib/assets/kpwem.jpg'},
{'name': 'Corn Chaff', 'image': 'lib/assets/corn_chaff.jpg'},
{'name': 'Miondo', 'image': 'lib/assets/miondo.jpg'},
{'name': 'Nchui', 'image': 'lib/assets/nchui.jpg'},
{'name': 'Accra Banana', 'image': 'lib/assets/accra_banana.jpg'},
{'name': 'Spaghetti Sauté', 'image': 'lib/assets/spaghetti_saute.jpg'},
{'name': 'Folere', 'image': 'lib/assets/folere.jpg'},
{'name': 'Egusi Soup with Pounded Yam', 'image': 'lib/assets/egusi_soup_pounded_yam.jpg'},
{'name': 'Okro', 'image': 'lib/assets/okro_soup.jpg'},
{'name': 'Avocat', 'image': 'lib/assets/avocat.jpg'}
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Cameroonian Cuisine"),
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
                    builder: (context) => RecipePage(foodItem: foodItems[index]['name']!),
                  ),
                );
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  color: Colors.white, // Removed the colored background
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3, // Larger container for the image
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.asset(
                            foodItems[index]['image']!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1, // Smaller container for the text
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text(
                            foodItems[index]['name']!,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
