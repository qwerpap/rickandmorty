import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
part 'favorite_database.g.dart';

class FavoriteHeroItems extends Table {
  IntColumn get id => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [FavoriteHeroItems])
class FavoriteDatabase extends _$FavoriteDatabase {
  FavoriteDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
  );

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

  Future<bool> isFavorite(int heroId) async {
    final favorite = await (select(favoriteHeroItems)
      ..where((tbl) => tbl.id.equals(heroId))).getSingleOrNull();
    return favorite != null;
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationSupportDirectory();
    final file = File(p.join(dbFolder.path, 'favorites.db'));
    return NativeDatabase(file);
  });
}

