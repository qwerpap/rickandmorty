// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_database.dart';

// ignore_for_file: type=lint
class $FavoriteHeroItemsTable extends FavoriteHeroItems
    with TableInfo<$FavoriteHeroItemsTable, FavoriteHeroItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteHeroItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_hero_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<FavoriteHeroItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteHeroItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteHeroItem(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
    );
  }

  @override
  $FavoriteHeroItemsTable createAlias(String alias) {
    return $FavoriteHeroItemsTable(attachedDatabase, alias);
  }
}

class FavoriteHeroItem extends DataClass
    implements Insertable<FavoriteHeroItem> {
  final int id;
  const FavoriteHeroItem({required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    return map;
  }

  FavoriteHeroItemsCompanion toCompanion(bool nullToAbsent) {
    return FavoriteHeroItemsCompanion(id: Value(id));
  }

  factory FavoriteHeroItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteHeroItem(id: serializer.fromJson<int>(json['id']));
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'id': serializer.toJson<int>(id)};
  }

  FavoriteHeroItem copyWith({int? id}) => FavoriteHeroItem(id: id ?? this.id);
  FavoriteHeroItem copyWithCompanion(FavoriteHeroItemsCompanion data) {
    return FavoriteHeroItem(id: data.id.present ? data.id.value : this.id);
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteHeroItem(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => id.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteHeroItem && other.id == this.id);
}

class FavoriteHeroItemsCompanion extends UpdateCompanion<FavoriteHeroItem> {
  final Value<int> id;
  const FavoriteHeroItemsCompanion({this.id = const Value.absent()});
  FavoriteHeroItemsCompanion.insert({this.id = const Value.absent()});
  static Insertable<FavoriteHeroItem> custom({Expression<int>? id}) {
    return RawValuesInsertable({if (id != null) 'id': id});
  }

  FavoriteHeroItemsCompanion copyWith({Value<int>? id}) {
    return FavoriteHeroItemsCompanion(id: id ?? this.id);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteHeroItemsCompanion(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

abstract class _$FavoriteDatabase extends GeneratedDatabase {
  _$FavoriteDatabase(QueryExecutor e) : super(e);
  $FavoriteDatabaseManager get managers => $FavoriteDatabaseManager(this);
  late final $FavoriteHeroItemsTable favoriteHeroItems =
      $FavoriteHeroItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favoriteHeroItems];
}

typedef $$FavoriteHeroItemsTableCreateCompanionBuilder =
    FavoriteHeroItemsCompanion Function({Value<int> id});
typedef $$FavoriteHeroItemsTableUpdateCompanionBuilder =
    FavoriteHeroItemsCompanion Function({Value<int> id});

class $$FavoriteHeroItemsTableFilterComposer
    extends Composer<_$FavoriteDatabase, $FavoriteHeroItemsTable> {
  $$FavoriteHeroItemsTableFilterComposer({
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
}

class $$FavoriteHeroItemsTableOrderingComposer
    extends Composer<_$FavoriteDatabase, $FavoriteHeroItemsTable> {
  $$FavoriteHeroItemsTableOrderingComposer({
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
}

class $$FavoriteHeroItemsTableAnnotationComposer
    extends Composer<_$FavoriteDatabase, $FavoriteHeroItemsTable> {
  $$FavoriteHeroItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);
}

class $$FavoriteHeroItemsTableTableManager
    extends
        RootTableManager<
          _$FavoriteDatabase,
          $FavoriteHeroItemsTable,
          FavoriteHeroItem,
          $$FavoriteHeroItemsTableFilterComposer,
          $$FavoriteHeroItemsTableOrderingComposer,
          $$FavoriteHeroItemsTableAnnotationComposer,
          $$FavoriteHeroItemsTableCreateCompanionBuilder,
          $$FavoriteHeroItemsTableUpdateCompanionBuilder,
          (
            FavoriteHeroItem,
            BaseReferences<
              _$FavoriteDatabase,
              $FavoriteHeroItemsTable,
              FavoriteHeroItem
            >,
          ),
          FavoriteHeroItem,
          PrefetchHooks Function()
        > {
  $$FavoriteHeroItemsTableTableManager(
    _$FavoriteDatabase db,
    $FavoriteHeroItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$FavoriteHeroItemsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$FavoriteHeroItemsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$FavoriteHeroItemsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({Value<int> id = const Value.absent()}) =>
                  FavoriteHeroItemsCompanion(id: id),
          createCompanionCallback:
              ({Value<int> id = const Value.absent()}) =>
                  FavoriteHeroItemsCompanion.insert(id: id),
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

typedef $$FavoriteHeroItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$FavoriteDatabase,
      $FavoriteHeroItemsTable,
      FavoriteHeroItem,
      $$FavoriteHeroItemsTableFilterComposer,
      $$FavoriteHeroItemsTableOrderingComposer,
      $$FavoriteHeroItemsTableAnnotationComposer,
      $$FavoriteHeroItemsTableCreateCompanionBuilder,
      $$FavoriteHeroItemsTableUpdateCompanionBuilder,
      (
        FavoriteHeroItem,
        BaseReferences<
          _$FavoriteDatabase,
          $FavoriteHeroItemsTable,
          FavoriteHeroItem
        >,
      ),
      FavoriteHeroItem,
      PrefetchHooks Function()
    >;

class $FavoriteDatabaseManager {
  final _$FavoriteDatabase _db;
  $FavoriteDatabaseManager(this._db);
  $$FavoriteHeroItemsTableTableManager get favoriteHeroItems =>
      $$FavoriteHeroItemsTableTableManager(_db, _db.favoriteHeroItems);
}
