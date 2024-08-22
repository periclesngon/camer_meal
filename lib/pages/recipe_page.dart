import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:video_player/video_player.dart';

class RecipePage extends StatefulWidget {
  final String foodItem;

  const RecipePage({super.key, required this.foodItem});

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  VideoPlayerController? _videoController;
  String? _videoPath;

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  // Dummy API response simulation (replace with real API call)
  Future<Map<String, dynamic>> fetchRecipe(String foodItem) async {
    // Simulated API response
    return {
      "ingredients": [
        "1 kg of meat",
        "2 cups of water",
        "1 tsp salt",
        "3 tomatoes",
        "1 onion",
        "1 tsp pepper",
        "1 tbsp oil",
      ],
      "steps": [
        "Chop the tomatoes and onions.",
        "Heat the oil in a pan.",
        "Add the onions and cook until golden brown.",
        "Add the tomatoes and cook for another 5 minutes.",
        "Add the meat and salt, and cook until the meat is tender.",
        "Add water and simmer for 20 minutes.",
        "Serve hot with your preferred side dish.",
      ],
    };
  }

  Future<void> _pickVideo() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        _videoPath = result.files.single.path!;
        _videoController = VideoPlayerController.file(result.files.single.file!)
          ..initialize().then((_) {
            setState(() {}); // Ensure the first frame is shown
          });
      });
    }
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
          final ingredients = recipe['ingredients'] as List<String>;
          final steps = recipe['steps'] as List<String>;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Ingredients Container
                Container(
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.only(bottom: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
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
                // Steps Container
                Container(
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.only(bottom: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
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
                // Video Upload Section
                if (_videoController != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.greenAccent.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          "Recipe Video",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
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
                else
                  ElevatedButton(
                    onPressed: _pickVideo,
                    child: const Text('Upload Recipe Video'),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
