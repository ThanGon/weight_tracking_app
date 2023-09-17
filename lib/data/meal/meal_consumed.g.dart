// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_consumed.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMealConsumedCollection on Isar {
  IsarCollection<MealConsumed> get mealConsumeds => this.collection();
}

const MealConsumedSchema = CollectionSchema(
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
    r'description': PropertySchema(
      id: 3,
      name: r'description',
      type: IsarType.string,
    ),
    r'imageURI': PropertySchema(
      id: 4,
      name: r'imageURI',
      type: IsarType.string,
    ),
    r'ingredients': PropertySchema(
      id: 5,
      name: r'ingredients',
      type: IsarType.objectList,
      target: r'Ingredient',
    ),
    r'name': PropertySchema(
      id: 6,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _mealConsumedEstimateSize,
  serialize: _mealConsumedSerialize,
  deserialize: _mealConsumedDeserialize,
  deserializeProp: _mealConsumedDeserializeProp,
  idName: r'id',
  indexes: {
    r'dateConsumed': IndexSchema(
      id: 6633330020351521530,
      name: r'dateConsumed',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'dateConsumed',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'user': LinkSchema(
      id: 5756438452719712283,
      name: r'user',
      target: r'User',
      single: true,
      linkName: r'meals',
    )
  },
  embeddedSchemas: {r'Ingredient': IngredientSchema},
  getId: _mealConsumedGetId,
  getLinks: _mealConsumedGetLinks,
  attach: _mealConsumedAttach,
  version: '3.1.0+1',
);

int _mealConsumedEstimateSize(
  MealConsumed object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.imageURI;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.ingredients.length * 3;
  {
    final offsets = allOffsets[Ingredient]!;
    for (var i = 0; i < object.ingredients.length; i++) {
      final value = object.ingredients[i];
      bytesCount += IngredientSchema.estimateSize(value, offsets, allOffsets);
    }
  }
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
  writer.writeString(offsets[3], object.description);
  writer.writeString(offsets[4], object.imageURI);
  writer.writeObjectList<Ingredient>(
    offsets[5],
    allOffsets,
    IngredientSchema.serialize,
    object.ingredients,
  );
  writer.writeString(offsets[6], object.name);
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
    description: reader.readStringOrNull(offsets[3]),
    imageURI: reader.readStringOrNull(offsets[4]),
    name: reader.readStringOrNull(offsets[6]) ?? "Bacon and Eggs",
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
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readObjectList<Ingredient>(
            offset,
            IngredientSchema.deserialize,
            allOffsets,
            Ingredient(),
          ) ??
          []) as P;
    case 6:
      return (reader.readStringOrNull(offset) ?? "Bacon and Eggs") as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _MealConsumedcategoryEnumValueMap = {
  'breakfast': 0,
  'lunch': 1,
  'dinner': 2,
  'snack': 3,
};
const _MealConsumedcategoryValueEnumMap = {
  0: MealCategory.breakfast,
  1: MealCategory.lunch,
  2: MealCategory.dinner,
  3: MealCategory.snack,
};

Id _mealConsumedGetId(MealConsumed object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _mealConsumedGetLinks(MealConsumed object) {
  return [object.user];
}

void _mealConsumedAttach(
    IsarCollection<dynamic> col, Id id, MealConsumed object) {
  object.user.attach(col, col.isar.collection<User>(), r'user', id);
}

extension MealConsumedQueryWhereSort
    on QueryBuilder<MealConsumed, MealConsumed, QWhere> {
  QueryBuilder<MealConsumed, MealConsumed, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterWhere> anyDateConsumed() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'dateConsumed'),
      );
    });
  }
}

extension MealConsumedQueryWhere
    on QueryBuilder<MealConsumed, MealConsumed, QWhereClause> {
  QueryBuilder<MealConsumed, MealConsumed, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterWhereClause>
      dateConsumedEqualTo(DateTime dateConsumed) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'dateConsumed',
        value: [dateConsumed],
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterWhereClause>
      dateConsumedNotEqualTo(DateTime dateConsumed) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dateConsumed',
              lower: [],
              upper: [dateConsumed],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dateConsumed',
              lower: [dateConsumed],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dateConsumed',
              lower: [dateConsumed],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dateConsumed',
              lower: [],
              upper: [dateConsumed],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterWhereClause>
      dateConsumedGreaterThan(
    DateTime dateConsumed, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dateConsumed',
        lower: [dateConsumed],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterWhereClause>
      dateConsumedLessThan(
    DateTime dateConsumed, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dateConsumed',
        lower: [],
        upper: [dateConsumed],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterWhereClause>
      dateConsumedBetween(
    DateTime lowerDateConsumed,
    DateTime upperDateConsumed, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dateConsumed',
        lower: [lowerDateConsumed],
        includeLower: includeLower,
        upper: [upperDateConsumed],
        includeUpper: includeUpper,
      ));
    });
  }
}

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

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      imageURIIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageURI',
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      imageURIIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageURI',
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      imageURIEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageURI',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      imageURIGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageURI',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      imageURILessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageURI',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      imageURIBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageURI',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      imageURIStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageURI',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      imageURIEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageURI',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      imageURIContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageURI',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      imageURIMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageURI',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      imageURIIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageURI',
        value: '',
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      imageURIIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageURI',
        value: '',
      ));
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      ingredientsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredients',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      ingredientsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredients',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      ingredientsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredients',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      ingredientsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredients',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      ingredientsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredients',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      ingredientsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredients',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
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
    on QueryBuilder<MealConsumed, MealConsumed, QFilterCondition> {
  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition>
      ingredientsElement(FilterQuery<Ingredient> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'ingredients');
    });
  }
}

