// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CatalogModel {
  static  List<Items>? items;
}

class Items {
  final String name;
  final String desc;
  final String color;
  final String image;
  final num price;
  final int id;

  Items({
    required this.name,
    required this.desc,
    required this.color,
    required this.image,
    required this.price,
    required this.id,
  });

  Items copyWith({
    String? name,
    String? desc,
    String? color,
    String? image,
    num? price,
    int? id,
  }) {
    return Items(
      name: name ?? this.name,
      desc: desc ?? this.desc,
      color: color ?? this.color,
      image: image ?? this.image,
      price: price ?? this.price,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'desc': desc,
      'color': color,
      'image': image,
      'price': price,
      'id': id,
    };
  }

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
      name: map['name'] as String,
      desc: map['desc'] as String,
      color: map['color'] as String,
      image: map['image'] as String,
      price: map['price'] as num,
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Items.fromJson(String source) =>
      Items.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Items(name: $name, desc: $desc, color: $color, image: $image, price: $price, id: $id)';
  }

  @override
  bool operator ==(covariant Items other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.desc == desc &&
        other.color == color &&
        other.image == image &&
        other.price == price &&
        other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        desc.hashCode ^
        color.hashCode ^
        image.hashCode ^
        price.hashCode ^
        id.hashCode;
  }
}
