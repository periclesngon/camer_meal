import 'package:file_picker/file_picker.dart';

class FilePickerHelper {
  // Function to pick a video file
  static Future<String?> pickVideoFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );

    if (result != null && result.files.single.path != null) {
      return result.files.single.path; // Return the path to the selected video file
    } else {
      return null; // Return null if no file is selected
    }
  }
}
