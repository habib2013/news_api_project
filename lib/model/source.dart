class SourceModel {
  final String id;
  final String name;
  final String description;


  SourceModel(this.id,this.name,this.description);

  SourceModel.fromJson(Map<String,dynamic> json)
      : id = json["id"],
        name = json["name"],
        description = json["description"];
}