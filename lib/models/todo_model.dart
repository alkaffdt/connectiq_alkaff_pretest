class Todo {
  Todo({
    this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  final int? userId;
  int id;
  final String? title;
  final String? body;

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      body: json["body"],
    );
  }

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
