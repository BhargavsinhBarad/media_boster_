import 'package:image_picker/image_picker.dart';

class Global {
  static XFile? pic;
  static ImagePicker picker = ImagePicker();
}

List<Map<String, dynamic>> audio = [
  {
    'audio': "lib/Audio/dil.mp3",
    'image': "lib/Image/1.jfif",
    'title': "Dil Galti Kar Baitha Hai",
  },
  {
    'audio': "lib/Audio/har.mp3",
    'image': "lib/Image/2.jfif",
    'title': "Har Har Shambhu",
  },
  {
    'audio': "lib/Audio/jalwa.mp3",
    'image': "lib/Image/3.jfif",
    'title': "Jalwa",
  },
  {
    'audio': "lib/Audio/pyaar.mp3",
    'image': "lib/Image/4.jfif",
    'title': "Pyaar Hota Kayi Baar Hai",
  },
  {
    'audio': "lib/Audio/maan.mp3",
    'image': "lib/Image/5.jfif",
    'title': "Maan Meri jaan",
  },
];

List<Map<String, dynamic>> video = [
  {
    'video': "lib/Video/1.3gp",
    'image': "lib/Image/6.jfif",
  },
  {
    'video': "lib/Video/2.3gp",
    'image': "lib/Image/9.jfif",
  },
  {
    'video': "lib/Video/3.3gp",
    'image': "lib/Image/10.jfif",
  },
];
