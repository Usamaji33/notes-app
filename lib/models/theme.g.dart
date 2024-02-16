// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetThemeDBCollection on Isar {
  IsarCollection<ThemeDB> get themeDBs => this.collection();
}

const ThemeDBSchema = CollectionSchema(
  name: r'ThemeDB',
  id: 6813932289005519955,
  properties: {
    r'isDark': PropertySchema(
      id: 0,
      name: r'isDark',
      type: IsarType.bool,
    )
  },
  estimateSize: _themeDBEstimateSize,
  serialize: _themeDBSerialize,
  deserialize: _themeDBDeserialize,
  deserializeProp: _themeDBDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _themeDBGetId,
  getLinks: _themeDBGetLinks,
  attach: _themeDBAttach,
  version: '3.1.0+1',
);

int _themeDBEstimateSize(
  ThemeDB object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _themeDBSerialize(
  ThemeDB object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isDark);
}

ThemeDB _themeDBDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ThemeDB();
  object.id = id;
  object.isDark = reader.readBool(offsets[0]);
  return object;
}

P _themeDBDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _themeDBGetId(ThemeDB object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _themeDBGetLinks(ThemeDB object) {
  return [];
}

void _themeDBAttach(IsarCollection<dynamic> col, Id id, ThemeDB object) {
  object.id = id;
}

extension ThemeDBQueryWhereSort on QueryBuilder<ThemeDB, ThemeDB, QWhere> {
  QueryBuilder<ThemeDB, ThemeDB, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ThemeDBQueryWhere on QueryBuilder<ThemeDB, ThemeDB, QWhereClause> {
  QueryBuilder<ThemeDB, ThemeDB, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ThemeDB, ThemeDB, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<ThemeDB, ThemeDB, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ThemeDB, ThemeDB, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ThemeDB, ThemeDB, QAfterWhereClause> idBetween(
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
}

extension ThemeDBQueryFilter
    on QueryBuilder<ThemeDB, ThemeDB, QFilterCondition> {
  QueryBuilder<ThemeDB, ThemeDB, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ThemeDB, ThemeDB, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ThemeDB, ThemeDB, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ThemeDB, ThemeDB, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ThemeDB, ThemeDB, QAfterFilterCondition> isDarkEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDark',
        value: value,
      ));
    });
  }
}

extension ThemeDBQueryObject
    on QueryBuilder<ThemeDB, ThemeDB, QFilterCondition> {}

extension ThemeDBQueryLinks
    on QueryBuilder<ThemeDB, ThemeDB, QFilterCondition> {}

extension ThemeDBQuerySortBy on QueryBuilder<ThemeDB, ThemeDB, QSortBy> {
  QueryBuilder<ThemeDB, ThemeDB, QAfterSortBy> sortByIsDark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDark', Sort.asc);
    });
  }

  QueryBuilder<ThemeDB, ThemeDB, QAfterSortBy> sortByIsDarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDark', Sort.desc);
    });
  }
}

extension ThemeDBQuerySortThenBy
    on QueryBuilder<ThemeDB, ThemeDB, QSortThenBy> {
  QueryBuilder<ThemeDB, ThemeDB, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ThemeDB, ThemeDB, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ThemeDB, ThemeDB, QAfterSortBy> thenByIsDark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDark', Sort.asc);
    });
  }

  QueryBuilder<ThemeDB, ThemeDB, QAfterSortBy> thenByIsDarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDark', Sort.desc);
    });
  }
}

extension ThemeDBQueryWhereDistinct
    on QueryBuilder<ThemeDB, ThemeDB, QDistinct> {
  QueryBuilder<ThemeDB, ThemeDB, QDistinct> distinctByIsDark() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDark');
    });
  }
}

extension ThemeDBQueryProperty
    on QueryBuilder<ThemeDB, ThemeDB, QQueryProperty> {
  QueryBuilder<ThemeDB, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ThemeDB, bool, QQueryOperations> isDarkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDark');
    });
  }
}
