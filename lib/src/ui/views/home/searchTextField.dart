import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/src/infrastructure/infrastructure.dart';
import 'package:weather_app/src/ui/ui.dart';

typedef OnPressCity = void Function(String? city);

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, required this.onTap});
  final OnPressCity onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: DropdownSearch<String>(
        key: GlobalKey(),
        popupProps: PopupProps.bottomSheet(
          bottomSheetProps: const BottomSheetProps(elevation: 10, clipBehavior: Clip.none, shape: Border()),
          showSelectedItems: true,
          showSearchBox: true,
          itemBuilder: (context, item, isSelected) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                item,
                style: AppTheme.to.textStyles!.bodyBold,
              ),
            );
          },
        ),
        items: Constants.cities,
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            hintText: 'search_city'.tr,
          ),
        ),
        onChanged: (value) {
          onTap.call(value);
        },
      ),
    );
  }
}
