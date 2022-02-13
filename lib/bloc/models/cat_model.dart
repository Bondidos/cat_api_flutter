class Cat {
  final String id;
  final String url;
  final String? description;

  const Cat({
    required this.id,
    required this.url,
    required this.description,
  });

  Cat.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        url = json['url'],
        description = (json['breeds'].isNotEmpty)
            ? json['breeds'].first['description']
            : null;

  @override
  String toString() {
    return "{id: $id, url: $url, description: $description}";
  }
}
