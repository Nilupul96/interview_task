import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_task/styles.dart';

class BuyNowTile extends StatelessWidget {
  const BuyNowTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 250.h,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          decoration: BoxDecoration(
              color: DefaultBlueColor, borderRadius: BorderRadius.circular(35)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Improved Controller\nDesign With\nVirtual Reality",
                  style: TextStyle(
                      height: 1.4,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 24.sp),
                ),
              ),
              SizedBox(height: 30.h),
              Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Buy Now!",
                        style: TextStyle(
                            color: DefaultBlueColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      )))
            ],
          ),
        ),
        Positioned(
            right: -20.w,
            top: 50.h,
            child: Center(
              child: SizedBox(
                width: 200.w,
                child: Center(
                    child: Image.network(
                        "https://i.postimg.cc/L6rzhPQj/1-Varjo-VR-3.png")),
              ),
            ))
      ],
    );
  }
}
