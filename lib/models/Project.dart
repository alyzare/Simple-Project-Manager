class Project {
  String title;
  String details;

  Project({this.title, this.details});

  Project.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        details = json["details"];

  Map<String, dynamic> toJson() =>
      {
        'title': title,
        'details': details,
      };
}
