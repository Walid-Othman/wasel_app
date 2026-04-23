// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MenuModelAdapter extends TypeAdapter<MenuModel> {
  @override
  final int typeId = 1;

  @override
  MenuModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MenuModel(
      id: fields[0] as int,
      title: fields[1] as String,
      images: (fields[2] as List).cast<String>(),
      price: fields[3] as double,
      category: fields[4] as String,
      reviewCount: fields[5] as int,
      rating: fields[6] as double,
      descraption: fields[7] as String,
      ingredients: (fields[8] as List).cast<IngredientModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, MenuModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.images)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.reviewCount)
      ..writeByte(6)
      ..write(obj.rating)
      ..writeByte(7)
      ..write(obj.descraption)
      ..writeByte(8)
      ..write(obj.ingredients);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenuModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuModel _$MenuModelFromJson(Map<String, dynamic> json) => MenuModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      price: (json['price'] as num).toDouble(),
      category: json['category'] as String,
      reviewCount: (json['review_count'] as num).toInt(),
      rating: (json['rating'] as num).toDouble(),
      descraption: json['descraption'] as String,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => IngredientModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuModelToJson(MenuModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'images': instance.images,
      'price': instance.price,
      'category': instance.category,
      'review_count': instance.reviewCount,
      'rating': instance.rating,
      'descraption': instance.descraption,
      'ingredients': instance.ingredients,
    };
