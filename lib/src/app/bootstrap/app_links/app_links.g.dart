// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppLinks _$$_AppLinksFromJson(Map<String, dynamic> json) => _$_AppLinks(
      category: $enumDecode(_$CategoryEnumMap, json['category']),
      subCategory: $enumDecode(_$SubCategoryEnumMap, json['subCategory']),
      id: json['id'] as String,
      name: json['name'] as String,
      pictureUrl: json['pictureUrl'] as String,
      link: json['link'] as String,
    );

Map<String, dynamic> _$$_AppLinksToJson(_$_AppLinks instance) =>
    <String, dynamic>{
      'category': _$CategoryEnumMap[instance.category]!,
      'subCategory': _$SubCategoryEnumMap[instance.subCategory]!,
      'id': instance.id,
      'name': instance.name,
      'pictureUrl': instance.pictureUrl,
      'link': instance.link,
    };

const _$CategoryEnumMap = {
  Category.popular: 'popular',
  Category.card: 'card',
  Category.gift: 'gift',
  Category.stores: 'stores',
  Category.giftCards: 'giftCards',
};

const _$SubCategoryEnumMap = {
  SubCategory.popular: 'popular',
  SubCategory.popular_birthday: 'popular_birthday',
  SubCategory.funny_birthday: 'funny_birthday',
  SubCategory.christmas: 'christmas',
  SubCategory.valentines_day: 'valentines_day',
  SubCategory.mothers_day: 'mothers_day',
  SubCategory.fathers_day: 'fathers_day',
  SubCategory.for_her: 'for_her',
  SubCategory.for_him: 'for_him',
  SubCategory.for_kids: 'for_kids',
  SubCategory.pet: 'pet',
};
