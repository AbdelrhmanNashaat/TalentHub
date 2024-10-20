import 'package:flutter/material.dart';
import '../../../../../constant.dart';
import 'search_bar.dart';

class CustomSearchJobWidget extends StatelessWidget {
  final VoidCallback onTap;
  final TextEditingController searchController;
  final String hintText;
  const CustomSearchJobWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.onTap,
    required this.searchController,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: SearchTextFiled(
        fillColor: Constant.circleAvatar,
        hintTextColor: Constant.searchHintTextColor,
        controller: searchController,
        hintText: hintText,
        onTap: onTap,
      ),
    );
  }
}
