import 'package:e_commercehybrid/Model/selectproduct_model.dart';
import 'package:e_commercehybrid/ViewModel/product_view_model.dart';
import 'package:e_commercehybrid/ViewModel/recentlyview_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_commercehybrid/ViewModel/searchbar_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class Opensearch extends ConsumerWidget {
  Opensearch({super.key});

  final currentIndex = StateProvider<int>((ref) => 0);
  final selectnavIndex = StateProvider<int>((ref) => 0);
  final openfilter = StateProvider<bool>((ref) => false);

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
                                                    offset: Offset(0, -2),
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

                                                  ref
                                                      .read(
                                                        searchHistoryProvider
                                                            .notifier,
                                                      )
                                                      .addSearchHistory(value);
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

                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                isDismissible: false,
                                enableDrag: false,
                                builder: (context) {
                                  return _buildShowCategories(context, ref);
                                },
                              );
                            },
                            child: Container(
                              height: 25.h,
                              width: 25.w,
                              margin: EdgeInsets.only(left: 5.w),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/iconfilter.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
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
  final searchHistory = ref.watch(searchHistoryProvider);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      searchHistory.isNotEmpty
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    'Search History',
                    style: TextStyle(
                      fontFamily: 'RalewayRegular',
                      fontSize: 18.sp,
                      color: Colors.black,
                    ),
                  ),
                ),

                IconButton(
                  onPressed: () {
                    ref.read(searchHistoryProvider.notifier).clearHistory();
                  },
                  icon: Icon(
                    Icons.delete_forever_outlined,
                    size: 25.sp,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            )
          : SizedBox.shrink(),

      searchHistory.isNotEmpty
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Wrap(
                spacing: 5,
                runSpacing: 10,
                children: searchHistory.asMap().entries.map((entry) {
                  String items = entry.value;

                  return GestureDetector(
                    onTap: () {
                      ref.read(searchbarProvider.notifier).addSearch(items);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8.r),
                      ),

                      child: Text(
                        items,
                        style: TextStyle(
                          fontFamily: 'RalewayRegular',
                          fontSize: 17.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            )
          : SizedBox.shrink(),

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
            String items = entry.value;

            return GestureDetector(
              onTap: () {
                ref.read(searchbarProvider.notifier).addSearch(items);
                ref
                    .read(searchHistoryProvider.notifier)
                    .addSearchHistory(items);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8.r),
                ),

                child: Text(
                  items,
                  style: TextStyle(
                    fontFamily: 'RalewayRegular',
                    fontSize: 17.sp,
                    color: Colors.black,
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

  final mediumPhone = MediaQuery.of(context).size.height < 750;

  final List<Map<String, dynamic>> circleimg = [
    {
      "img": 'assets/sampleitem2.jpeg',
      "details": 'jacket',
      "Price": '\$125,00',
    },
    {
      "img": 'assets/sampleitem3.jpeg',
      "details": 'jacket',
      "Price": '\$125,00',
    },
    {"img": 'assets/sampleitem4.jpg', "details": 'jacket', "Price": '\$125,00'},
    {"img": 'assets/sampleitem5.jpg', "details": 'jacket', "Price": '\$125,00'},
    {"img": 'assets/sampleitem4.jpg', "details": 'jacket', "Price": '\$125,00'},
    {"img": 'assets/sampleitem5.jpg', "details": 'jacket', "Price": '\$125,00'},

    {"img": 'assets/sampleitem4.jpg', "details": 'jacket', "Price": '\$125,00'},
    {"img": 'assets/sampleitem5.jpg', "details": 'jacket', "Price": '\$125,00'},
    {"img": 'assets/sampleitem4.jpg', "details": 'jacket', "Price": '\$125,00'},
    {"img": 'assets/sampleitem5.jpg', "details": 'jacket', "Price": '\$125,00'},
  ];

  return Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: GridView.builder(
          itemCount: circleimg.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final featurelist = circleimg[index];
            return Column(
              children: [
                Shimmer(
                  duration: Duration(milliseconds: 1500),
                  interval: Duration(seconds: 0),
                  color: Colors.white,
                  enabled: true,
                  direction: ShimmerDirection.fromLTRB(),
                  colorOpacity: 0.3,
                  child: Container(
                    height: 50.w,
                    width: 50.w,
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 2),
                      ],
                    ),

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(500.r),
                      child: Image.asset(featurelist['img'], fit: BoxFit.cover),
                    ),
                  ),
                ),
                SizedBox(height: 5.h),

                Shimmer(
                  duration: Duration(milliseconds: 1500),
                  interval: Duration(seconds: 0),
                  color: Colors.grey.shade100,
                  enabled: true,
                  direction: ShimmerDirection.fromLTRB(),
                  colorOpacity: 0.3,
                  child: Center(
                    child: Text(
                      featurelist['details'],
                      style: TextStyle(
                        fontFamily: 'RalewayRegular',
                        fontSize: 12.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),

      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'All Items',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 20.sp,
                color: Colors.black,
              ),
            ),

            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  isDismissible: false,
                  enableDrag: false,
                  context: context,
                  builder: (context) => _buildGeneralFilter(context, ref),
                );
              },
              child: Container(
                height: 25.h,
                width: 25.w,
                margin: EdgeInsets.only(left: 5.w),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/iconfilter.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      GridView.builder(
        itemCount: filtered.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          childAspectRatio: mediumPhone ? 0.9 : 0.77,
        ),
        itemBuilder: (context, index) {
          final product = filtered[index];
          return GestureDetector(
            onTap: () {
              ref
                  .read(selectedproductProvider.notifier)
                  .state = SelectproductModel(
                id: product.id,
                mainimage: product.image[0],
                image: product.image,
                subimage: product.subimage,
                title: product.title,
                price: product.price,
                material: product.material,
                origin: product.origin,
                size: product.size,
                color: product.color,
              );

              ref.read(recentlyviewProvider.notifier).addtoViewed(product);
              context.push('/chooseproduct');
            },
            child: Column(
              children: [
                SizedBox(height: 15.h),
                Shimmer(
                  duration: Duration(milliseconds: 1500),
                  interval: Duration(seconds: 0),
                  color: Colors.white,
                  enabled: true,
                  direction: ShimmerDirection.fromLTRB(),
                  colorOpacity: 0.3,
                  child: Container(
                    height: 140.h,
                    width: 160.w,
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(blurRadius: 2, color: Colors.black12),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.asset(product.image[0], fit: BoxFit.cover),
                    ),
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5.h),

                    Shimmer(
                      duration: Duration(milliseconds: 1500),
                      interval: Duration(seconds: 0),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      enabled: true,
                      direction: ShimmerDirection.fromLTRB(),
                      colorOpacity: 0.3,
                      child: Container(
                        width: 150.w,
                        color: Colors.white,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 0.w),
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
                    ),

                    SizedBox(height: 5.h),

                    Shimmer(
                      duration: Duration(milliseconds: 1500),
                      interval: Duration(seconds: 0),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      enabled: true,
                      direction: ShimmerDirection.fromLTRB(),
                      colorOpacity: 0.3,
                      child: Padding(
                        padding: EdgeInsets.only(left: 0.w),
                        child: Text(
                          product.price,
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.black,
                            fontFamily: 'Raleway',
                          ),
                        ),
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

final selected = StateProvider<String>((ref) => "All");
final expandedtile = StateProvider<int?>((ref) => null);
Widget _buildShowCategories(BuildContext context, WidgetRef ref) {
  final List<Map<String, dynamic>> list = [
    {
      "title": 'Clothing',
      "img": 'assets/sampleitem4.jpg',
      "choices": ["Dresses", "Pants", "Slippers", "T-Shirt"],
    },

    {
      "title": 'Clothing',
      "img": 'assets/sampleitem4.jpg',
      "choices": ["Dresses", "Pants", "Slippers", "T-Shirt"],
    },

    {
      "title": 'Clothing',
      "img": 'assets/sampleitem4.jpg',
      "choices": ["Dresses", "Pants", "Slippers", "T-Shirt"],
    },

    {
      "title": 'Clothing',
      "img": 'assets/sampleitem4.jpg',
      "choices": ["Dresses", "Pants", "Slippers", "T-Shirt"],
    },
  ];

  return Consumer(
    builder: (context, ref, child) {
      final options = ["All", "Male", "Female"];
      final alreadyselect = ref.watch(selected);
      final expandedIndex = ref.watch(expandedtile);
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: 25.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.w),
                      child: Text(
                        'All Categories',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          color: Colors.black,
                          fontSize: 28.sp,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(right: 2.w),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        onPressed: () {
                          context.pop();
                        },
                        icon: Icon(
                          Icons.clear,
                          size: 20.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: options.map((item) {
                    final isSelected = alreadyselect == item;
                    return ChoiceChip(
                      label: Text(item),
                      selected: isSelected,
                      showCheckmark: false,
                      selectedColor: Colors.blue.shade50,
                      backgroundColor: Colors.white,
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.blue : Colors.black,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        side: BorderSide(
                          color: isSelected ? Colors.blue : Colors.transparent,
                        ),
                      ),

                      onSelected: (_) {
                        ref.read(selected.notifier).state = item;
                      },
                    );
                  }).toList(),
                ),

                SizedBox(height: 15.h),

                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final item = list[index];
                    final selectedTile = expandedIndex == index;
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 5.h,
                            horizontal: 15.w,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 3.w,
                            vertical: 3.h,
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 2),
                            ],
                          ),

                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Image.asset(
                                item['img'],
                                width: 60.w,
                                fit: BoxFit.cover,
                              ),
                            ),

                            title: Text(
                              item['title'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),

                            trailing: Icon(
                              selectedTile
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                            ),

                            onTap: () {
                              ref.read(expandedtile.notifier).state =
                                  selectedTile ? null : index;
                            },
                          ),
                        ),

                        AnimatedCrossFade(
                          firstChild: SizedBox.shrink(),
                          secondChild: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.w,
                              vertical: 10.h,
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                  ),
                                  child: GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: list.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 10,
                                          crossAxisSpacing: 10,
                                          childAspectRatio: 3,
                                        ),
                                    itemBuilder: (context, index) {
                                      final choice = list[index];
                                      final thechoice =
                                          choice['choices'] as List<String>;
                                      return Container(
                                        height: 50.h,
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            7.r,
                                          ),
                                          color: Colors.transparent,
                                          border: Border.all(
                                            color: const Color(0xFFFF9F9F),
                                            width: 2.w,
                                          ),
                                        ),
                                        child: Text(thechoice[index]),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),

                          crossFadeState: selectedTile
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                          duration: Duration(milliseconds: 300),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

Widget _buildGeneralFilter(BuildContext context, WidgetRef ref) {
  final List<Map<String, dynamic>> circleimg = [
    {
      "img": 'assets/sampleitem2.jpeg',
      "details": 'jacket',
      "Price": '\$125,00',
    },
    {
      "img": 'assets/sampleitem3.jpeg',
      "details": 'jacket',
      "Price": '\$125,00',
    },
    {"img": 'assets/sampleitem4.jpg', "details": 'jacket', "Price": '\$125,00'},
    {"img": 'assets/sampleitem5.jpg', "details": 'jacket', "Price": '\$125,00'},
    {"img": 'assets/sampleitem4.jpg', "details": 'jacket', "Price": '\$125,00'},
    {"img": 'assets/sampleitem5.jpg', "details": 'jacket', "Price": '\$125,00'},

    {"img": 'assets/sampleitem4.jpg', "details": 'jacket', "Price": '\$125,00'},
    {"img": 'assets/sampleitem5.jpg', "details": 'jacket', "Price": '\$125,00'},
    {"img": 'assets/sampleitem4.jpg', "details": 'jacket', "Price": '\$125,00'},
    {"img": 'assets/sampleitem5.jpg', "details": 'jacket', "Price": '\$125,00'},
  ];

  final size = ["XS", "XS", "XS", "XS", "XS", "XS"];
  return Consumer(
    builder: (context, ref, child) {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white),

        child: Column(
          children: [
            SizedBox(height: 25.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Text(
                    'Filter',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      color: Colors.black,
                      fontSize: 28.sp,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(right: 2.w),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(Icons.clear, size: 20.sp, color: Colors.black),
                  ),
                ),
              ],
            ),

            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: GridView.builder(
                itemCount: circleimg.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final featurelist = circleimg[index];
                  return Column(
                    children: [
                      Shimmer(
                        duration: Duration(milliseconds: 1500),
                        interval: Duration(seconds: 0),
                        color: Colors.white,
                        enabled: true,
                        direction: ShimmerDirection.fromLTRB(),
                        colorOpacity: 0.3,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 50.w,
                              width: 50.w,
                              padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 2,
                                  ),
                                ],
                              ),

                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(500.r),
                                child: Image.asset(
                                  featurelist['img'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            Positioned(
                              top: -5.h,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.all(1.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 3,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),

                                child: Icon(
                                  Icons.check_circle,
                                  color: Colors.blueAccent,
                                  size: 20.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),

                      Shimmer(
                        duration: Duration(milliseconds: 1500),
                        interval: Duration(seconds: 0),
                        color: Colors.grey.shade100,
                        enabled: true,
                        direction: ShimmerDirection.fromLTRB(),
                        colorOpacity: 0.3,
                        child: Center(
                          child: Text(
                            featurelist['details'],
                            style: TextStyle(
                              fontFamily: 'RalewayRegular',
                              fontSize: 12.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Size',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 20.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  Container(
                    height: 30.h,
                    width: 70.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 241, 193, 193),
                      borderRadius: BorderRadius.circular(3.r),
                    ),

                    child: Text(
                      'Clothes',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),

                  SizedBox(width: 15.w),
                  Container(
                    height: 30.h,
                    width: 70.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 241, 193, 193),
                      borderRadius: BorderRadius.circular(3.r),
                    ),

                    child: Text(
                      'Shoes',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
              child: Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 189, 227, 245),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: size
                      .map(
                        (s) => Text(
                          s,
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: const Color.fromARGB(255, 145, 210, 240),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
