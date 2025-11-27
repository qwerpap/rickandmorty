enum FavoriteSortOption { nameAsc, nameDesc }

extension FavoriteSortOptionText on FavoriteSortOption {
  String get label {
    switch (this) {
      case FavoriteSortOption.nameAsc:
        return 'По имени ↑';
      case FavoriteSortOption.nameDesc:
        return 'По имени ↓';
    }
  }
}

