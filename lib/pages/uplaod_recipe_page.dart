import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UploadRecipePage extends StatefulWidget {
  @override
  _UploadRecipePageState createState() => _UploadRecipePageState();
}

class _UploadRecipePageState extends State<UploadRecipePage> {
  final _formKey = GlobalKey<FormState>();

  String _foodName = '';
  String _description = '';
  String _ingredients = '';
  String _steps = '';
  String _videoUrl = '';

  Future<void> _uploadRecipe() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final Map<String, dynamic> recipeData = {
        "name": _foodName,
        "description": _description,
        "ingredients": _ingredients.split('\n'), // Split by new lines
        "steps": _steps.split('\n'), // Split by new lines
        "videoUrl": _videoUrl,
      };

      final response = await http.post(
        Uri.parse('https://your-api-endpoint.com/recipes'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(recipeData),
      );

      if (response.statusCode == 200) {
        // Success
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Recipe uploaded successfully!')),
        );
      } else {
        // Failure
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to upload recipe.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Recipe')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Food Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the food name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _foodName = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _description = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Ingredients (one per line)',
                  ),
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the ingredients';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _ingredients = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Steps (one per line)',
                  ),
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the cooking steps';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _steps = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Video URL'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a video URL';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _videoUrl = value!;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _uploadRecipe,
                  child: const Text('Upload Recipe'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
