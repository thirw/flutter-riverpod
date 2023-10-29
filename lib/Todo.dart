class Todo {
  String? uuid;
  String? title;
  String? desc;
  String? createdAt;

  Todo({this.uuid, this.createdAt, this.desc, this.title});

  Todo.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    title = json['title'];
    desc = json['desc'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['title'] = title;
    data['desc'] = desc;
    data['created_at'] = createdAt;
    return data;

}
}