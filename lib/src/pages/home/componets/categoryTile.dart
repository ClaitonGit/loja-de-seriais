import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({Key? key,
    required this.category,
    required this.isSelection,
    required this.onPressed,
  }): super (key: key);

  final String category;
  final bool isSelection;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isSelection ? Color.fromRGBO(0, 46, 86, 100) : Colors.transparent,
          ),
          child: Text(category,
            style: TextStyle(
              color: isSelection ? Colors.white : Colors.black,
              fontSize: isSelection ?  16 : 14,
              fontWeight: FontWeight.bold,

            ) ,),
        ),
      ),
    );
  }
}
