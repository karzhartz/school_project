import "package:get/get.dart";
import "../models/tag_model.dart";

class TagController extends GetxController {
  RxMap<String, Tag> _tags = <String, Tag>{}.obs;

  List<Tag> get tagsAsList => _tags.value.values.toList();

  Tag? getTag(String tagName) {
    if (_tags.value.containsKey(tagName) == false) {
      return null;
    }
    return _tags.value[tagName]!;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    addTags([
      Tag(id: 0, name: "Math"),
      Tag(id: 1, name: "Physics"),
      Tag(id: 2, name: "Chemistry"),
      Tag(id: 3, name: "Geography"),
      Tag(id: 4, name: "History"),
      Tag(id: 5, name: "English"),
      Tag(id: 6, name: "Literature"),
    ]);

    print(_tags.value);
  }

  void addTags(List<Tag> ts) {
    for (Tag t in ts) {
      _tags.value[t.name] = t;
    }
  }
}
