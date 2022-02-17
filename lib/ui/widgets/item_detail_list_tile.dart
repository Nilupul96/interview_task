import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemDetailListTile extends StatelessWidget {
  final String title;
  final Icon icon;
  const ItemDetailListTile({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 90) / 3,
      child: Column(
        children: [
          Container(
            width: (MediaQuery.of(context).size.width - 200) / 3,
            height: (MediaQuery.of(context).size.width - 200) / 3,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border:
                    Border.all(width: 3, color: Colors.black.withOpacity(0.1))),
            child: Center(child: icon),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.5),
                fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
