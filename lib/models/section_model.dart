class SectionModel {
  int? id;
  String? name;

  SectionModel(this.id, this.name);

  SectionModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }
}
