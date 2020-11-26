class SourceModel {
  final String id;
  final String name;


  SourceModel(this.id,this.name,);

  SourceModel.fromJson(Map<String,dynamic> json)
      : id = json["id"],
        name = json["name"];
}