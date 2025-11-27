// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_database.dart';

// ignore_for_file: type=lint
class $HeroItemsTable extends HeroItems
    with TableInfo<$HeroItemsTable, HeroItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HeroItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
    'image',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _speciesMeta = const VerificationMeta(
    'species',
  );
  @override
  late final GeneratedColumn<String> species = GeneratedColumn<String>(
    'species',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
    'gender',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    image,
    name,
    status,
    species,
    gender,
    url,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hero_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<HeroItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
        _imageMeta,
        image.isAcceptableOrUnknown(data['image']!, _imageMeta),
      );
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('species')) {
      context.handle(
        _speciesMeta,
        species.isAcceptableOrUnknown(data['species']!, _speciesMeta),
      );
    } else if (isInserting) {
      context.missing(_speciesMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(
        _genderMeta,
        gender.isAcceptableOrUnknown(data['gender']!, _genderMeta),
      );
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HeroItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HeroItem(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      image:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}image'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      status:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}status'],
          )!,
      species:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}species'],
          )!,
      gender:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}gender'],
          )!,
      url:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}url'],
          )!,
    );
  }

  @override
  $HeroItemsTable createAlias(String alias) {
    return $HeroItemsTable(attachedDatabase, alias);
  }
}

class HeroItem extends DataClass implements Insertable<HeroItem> {
  final int id;
  final String image;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String url;
  const HeroItem({
    required this.id,
    required this.image,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.url,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['image'] = Variable<String>(image);
    map['name'] = Variable<String>(name);
    map['status'] = Variable<String>(status);
    map['species'] = Variable<String>(species);
    map['gender'] = Variable<String>(gender);
    map['url'] = Variable<String>(url);
    return map;
  }

  HeroItemsCompanion toCompanion(bool nullToAbsent) {
    return HeroItemsCompanion(
      id: Value(id),
      image: Value(image),
      name: Value(name),
      status: Value(status),
      species: Value(species),
      gender: Value(gender),
      url: Value(url),
    );
  }

  factory HeroItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HeroItem(
      id: serializer.fromJson<int>(json['id']),
      image: serializer.fromJson<String>(json['image']),
      name: serializer.fromJson<String>(json['name']),
      status: serializer.fromJson<String>(json['status']),
      species: serializer.fromJson<String>(json['species']),
      gender: serializer.fromJson<String>(json['gender']),
      url: serializer.fromJson<String>(json['url']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'image': serializer.toJson<String>(image),
      'name': serializer.toJson<String>(name),
      'status': serializer.toJson<String>(status),
      'species': serializer.toJson<String>(species),
      'gender': serializer.toJson<String>(gender),
      'url': serializer.toJson<String>(url),
    };
  }

  HeroItem copyWith({
    int? id,
    String? image,
    String? name,
    String? status,
    String? species,
    String? gender,
    String? url,
  }) => HeroItem(
    id: id ?? this.id,
    image: image ?? this.image,
    name: name ?? this.name,
    status: status ?? this.status,
    species: species ?? this.species,
    gender: gender ?? this.gender,
    url: url ?? this.url,
  );
  HeroItem copyWithCompanion(HeroItemsCompanion data) {
    return HeroItem(
      id: data.id.present ? data.id.value : this.id,
      image: data.image.present ? data.image.value : this.image,
      name: data.name.present ? data.name.value : this.name,
      status: data.status.present ? data.status.value : this.status,
      species: data.species.present ? data.species.value : this.species,
      gender: data.gender.present ? data.gender.value : this.gender,
      url: data.url.present ? data.url.value : this.url,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HeroItem(')
          ..write('id: $id, ')
          ..write('image: $image, ')
          ..write('name: $name, ')
          ..write('status: $status, ')
          ..write('species: $species, ')
          ..write('gender: $gender, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, image, name, status, species, gender, url);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HeroItem &&
          other.id == this.id &&
          other.image == this.image &&
          other.name == this.name &&
          other.status == this.status &&
          other.species == this.species &&
          other.gender == this.gender &&
          other.url == this.url);
}

class HeroItemsCompanion extends UpdateCompanion<HeroItem> {
  final Value<int> id;
  final Value<String> image;
  final Value<String> name;
  final Value<String> status;
  final Value<String> species;
  final Value<String> gender;
  final Value<String> url;
  const HeroItemsCompanion({
    this.id = const Value.absent(),
    this.image = const Value.absent(),
    this.name = const Value.absent(),
    this.status = const Value.absent(),
    this.species = const Value.absent(),
    this.gender = const Value.absent(),
    this.url = const Value.absent(),
  });
  HeroItemsCompanion.insert({
    this.id = const Value.absent(),
    required String image,
    required String name,
    required String status,
    required String species,
    required String gender,
    required String url,
  }) : image = Value(image),
       name = Value(name),
       status = Value(status),
       species = Value(species),
       gender = Value(gender),
       url = Value(url);
  static Insertable<HeroItem> custom({
    Expression<int>? id,
    Expression<String>? image,
    Expression<String>? name,
    Expression<String>? status,
    Expression<String>? species,
    Expression<String>? gender,
    Expression<String>? url,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (image != null) 'image': image,
      if (name != null) 'name': name,
      if (status != null) 'status': status,
      if (species != null) 'species': species,
      if (gender != null) 'gender': gender,
      if (url != null) 'url': url,
    });
  }

  HeroItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? image,
    Value<String>? name,
    Value<String>? status,
    Value<String>? species,
    Value<String>? gender,
    Value<String>? url,
  }) {
    return HeroItemsCompanion(
      id: id ?? this.id,
      image: image ?? this.image,
      name: name ?? this.name,
      status: status ?? this.status,
      species: species ?? this.species,
      gender: gender ?? this.gender,
      url: url ?? this.url,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (species.present) {
      map['species'] = Variable<String>(species.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HeroItemsCompanion(')
          ..write('id: $id, ')
          ..write('image: $image, ')
          ..write('name: $name, ')
          ..write('status: $status, ')
          ..write('species: $species, ')
          ..write('gender: $gender, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }
}

abstract class _$HeroesDatabase extends GeneratedDatabase {
  _$HeroesDatabase(QueryExecutor e) : super(e);
  $HeroesDatabaseManager get managers => $HeroesDatabaseManager(this);
  late final $HeroItemsTable heroItems = $HeroItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [heroItems];
}

typedef $$HeroItemsTableCreateCompanionBuilder =
    HeroItemsCompanion Function({
      Value<int> id,
      required String image,
      required String name,
      required String status,
      required String species,
      required String gender,
      required String url,
    });
typedef $$HeroItemsTableUpdateCompanionBuilder =
    HeroItemsCompanion Function({
      Value<int> id,
      Value<String> image,
      Value<String> name,
      Value<String> status,
      Value<String> species,
      Value<String> gender,
      Value<String> url,
    });

class $$HeroItemsTableFilterComposer
    extends Composer<_$HeroesDatabase, $HeroItemsTable> {
  $$HeroItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get species => $composableBuilder(
    column: $table.species,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );
}

class $$HeroItemsTableOrderingComposer
    extends Composer<_$HeroesDatabase, $HeroItemsTable> {
  $$HeroItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get species => $composableBuilder(
    column: $table.species,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HeroItemsTableAnnotationComposer
    extends Composer<_$HeroesDatabase, $HeroItemsTable> {
  $$HeroItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get species =>
      $composableBuilder(column: $table.species, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);
}

class $$HeroItemsTableTableManager
    extends
        RootTableManager<
          _$HeroesDatabase,
          $HeroItemsTable,
          HeroItem,
          $$HeroItemsTableFilterComposer,
          $$HeroItemsTableOrderingComposer,
          $$HeroItemsTableAnnotationComposer,
          $$HeroItemsTableCreateCompanionBuilder,
          $$HeroItemsTableUpdateCompanionBuilder,
          (
            HeroItem,
            BaseReferences<_$HeroesDatabase, $HeroItemsTable, HeroItem>,
          ),
          HeroItem,
          PrefetchHooks Function()
        > {
  $$HeroItemsTableTableManager(_$HeroesDatabase db, $HeroItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$HeroItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$HeroItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$HeroItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> image = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> species = const Value.absent(),
                Value<String> gender = const Value.absent(),
                Value<String> url = const Value.absent(),
              }) => HeroItemsCompanion(
                id: id,
                image: image,
                name: name,
                status: status,
                species: species,
                gender: gender,
                url: url,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String image,
                required String name,
                required String status,
                required String species,
                required String gender,
                required String url,
              }) => HeroItemsCompanion.insert(
                id: id,
                image: image,
                name: name,
                status: status,
                species: species,
                gender: gender,
                url: url,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$HeroItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$HeroesDatabase,
      $HeroItemsTable,
      HeroItem,
      $$HeroItemsTableFilterComposer,
      $$HeroItemsTableOrderingComposer,
      $$HeroItemsTableAnnotationComposer,
      $$HeroItemsTableCreateCompanionBuilder,
      $$HeroItemsTableUpdateCompanionBuilder,
      (HeroItem, BaseReferences<_$HeroesDatabase, $HeroItemsTable, HeroItem>),
      HeroItem,
      PrefetchHooks Function()
    >;

class $HeroesDatabaseManager {
  final _$HeroesDatabase _db;
  $HeroesDatabaseManager(this._db);
  $$HeroItemsTableTableManager get heroItems =>
      $$HeroItemsTableTableManager(_db, _db.heroItems);
}
