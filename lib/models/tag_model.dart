class Tag {
  final int id;
  final String name;

  Tag({required this.id, required this.name});

  factory Tag.fromMap(Map mappedTag) {
    return Tag(id: mappedTag["id"], name: mappedTag["name"]);
  }
}
