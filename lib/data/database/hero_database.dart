import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
part 'hero_database.g.dart';

class HeroItems extends Table {
  IntColumn get id => integer()();
  TextColumn get image => text()();
  TextColumn get name => text()();
  TextColumn get status => text()();
  TextColumn get species => text()();
  TextColumn get gender => text()();
  TextColumn get url => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class FavoriteHeroItems extends Table {
  IntColumn get id => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [HeroItems, FavoriteHeroItems])
class HeroesDatabase extends _$HeroesDatabase {
  HeroesDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        await m.createTable(favoriteHeroItems);
      }
    },
  );

  Future<void> insertHeroes(List<HeroItemsCompanion> heroes) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(heroItems, heroes);
    });
  }

  Future<List<HeroItem>> getAllHeroes() => select(heroItems).get();

  Future<HeroItem?> getHeroById(int id) {
    return (select(heroItems)
      ..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Future<void> clearHeroes() => delete(heroItems).go();

  Future<void> addFavorite(int heroId) async {
    await into(favoriteHeroItems).insert(
      FavoriteHeroItemsCompanion.insert(id: Value(heroId)),
      mode: InsertMode.insertOrIgnore,
    );
  }

  Future<void> removeFavorite(int heroId) async {
    await (delete(favoriteHeroItems)
      ..where((tbl) => tbl.id.equals(heroId))).go();
  }

  Future<List<int>> getAllFavoriteIds() async {
    final rows = await select(favoriteHeroItems).get();
    return rows.map((row) => row.id).toList();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationSupportDirectory();
    final file = File(p.join(dbFolder.path, 'heroes.db'));
    return NativeDatabase(file);
  });
}
