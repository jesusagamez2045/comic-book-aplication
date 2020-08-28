import 'dart:convert';

ComicModel comicModelFromJson(Map<String, dynamic> str) => ComicModel.fromJson(str);

String comicModelToJson(ComicModel data) => json.encode(data.toJson());

class ComicModel {
  ComicModel({
    this.results,
  });

  List<Comic> results;

  factory ComicModel.fromJson(Map<String, dynamic> json) => ComicModel(
    results: List<Comic>.from(json["results"].map((x) => Comic.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Comic {
  Comic({
    this.aliases,
    this.apiDetailUrl,
    this.countOfIssues,
    this.dateAdded,
    this.dateLastUpdated,
    this.deck,
    this.description,
    this.firstIssue,
    this.id,
    this.image,
    this.lastIssue,
    this.name,
    this.publisher,
    this.siteDetailUrl,
    this.startYear,
  });

    dynamic aliases;
    String apiDetailUrl;
    int countOfIssues;
    DateTime dateAdded;
    DateTime dateLastUpdated;
    String deck;
    String description;
    FirstIssue firstIssue;
    int id;
    Image image;
    FirstIssue lastIssue;
    String name;
    FirstIssue publisher;
    String siteDetailUrl;
    String startYear;

  factory Comic.fromJson(Map<String, dynamic> json) => Comic(
    aliases: json["aliases"],
    apiDetailUrl: (json["api_detail_url"] != null) ? json["api_detail_url"]  : null,
    countOfIssues: json["count_of_issues"],
    dateAdded: DateTime.parse(json["date_added"]),
    dateLastUpdated: DateTime.parse(json["date_last_updated"]),
    deck: json["deck"] == null ? null : json["deck"],
    description: json["description"],
    firstIssue: (json["first_issue"] != null) ? FirstIssue.fromJson(json["first_issue"]) : null,
    id: json["id"],
    image: Image.fromJson(json["image"]),
    lastIssue: (json["last_issue"] != null) ? FirstIssue.fromJson(json["last_issue"]) : null,
    name: json["name"],
    publisher: (json["publisher"] != null) ? FirstIssue.fromJson(json["publisher"]) : null,
    siteDetailUrl: json["site_detail_url"],
    startYear: json["start_year"],
  );

  Map<String, dynamic> toJson() => {
    "aliases": aliases,
    "api_detail_url": apiDetailUrl,
    "count_of_issues": countOfIssues,
    "date_added": dateAdded.toIso8601String(),
    "date_last_updated": dateLastUpdated.toIso8601String(),
    "deck": deck == null ? null : deck,
    "description": description,
    "first_issue": firstIssue.toJson(),
    "id": id,
    "image": image.toJson(),
    "last_issue": lastIssue.toJson(),
    "name": name,
    "publisher": publisher.toJson(),
    "site_detail_url": siteDetailUrl,
    "start_year": startYear,
  };
}

class FirstIssue {
  FirstIssue({
    this.apiDetailUrl,
    this.id,
    this.name,
    this.issueNumber,
  });

  String apiDetailUrl;
  int id;
  String name;
  String issueNumber;

  factory FirstIssue.fromJson(Map<String, dynamic> json) => FirstIssue(
    apiDetailUrl: (json["api_detail_url"] != null) ? json["api_detail_url"] : null,
    id: json["id"],
    name: json["name"] == null ? null : json["name"],
    issueNumber: json["issue_number"] == null ? null : json["issue_number"],
  );

  Map<String, dynamic> toJson() => {
    "api_detail_url": apiDetailUrl,
    "id": id,
    "name": name == null ? null : name,
    "issue_number": issueNumber == null ? null : issueNumber,
  };
}

class Image {
  Image({
    this.iconUrl,
    this.mediumUrl,
    this.screenUrl,
    this.screenLargeUrl,
    this.smallUrl,
    this.superUrl,
    this.thumbUrl,
    this.tinyUrl,
    this.originalUrl
  });

  String iconUrl;
  String mediumUrl;
  String screenUrl;
  String screenLargeUrl;
  String smallUrl;
  String superUrl;
  String thumbUrl;
  String tinyUrl;
  String originalUrl;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    iconUrl: json["icon_url"],
    mediumUrl: json["medium_url"],
    screenUrl: json["screen_url"],
    screenLargeUrl: json["screen_large_url"],
    smallUrl: json["small_url"],
    superUrl: json["super_url"],
    thumbUrl: json["thumb_url"],
    tinyUrl: json["tiny_url"],
    originalUrl: json["original_url"]
  );

  Map<String, dynamic> toJson() => {
    "icon_url": iconUrl,
    "medium_url": mediumUrl,
    "screen_url": screenUrl,
    "screen_large_url": screenLargeUrl,
    "small_url": smallUrl,
    "super_url": superUrl,
    "thumb_url": thumbUrl,
    "tiny_url": tinyUrl,
    "original_url": originalUrl
  };
}
