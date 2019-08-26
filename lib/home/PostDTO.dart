class PostDTO {
  int userId;
  int id;
  String title;
  String body;

  PostDTO({this.userId, this.id, this.title, this.body});

  PostDTO.fromJsonMap(Map<String, dynamic> map)
      : userId = map["userId"],
        id = map["id"],
        title = map["title"],
        body = map["body"];

  static PostDTO toDTO(Map<String, dynamic> map) => PostDTO(
    userId: map["userId"],
    id: map["id"],
    title: map["title"],
    body: map["body"],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["userId"] = userId;
    data["id"] = id;
    data["title"] = title;
    data["body"] = body;
    return data;
  }
}