import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_task/styles.dart';

class CategoryListTile extends StatefulWidget {
  final String categoryName;
  final bool isSelected;
  const CategoryListTile(
      {Key? key, required this.categoryName, required this.isSelected})
      : super(key: key);

  @override
  _CategoryListTileState createState() => _CategoryListTileState();
}

class _CategoryListTileState extends State<CategoryListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.w),
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
          color: widget.isSelected
              ? DefaultBlueColor
              : Colors.black.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15)),
      child: Text(
        widget.categoryName,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            color: widget.isSelected ? Colors.white : Colors.black,
            fontSize: 18.sp),
      ),
    );
  }
}
