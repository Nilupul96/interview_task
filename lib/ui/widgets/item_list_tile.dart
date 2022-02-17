import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_task/models/product.dart';
import 'package:intl/intl.dart';

class ItemListTile extends StatefulWidget {
  final Product product;

  const ItemListTile({Key? key, required this.product}) : super(key: key);

  @override
  _ItemListTileState createState() => _ItemListTileState();
}

class _ItemListTileState extends State<ItemListTile> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // height: 200,
          width: 200.w,
          margin: EdgeInsets.only(left: 20.w),
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: Image.network(widget.product.images!)),
              SizedBox(
                height: 30.h,
              ),
              Text(
                widget.product.title!,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 18.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                widget.product.price!,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                    fontSize: 16.sp),
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                print("add item to cart");
              },
              child: Container(
                  height: 50.h,
                  width: 50.h,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(15))),
                  child: const Center(
                    child: Icon(Icons.add, color: Colors.white),
                  )),
            ))
      ],
    );
  }
}
