import 'package:flutter/material.dart';
import 'package:sil_feed/shared/utils/text_themes.dart';

class SILSmallAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<String> tabTitles;
  final String backRoute;
  final Key backButtonKey;
  final Key tabBarKey;
  final double size;

  const SILSmallAppBar({
    Key key,
    @required this.title,
    this.tabTitles,
    this.backRoute,
    this.backButtonKey,
    this.tabBarKey,
    this.size,
  })  : assert(title != null, 'A title is required for the Appbar!'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 5,
      leading: IconButton(
          key: backButtonKey,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          }),
      centerTitle: true,
      title: Text(
        title.toUpperCase(),
        style: Theme.of(context)
            .textTheme
            .subtitle1
            .copyWith(color: Theme.of(context).backgroundColor),
      ),
      bottom: tabTitles != null && tabTitles.isNotEmpty
          ? PreferredSize(
              preferredSize: const Size.fromHeight(60.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: DefaultTabController(
                    length: tabTitles.length,
                    child: TabBar(
                      key: tabBarKey,
                      indicatorColor: Theme.of(context).backgroundColor,
                      tabs: <Tab>[
                        ...tabTitles.map(
                          (String tabTitle) => Tab(
                            child: Text(
                              tabTitle,
                              style: TextThemes.heavySize16Text(
                                  Theme.of(context).backgroundColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(size ?? 60);
}
