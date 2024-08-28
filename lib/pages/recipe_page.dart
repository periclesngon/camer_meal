import 'dart:convert';  // For JSON decoding
import 'dart:io';  // For file handling
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;  // For making HTTP requests
import 'package:video_player/video_player.dart';


class RecipePage extends StatefulWidget {
  final String foodItem;

  const RecipePage({super.key, required this.foodItem});

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  VideoPlayerController? _videoController;
  String? _videoUrl;

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  // Make an API call to fetch the recipe details
  Future<Map<String, dynamic>> fetchRecipe(String foodItem) async {
    final response = await http.get(
      Uri.parse('https://your-api-endpoint.com/recipes?name=$foodItem'),
    );

    if (response.statusCode == 200) {
      // Parse the JSON response
      return json.decode(response.body);
    } else {
      // Handle errors
      throw Exception('Failed to load recipe');
    }
  }

  void _initializeVideo(String videoUrl) {
    _videoUrl = videoUrl;
    _videoController = VideoPlayerController.network(videoUrl)
      ..initialize().then((_) {
        setState(() {});  // Ensure the first frame is shown
        _videoController?.play();  // Auto-play the video once initialized
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.foodItem),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchRecipe(widget.foodItem),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Error loading recipe"));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text("No data available"));
          }

          final recipe = snapshot.data!;
          final description = recipe['description'] as String;
          final ingredients = recipe['ingredients'] as List<dynamic>;
          final steps = recipe['steps'] as List<dynamic>;
          final videoUrl = recipe['videoUrl'] as String?;

          if (videoUrl != null && _videoController == null) {
            _initializeVideo(videoUrl);
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Food Description
                Container(
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.only(bottom: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    description,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                ),
                // Ingredients Container
                Container(
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.only(bottom: 16.0),
                  height: 200,  // Specify a fixed height for scrollable content
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Ingredients",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ...List.generate(ingredients.length, (index) {
                          return Text(
                            "${index + 1}. ${ingredients[index]}",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                // Steps Container
                Container(
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.only(bottom: 16.0),
                  height: 200,  // Specify a fixed height for scrollable content
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Steps",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ...List.generate(steps.length, (index) {
                          return Text(
                            "${index + 1}. ${steps[index]}",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                // Video Section
                if (_videoController != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        "Recipe Video",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _videoController!.value.isInitialized
                          ? AspectRatio(
                              aspectRatio: _videoController!.value.aspectRatio,
                              child: VideoPlayer(_videoController!),
                            )
                          : const Center(child: CircularProgressIndicator()),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _videoController!.value.isPlaying
                                ? _videoController!.pause()
                                : _videoController!.play();
                          });
                        },
                        child: Text(
                          _videoController!.value.isPlaying
                              ? 'Pause Video'
                              : 'Play Video',
                        ),
                      ),
                    ],
                  )
                else if (videoUrl == null)
                  const Text(
                    "No video available for this recipe",
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