extension MealConsumedQueryLinks
    on QueryBuilder<MealConsumed, MealConsumed, QFilterCondition> {
  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition> user(
      FilterQuery<User> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'user');
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterFilterCondition> userIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'user', 0, true, 0, true);
    });
  }
}

extension MealConsumedQuerySortBy
    on QueryBuilder<MealConsumed, MealConsumed, QSortBy> {
  QueryBuilder<MealConsumed, MealConsumed, QAfterSortBy> sortByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.asc);
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterSortBy> sortByCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.desc);
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterSortBy> sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterSortBy> sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterSortBy> sortByDateConsumed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateConsumed', Sort.asc);
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterSortBy>
      sortByDateConsumedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateConsumed', Sort.desc);
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterSortBy> sortByImageURI() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageURI', Sort.asc);
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterSortBy> sortByImageURIDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageURI', Sort.desc);
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension MealConsumedQuerySortThenBy
    on QueryBuilder<MealConsumed, MealConsumed, QSortThenBy> {
  QueryBuilder<MealConsumed, MealConsumed, QAfterSortBy> thenByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.asc);
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterSortBy> thenByCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.desc);
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterSortBy> thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterSortBy> thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterSortBy> thenByDateConsumed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateConsumed', Sort.asc);
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterSortBy>
      thenByDateConsumedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateConsumed', Sort.desc);
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterSortBy> thenByImageURI() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageURI', Sort.asc);
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterSortBy> thenByImageURIDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageURI', Sort.desc);
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension MealConsumedQueryWhereDistinct
    on QueryBuilder<MealConsumed, MealConsumed, QDistinct> {
  QueryBuilder<MealConsumed, MealConsumed, QDistinct> distinctByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'calories');
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QDistinct> distinctByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category');
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QDistinct> distinctByDateConsumed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateConsumed');
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QDistinct> distinctByImageURI(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageURI', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MealConsumed, MealConsumed, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension MealConsumedQueryProperty
    on QueryBuilder<MealConsumed, MealConsumed, QQueryProperty> {
  QueryBuilder<MealConsumed, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MealConsumed, int, QQueryOperations> caloriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'calories');
    });
  }

  QueryBuilder<MealConsumed, MealCategory, QQueryOperations>
      categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<MealConsumed, DateTime, QQueryOperations>
      dateConsumedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateConsumed');
    });
  }

  QueryBuilder<MealConsumed, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<MealConsumed, String?, QQueryOperations> imageURIProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageURI');
    });
  }

  QueryBuilder<MealConsumed, List<Ingredient>, QQueryOperations>
      ingredientsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ingredients');
    });
  }

  QueryBuilder<MealConsumed, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealConsumed _$MealConsumedFromJson(Map<String, dynamic> json) => MealConsumed(
      name: json['name'] as String? ?? "Bacon and Eggs",
      calories: json['calories'] as int? ?? 100,
      description: json['description'] as String? ??
          "Bacon and eggs is a dish consisting of bacon and eggs.",
      imageURI: json['imageURI'] as String?,
      category: $enumDecodeNullable(_$MealCategoryEnumMap, json['category']) ??
          MealCategory.lunch,
    );

Map<String, dynamic> _$MealConsumedToJson(MealConsumed instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'imageURI': instance.imageURI,
      'calories': instance.calories,
      'category': _$MealCategoryEnumMap[instance.category]!,
    };

const _$MealCategoryEnumMap = {
  MealCategory.breakfast: 'breakfast',
  MealCategory.lunch: 'lunch',
  MealCategory.dinner: 'dinner',
  MealCategory.snack: 'snack',
};
