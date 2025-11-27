import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/models/favorite_sort_option.dart';
import '../bloc/favorite_list_bloc.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/theme/app_strings.dart';
import '../../../../core/theme/app_colors.dart';

class FavoriteSortDropdown extends StatelessWidget {
  const FavoriteSortDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteListBloc, FavoriteListState>(
      buildWhen: (previous, current) => current is FavoriteListLoaded,
      builder: (context, state) {
        FavoriteSortOption? selectedOption;

        return DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.dropdownBackground,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(color: AppColors.dropdownBorder),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadowColor,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<FavoriteSortOption>(
                isExpanded: true,
                value: selectedOption,
                hint: const Text(AppStrings.sortLabel, style: AppStyles.detatilTitle),
                icon: const Icon(Icons.arrow_drop_down),
                items: FavoriteSortOption.values.map((option) {
                  return DropdownMenuItem(
                    value: option,
                    child: Text(option.label, style: AppStyles.detatilTitle),
                  );
                }).toList(),
                onChanged: (option) {
                  if (option != null) {
                    context.read<FavoriteListBloc>().add(
                      SortFavoriteList(option: option),
                    );
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
