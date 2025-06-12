import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/data/models/favorite_sort_options.dart';
import 'package:rickandmorty/features/favorite_screen/bloc/favorite_list_bloc.dart';
import 'package:rickandmorty/theme/app_styles.dart';

class FavoriteSortDropdown extends StatefulWidget {
  const FavoriteSortDropdown({super.key});

  @override
  State<FavoriteSortDropdown> createState() => _FavoriteSortDropdownState();
}

class _FavoriteSortDropdownState extends State<FavoriteSortDropdown> {
  FavoriteSortOption? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade400),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<FavoriteSortOption>(
          isExpanded: true,
          value: _selectedOption,
          hint: const Text('Сортировать', style: AppStyles.detatilTitle),
          icon: const Icon(Icons.arrow_drop_down),
          items:
              FavoriteSortOption.values.map((option) {
                return DropdownMenuItem(
                  value: option,
                  child: Text(option.label, style: AppStyles.detatilTitle),
                );
              }).toList(),
          onChanged: (option) {
            if (option != null) {
              setState(() {
                _selectedOption = option;
              });
              context.read<FavoriteListBloc>().add(
                SortFavoriteList(option: option),
              );
            }
          },
        ),
      ),
    );
  }
}
