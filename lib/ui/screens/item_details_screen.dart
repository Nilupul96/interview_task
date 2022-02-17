import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_task/models/product.dart';
import 'package:interview_task/styles.dart';
import 'package:interview_task/ui/widgets/item_detail_list_tile.dart';

class ItemDetailScreen extends StatefulWidget {
  final Product product;
  const ItemDetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  _ItemDetailScreenState createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: DefaultBlueColor,
      body: ListView(
        children: [
          Stack(
            children: [
              ImageSlideshow(
                width: double.infinity,
                height: 350.h,
                initialPage: 0,
                indicatorColor: Colors.white,
                indicatorBackgroundColor: Colors.grey,
                children: [
                  Container(
                    color: Colors.transparent,
                    child: Center(
                      child: Image.network(widget.product.images!,
                          fit: BoxFit.cover),
                    ),
                  )
                ],
                onPageChanged: (value) {},
                autoPlayInterval: 1000,
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.white,
                    ),
                    Stack(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.shop_outlined,
                              color: Colors.white,
                            )),
                        Positioned(
                            right: 10.w,
                            top: 10.h,
                            child: Container(
                              height: 10.h,
                              width: 10.h,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.red),
                            ))
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20.h, bottom: 30.h),
                  height: 5.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(5)),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.product.title!,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 22.sp),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    widget.product.price!,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 22.sp),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 20.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RatingBar.builder(
                        unratedColor: Colors.black.withOpacity(0.1),
                        ignoreGestures: true,
                        initialRating: widget.product.rating!,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemSize: 26,
                        itemCount: 5,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star_border_rounded,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      Text(
                        "  " + widget.product.rating!.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 16.sp),
                      ),
                      Text(
                        "(28 Reviews)",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.4),
                            fontSize: 16.sp),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.sp),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      widget.product.description!,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.4),
                          fontSize: 18.sp),
                    )),
                SizedBox(height: 18.sp),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const ItemDetailListTile(
                          title: "Improved Optics",
                          icon: Icon(
                            Icons.remove_red_eye_outlined,
                            size: 30,
                          )),
                      SizedBox(
                        width: 20.w,
                      ),
                      const ItemDetailListTile(
                          title: "Clear Brightness",
                          icon: Icon(
                            Icons.brightness_5_outlined,
                            size: 30,
                          )),
                      SizedBox(
                        width: 20.w,
                      ),
                      const ItemDetailListTile(
                          title: "Wifi Controllers",
                          icon: Icon(
                            Icons.wifi,
                            size: 30,
                          )),
                    ]),
                SizedBox(height: 20.h),
                SizedBox(
                  height: 60.h,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Checkout",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Colors.black.withOpacity(0.9),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      )),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
