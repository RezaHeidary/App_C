class HomeModel {
  String? body;
  String? title;
  String? date;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;
  int? id;
  HomeModel({this.body, this.title, this.date});

  HomeModel.fromJson(Map<String, dynamic> element) {
    id = element['id'];
    title = element['attributes']["title"];
    body = element['attributes']["body"];
    date = element['attributes']["date"];
    createdAt = element['attributes']["createdAt"];
    updatedAt = element['attributes']["updatedAt"];
    publishedAt = element['attributes']["publishedAt"];
  }
}
