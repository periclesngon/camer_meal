import 'package:flutter/material.dart';

class TapBar extends StatefulWidget {
  const TapBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TapBarState createState() => _TapBarState();
}

class _TapBarState extends State<TapBar> {
  int _selectedIndex = 0;
  List<Map<String, String>> _filteredFoodItems = [];
  final List<Map<String, String>> _foodItems = [

 {'name': 'Ndolé', 'category': 'Breakfast'},
{'name': 'Bobolo', 'category': 'Breakfast'},
{'name': 'Miondo', 'category': 'Breakfast'},
{'name': 'Fufu Corn and Njama Njama', 'category': 'Breakfast'},
{'name': 'Koki', 'category': 'Breakfast'},
{'name': 'Accra Banana', 'category': 'Breakfast'},
{'name': 'Plantains with Beans', 'category': 'Breakfast'},
{'name': 'Corn Chaff', 'category': 'Breakfast'},
{'name': 'Soya', 'category': 'Breakfast'},
{'name': 'Riz Sauté', 'category': 'Breakfast'},
{'name': 'Poulet DG', 'category': 'Lunch'},
{'name': 'Eru', 'category': 'Lunch'},
{'name': 'Achu and Yellow Soup', 'category': 'Lunch'},
{'name': 'Mbongo Tchobi', 'category': 'Lunch'},
{'name': 'Okok', 'category': 'Lunch'},
{'name': 'Kondre', 'category': 'Lunch'},
{'name': 'Brochettes', 'category': 'Lunch'},
{'name': 'Egusi Pudding', 'category': 'Lunch'},
{'name': 'Kwacoco', 'category': 'Lunch'},
{'name': 'Nnam Owondo', 'category': 'Lunch'},
{'name': 'Pepper Soup', 'category': 'Dinner'},
{'name': 'Cassava Leaves Stew', 'category': 'Dinner'},
{'name': 'Ekwang', 'category': 'Dinner'},
{'name': 'Kpwem', 'category': 'Dinner'},
{'name': 'Miondo', 'category': 'Dinner'},
{'name': 'Nchui', 'category': 'Dinner'},
{'name': 'Spaghetti Sauté', 'category': 'Dinner'},
{'name': 'Folere', 'category': 'Dinner'},
{'name': 'Egusi Soup with Pounded Yam', 'category': 'Dinner'},
{'name': 'Okro', 'category': 'Dinner'}

  ];

  @override
  void initState() {
    super.initState();
    _filteredFoodItems = _foodItems;
  }

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
      _filterFoodItems(index);
    });
  }

  void _filterFoodItems(int index) {
    switch (index) {
      case 0: // All
        _filteredFoodItems = _foodItems;
        break;
      case 1: // Breakfast
        _filteredFoodItems = _foodItems
            .where((item) => item['category']!.toLowerCase() == 'breakfast')
            .toList();
        break;
      case 2: // Lunch
        _filteredFoodItems = _foodItems
            .where((item) => item['category']!.toLowerCase() == 'lunch')
            .toList();
        break;
      case 3: // Dinner
        _filteredFoodItems = _foodItems
            .where((item) => item['category']!.toLowerCase() == 'dinner')
            .toList();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.blueAccent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTapBarItem('All', 0),
              _buildTapBarItem('Breakfast', 1),
              _buildTapBarItem('Lunch', 2),
              _buildTapBarItem('Dinner', 3),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _filteredFoodItems.length,
            itemBuilder: (context, index) {
              final item = _filteredFoodItems[index];
              return ListTile(
                title: Text(item['name']!),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTapBarItem(String label, int index) {
    return GestureDetector(
      onTap: () => _onTap(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          label,
          style: TextStyle(
            color: _selectedIndex == index ? Colors.white : Colors.white70,
            fontSize: 16.0,
            fontWeight: _selectedIndex == index ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}