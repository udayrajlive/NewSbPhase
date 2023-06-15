import 'package:flutter/material.dart';
import 'package:sb/Components/poppintext.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({Key? key,
    required this.GymCategory,

  }) : super(key: key);

  final String GymCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 12,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:  BorderRadius.all(Radius.circular(16)),
      ),
      child: Center(child: PoppinText(text: GymCategory, fontWeight:FontWeight.bold, fontsize: 8,))
    );
  }
}
