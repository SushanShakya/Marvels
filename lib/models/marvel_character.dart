import 'dart:convert';

import 'package:flutter/foundation.dart';

class MarvelCharacter {
  int id;
  String name;
  String description;
  String image;
  List<Url> urls;

  MarvelCharacter(
      {this.id, this.name, this.description, this.image, this.urls});

  factory MarvelCharacter.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MarvelCharacter(
        id: map['id'],
        name: map['name'],
        description: map['description'],
        image: map['thumbnail']['path'] + "." + map['thumbnail']['extension'],
        urls: List<Url>.from(map["urls"].map((x) => Url.fromJson(x))));
  }

  factory MarvelCharacter.fromFile(String json) {
    if (json == null) return null;

    final map = jsonDecode(json);

    return MarvelCharacter(
        id: map['id'],
        name: map['name'],
        description: map['description'],
        image: map['image'],
        urls: List<Url>.from(map["urls"].map((x) => Url.fromJson(x))));
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "urls": List<dynamic>.from(urls.map((x) => x.toJson()))
      };

  String toJson() => jsonEncode(toMap());

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MarvelCharacter &&
        o.id == id &&
        o.name == name &&
        o.description == description &&
        o.image == image &&
        listEquals(o.urls, urls);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        image.hashCode ^
        urls.hashCode;
  }

  @override
  String toString() {
    return 'MarvelCharacter(id: $id, name: $name, description: $description, image: $image, urls: $urls)';
  }
}

class Url {
  String type;
  String url;
  Url({
    this.type,
    this.url,
  });

  factory Url.fromJson(Map<String, dynamic> json) => Url(
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "url": url,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Url && o.type == type && o.url == url;
  }

  @override
  int get hashCode => type.hashCode ^ url.hashCode;

  @override
  String toString() => 'Url(type: $type, url: $url)';
}
