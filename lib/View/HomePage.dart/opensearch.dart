import 'package:e_commercehybrid/ViewModel/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_commercehybrid/ViewModel/searchbar_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Opensearch extends ConsumerWidget {
  Opensearch({super.key});

  final currentIndex = StateProvider<int>((ref) => 0);
  final selectnavIndex = StateProvider<int>((ref) => 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController searchcontroller = TextEditingController();
    final searchItems = ref.watch(searchbarProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 2)],
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 25.h),
                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(
                        horizontal: 10.w,
                        vertical: 25.h,
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onPressed: () {
                              context.pop();
                            },
                            icon: Icon(Icons.arrow_back_ios_new, size: 18.sp),
                          ),

                          Flexible(
                            child: Container(
                              height: 45.h,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ...searchItems.map(
                                            (search) => Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 5.w,
                                                vertical: 6.h,
                                              ),
                                              alignment: Alignment.center,
                                              color: const Color.fromARGB(
                                                0,
                                                201,
                                                133,
                                                133,
                                              ),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Transform.translate(
                                                    offset: Offset(0, 0),
                                                    child: Text(
                                                      search,
                                                      style: TextStyle(
                                                        fontSize: 17.sp,
                                                        color: Colors
                                                            .blue
                                                            .shade400,
                                                      ),
                                                    ),
                                                  ),

                                                  SizedBox(width: 6.w),

                                                  GestureDetector(
                                                    onTap: () {
                                                      ref
                                                          .read(
                                                            searchbarProvider
                                                                .notifier,
                                                          )
                                                          .removeSearch(search);
                                                    },
                                                    child: Icon(
                                                      Icons.close,
                                                      size: 17.sp,
                                                      color:
                                                          Colors.blue.shade400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),

                                          // then the editable input
                                          ConstrainedBox(
                                            constraints: BoxConstraints(
                                              minWidth: 100.w,
                                              maxWidth: 235.w,
                                            ),
                                            child: TextField(
                                              controller: searchcontroller,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsetsGeometry.symmetric(
                                                      vertical: 7.h,
                                                      horizontal: 10.w,
                                                    ),
                                                border: InputBorder.none,
                                                hintText: "Search...",
                                                isDense: true,
                                              ),
                                              onSubmitted: (value) {
                                                if (value.isNotEmpty) {
                                                  ref
                                                      .read(
                                                        searchbarProvider
                                                            .notifier,
                                                      )
                                                      .addSearch(value);
                                                  searchcontroller.clear();
                                                }
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.camera_alt_outlined,
                                      size: 22.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          IconButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onPressed: () {},
                            icon: Icon(Icons.filter_list_rounded, size: 30.sp),
                          ),
                        ],
                      ),
                    ),

                    searchItems.isEmpty
                        ? _buildShowRecommendation(context, ref)
                        : _buildShowsSearchProduct(context, ref),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildShowRecommendation(BuildContext context, WidgetRef ref) {
  final selectreco = StateProvider<int>((ref) => -1);

  final List<String> reco = [
    "Skirt",
    "Accessories",
    "Black T-Shirt",
    "Jeans",
    "White Shoes",
  ];

  final List<Map<String, dynamic>> discovers = [
    {
      "img": 'assets/sampleitem2.jpeg',
      "details": 'Lorem ipsum dolor sit amet consectetur.',
      "Price": '\$125,00',
    },
    {
      "img": 'assets/sampleitem3.jpeg',
      "details": 'Lorem ipsum dolor sit amet consectetur.',
      "Price": '\$125,00',
    },
    {
      "img": 'assets/sampleitem4.jpg',
      "details": 'Lorem ipsum dolor sit amet consectetur.',
      "Price": '\$125,00',
    },
    {
      "img": 'assets/sampleitem5.jpg',
      "details": 'Lorem ipsum dolor sit amet consectetur.',
      "Price": '\$125,00',
    },
    {
      "img": 'assets/sampleitem4.jpg',
      "details": 'Lorem ipsum dolor sit amet consectetur.',
      "Price": '\$125,00',
    },
    {
      "img": 'assets/sampleitem5.jpg',
      "details": 'Lorem ipsum dolor sit amet consectetur.',
      "Price": '\$125,00',
    },
  ];

  final mediumPhone = MediaQuery.of(context).size.height < 750;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Text(
          'Recommendations',
          style: TextStyle(
            fontFamily: 'RalewayRegular',
            fontSize: 18.sp,
            color: Colors.black,
          ),
        ),
      ),

      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Wrap(
          spacing: 5,
          runSpacing: 10,
          children: reco.asMap().entries.map((entry) {
            int index = entry.key;
            String items = entry.value;
            final selectedreco = ref.watch(selectreco) == index;
            return GestureDetector(
              onTap: () {
                final currentselected = ref.read(selectreco);
                ref.read(selectreco.notifier).state = currentselected == index
                    ? -1
                    : index;
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: selectedreco
                      ? Color(0xFF9775FA)
                      : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8.r),
                ),

                child: Text(
                  items,
                  style: TextStyle(
                    fontFamily: 'RalewayRegular',
                    fontSize: 17.sp,
                    color: selectedreco ? Colors.white : Colors.black,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),

      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Text(
          'Discover',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 21.sp,
            color: Colors.black,
          ),
        ),
      ),

      GridView.builder(
        itemCount: discovers.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          childAspectRatio: mediumPhone ? 0.95 : 0.85,
        ),
        itemBuilder: (context, index) {
          final discoverItem = discovers[index];
          return GestureDetector(
            onTap: () {},
            child: Column(
              children: [
                Container(
                  height: 140.h,
                  width: 160.w,
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 2),
                    ],
                  ),

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.asset(discoverItem['img'], fit: BoxFit.cover),
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 15.w, top: 5.h),
                      child: SizedBox(
                        width: 130.w,
                        child: Text(
                          discoverItem['details'],
                          style: TextStyle(
                            fontFamily: 'RalewayRegular',
                            fontSize: 12.sp,
                            color: Colors.black,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),

                    Text(
                      discoverItem['Price'],
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 17.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    ],
  );
}

Widget _buildShowsSearchProduct(BuildContext context, WidgetRef ref) {
  final searchItems = ref.watch(searchbarProvider);
  final filtered = ref
      .read(productsProvider.notifier)
      .filterProducts(searchItems);

  if (filtered.isEmpty) {
    return Center(child: Text('No product Available'));
  }

  return GridView.builder(
    itemCount: filtered.length,
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      childAspectRatio: 0.80,
    ),
    itemBuilder: (context, index) {
      final product = filtered[index];
      return Column(
        children: [
          SizedBox(height: 15.h),
          Container(
            height: 140.h,
            width: 160.w,
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [BoxShadow(blurRadius: 2, color: Colors.black12)],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.asset(product.image[0], fit: BoxFit.cover),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(height: 5.h),

              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: SizedBox(
                    width: 135.w,
                    child: Text(
                      product.title,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.black,
                        fontFamily: 'RalewayRegular',
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 5.h),

              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  product.price,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black,
                    fontFamily: 'Raleway',
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
