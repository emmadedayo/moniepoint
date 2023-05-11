import 'package:flutter/material.dart';
import 'package:ui/contant/app_colors.dart';
import 'package:ui/view/home/components/advert_carosel.dart';
import 'package:ui/view/home/components/categories.dart';
import 'package:ui/view/home/components/home_header.dart';
import 'package:ui/view/home/components/sliver_delegate.dart';

import '../../utils/size_config.dart';
import 'components/product_grid.dart';
import 'components/product_row.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          scrolledUnderElevation: 3,
          expandedHeight: 280,
          toolbarHeight: kToolbarHeight + 35,
          elevation: 0.0,
          pinned: true,
          forceElevated: innerBoxIsScrolled,
          backgroundColor: AppColors.white,
          title: const HomeHeader(),
          flexibleSpace: const FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            background: AdvertCarousel(),
          ),
        ),
        const SliverPersistentHeader(
          delegate: SliverAppBarDelegate(PreferredSize(
              preferredSize: Size.fromHeight(120),
              child: CategoriesWidget())),
        ),
        SliverAppBar(
          pinned: true,
          primary: false,
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          toolbarHeight: 70,
          centerTitle: false,
          title: const ProductRow(),
        ),
      ],
      // The content of the scroll view
      body: const ProductGrid(),
    );
  }
}
