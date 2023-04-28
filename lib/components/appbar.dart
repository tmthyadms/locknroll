import 'package:flutter/material.dart';

import '../theme/utils/color_palette.dart';
import 'gaps/hgap.dart';
import 'logo.dart';

class CustomSliverAppbar extends StatefulWidget {
  const CustomSliverAppbar({super.key});

  @override
  State<CustomSliverAppbar> createState() => _CustomSliverAppbarState();
}

class _CustomSliverAppbarState extends State<CustomSliverAppbar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar.medium(
      pinned: true,
      backgroundColor: ColorPalette.background,
      flexibleSpace: FlexibleSpaceBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Logo(size: 30, color: Colors.black),
            const HGap(),
            Text('LockNRoll',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontSize: 28))
          ],
        ),
        centerTitle: true,
      ),
    );
  }
}
