import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

import 'package:image_picker/image_picker.dart';

class FireStorgeUpLoad {
  Future<String> getImage(String imageUrl) async {
    final File file;

    final ImagePicker picker = ImagePicker();
    final XFile? imageGallery =
        await picker.pickImage(source: ImageSource.gallery);
    if (imageGallery != null) {
      file = File(imageGallery.path);
      var imageName = basename(imageGallery.path);

      var refStorge = FirebaseStorage.instance.ref(imageName);
      await refStorge.putFile(file);
      imageUrl = await refStorge.getDownloadURL();
    }
    return imageUrl;
  }
}
