// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_consumed.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const MealConsumedSchema = Schema(
  name: r'MealConsumed',
  id: -2112322328609894127,
  properties: {
    r'calories': PropertySchema(
      id: 0,
      name: r'calories',
      type: IsarType.long,
    ),
    r'category': PropertySchema(
      id: 1,
      name: r'category',
      type: IsarType.byte,
      enumMap: _MealConsumedcategoryEnumValueMap,
    ),
    r'dateConsumed': PropertySchema(
      id: 2,
      name: r'dateConsumed',
      type: IsarType.dateTime,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _mealConsumedEstimateSize,
  serialize: _mealConsumedSerialize,
  deserialize: _mealConsumedDeserialize,
  deserializeProp: _mealConsumedDeserializeProp,
);

int _mealConsumedEstimateSize(
  MealConsumed object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _mealConsumedSerialize(
  MealConsumed object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.calories);
  writer.writeByte(offsets[1], object.category.index);
  writer.writeDateTime(offsets[2], object.dateConsumed);
  writer.writeString(offsets[3], object.name);
}

MealConsumed _mealConsumedDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MealConsumed(
    calories: reader.readLongOrNull(offsets[0]) ?? 100,
    category:
        _MealConsumedcategoryValueEnumMap[reader.readByteOrNull(offsets[1])] ??
            MealCategory.lunch,
    name: reader.readStringOrNull(offsets[3]) ?? "Bacon and Eggs",
  );
  return object;
}

P _mealConsumedDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset) ?? 100) as P;
    case 1:
      return (_MealConsumedcategoryValueEnumMap[
              reader.readByteOrNull(offset)] ??
          MealCategory.lunch) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset) ?? "Bacon and Eggs") as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _MealConsumedcategoryEnumValueMap = {
  'breakfast': 0,
  'lunch': 1,
  'dinner': 2,
  'drink': 3,
};
const _MealConsumedcategoryValueEnumMap = {
  0: MealCategory.breakfast,
  1: MealCategory.lunch,
  2: MealCategory.dinner,
  3: MealCategory.drink,
};

extension MealConsumedQueryFilter
    on QueryBuilder<MealConsumed, MealConsumed, QFilterCondition> {
  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      caloriesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calories',
        value: value,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      caloriesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'calories',
        value: value,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      caloriesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'calories',
        value: value,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      caloriesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'calories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      categoryEqualTo(MealCategory value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      categoryGreaterThan(
    MealCategory value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      categoryLessThan(
    MealCategory value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      categoryBetween(
    MealCategory lower,
    MealCategory upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      dateConsumedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateConsumed',
        value: value,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      dateConsumedGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateConsumed',
        value: value,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      dateConsumedLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateConsumed',
        value: value,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      dateConsumedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateConsumed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension MealConsumedQueryObject
    on QueryBuilder<MealConsumed, MealConsumed, QFilterCondition> {}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealConsumed _$MealConsumedFromJson(Map<String, dynamic> json) => MealConsumed(
      name: json['name'] as String? ?? "Bacon and Eggs",
      calories: json['calories'] as int? ?? 100,
      category: $enumDecodeNullable(_$MealCategoryEnumMap, json['category']) ??
          MealCategory.lunch,
    );

Map<String, dynamic> _$MealConsumedToJson(MealConsumed instance) =>
    <String, dynamic>{
      'name': instance.name,
      'calories': instance.calories,
      'category': _$MealCategoryEnumMap[instance.category]!,
    };

const _$MealCategoryEnumMap = {
  MealCategory.breakfast: 'breakfast',
  MealCategory.lunch: 'lunch',
  MealCategory.dinner: 'dinner',
  MealCategory.drink: 'drink',
};
