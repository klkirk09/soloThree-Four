class Dog {
  final int? id;
  final String imageUrl;

  Dog({
    this.id,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imageUrl': imageUrl,
    };
  }

  factory Dog.fromMap(Map<String, dynamic> map) {
    return Dog(
      id: map['id'] as int?,
      imageUrl: map['imageUrl'] as String,
    );
  }
}