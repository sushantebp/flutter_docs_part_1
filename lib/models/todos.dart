class Todos {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const Todos({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todos.dummy() =>
      Todos(userId: 1, id: 1, title: "delectus aut autem", completed: true);

  Map<String, dynamic> toMap() => {
    'userId': userId,
    'id': id,
    'title': title,
    'completed': completed,
  };
}
