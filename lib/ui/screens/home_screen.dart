import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_task/api/api_provider.dart';
import 'package:interview_task/api/repository.dart';
import 'package:interview_task/models/product.dart';
import 'package:interview_task/ui/screens/item_details_screen.dart';
import 'package:interview_task/ui/widgets/buy_now_tile.dart';
import 'package:interview_task/ui/widgets/category_list_tile.dart';
import 'package:interview_task/ui/widgets/item_list_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _categoryList = [
    "All Product",
    "Popular",
    "Recent",
    "Rated"
  ];
  final List<bool> selectedCategory = [true, false, false, false];

  setSelectCategory(int index) {
    for (var i = 0; i < selectedCategory.length; i++) {
      setState(() {
        if (i == index) {
          selectedCategory[i] = true;
        } else {
          selectedCategory[i] = false;
        }
      });
    }
  }

  Repository repo = Repository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu_rounded,
              color: Colors.black,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              )),
          Stack(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shop_outlined,
                    color: Colors.black,
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
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              "Enjoy the world\ninto virtual reality",
              textAlign: TextAlign.left,
              style: TextStyle(
                  height: 1.4,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 24.sp),
            ),
          ),
          const BuyNowTile(),
          // Category list
          SizedBox(
            height: 100.h,
            child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: _categoryList.length,
                itemBuilder: (context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setSelectCategory(index);
                    },
                    child: Center(
                        child: CategoryListTile(
                      categoryName: _categoryList[index],
                      isSelected: selectedCategory[index],
                    )),
                  );
                }),
          ),
          // product list
          SizedBox(
            height: 300.h,
            child: FutureBuilder<List<Product>>(
                future: repo.getProductList(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, int index) {
                            return GestureDetector(
                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ItemDetailScreen(
                                            product: snapshot.data![index],
                                          ))),
                              child: ItemListTile(
                                product: snapshot.data![index],
                              ),
                            );
                          })
                      : const Center(
                          child: SizedBox(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator()));
                }),
          ),
          SizedBox(
            height: 30.h,
          )
        ],
      ),
    );
  }
}
