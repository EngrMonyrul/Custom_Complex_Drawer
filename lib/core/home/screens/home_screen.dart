import 'dart:async';
import 'package:complex_drawer/common/extensions/context_ext.dart';
import 'package:complex_drawer/common/extensions/date_time_ext.dart';
import 'package:complex_drawer/utils/constants/const_components.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../models/drawer_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  Timer? _timer;
  String _currentTime = "";
  int _selectedItem = -1;
  bool _isExpanded = false;

  void setTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now().timeFormat();
      });
    });
  }

  @override
  void initState() {
    setTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = context.screenSize;
    final theme = context.theme;
    return Scaffold(
      key: _globalKey,
      drawer: Container(
        margin: const EdgeInsets.only(
          left: 15,
          top: 40,
          bottom: 80,
        ),
        color: Colors.transparent,
        child: Row(
          children: [
            _isExpanded
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 220,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.secondary,
                      ),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isExpanded = !_isExpanded;
                              });
                            },
                            child: Row(
                              children: [
                                FlutterIconButton(),
                                const SizedBox(width: 5),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Management"),
                                    Text(
                                      "Best Every Management System",
                                      style: theme.textTheme.labelSmall
                                          ?.copyWith(fontSize: 8),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: ConstComponents.drawerItems.length,
                              itemBuilder: (context, index) {
                                final item = ConstComponents.drawerItems[index];
                                final selected = _selectedItem == index;
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: ExpansionTile(
                                      leading: Icon(item.icon),
                                      textColor: theme.colorScheme.primary,
                                      shape:
                                          Border.all(color: Colors.transparent),
                                      backgroundColor:
                                          theme.colorScheme.onTertiary,
                                      childrenPadding:
                                          const EdgeInsets.only(bottom: 10),
                                      trailing: item.subMenu!.isEmpty
                                          ? const SizedBox()
                                          : selected
                                              ? const Icon(Icons
                                                  .keyboard_arrow_up_rounded)
                                              : const Icon(Icons
                                                  .keyboard_arrow_down_rounded),
                                      title: Text(item.title ?? ""),
                                      children: item.subMenu!.map((item) {
                                        return InkWell(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(item),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          ListTile(
                            leading: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                  image: NetworkImage(
                                    "https://as2.ftcdn.net/v2/jpg/03/13/81/05/1000_F_313810585_svtBOaaeybRPqxmbXf3IjT1K1ker1Wwk.jpg",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Emily Rival"),
                                Text(
                                  "Software Engineer",
                                  style: theme.textTheme.labelSmall
                                      ?.copyWith(fontSize: 8),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 80,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          FlutterIconButton(
                            onPressed: () {
                              setState(() {
                                _isExpanded = !_isExpanded;
                              });
                            },
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: ConstComponents.drawerItems.length,
                              itemBuilder: (context, index) {
                                final item = ConstComponents.drawerItems[index];
                                final selected = _selectedItem == index;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedItem = index;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 22),
                                    child: Icon(
                                      item.icon,
                                      color: selected
                                          ? theme.colorScheme.primary
                                          : theme.colorScheme.onSecondary,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                  image: NetworkImage(
                                    "https://as2.ftcdn.net/v2/jpg/03/13/81/05/1000_F_313810585_svtBOaaeybRPqxmbXf3IjT1K1ker1Wwk.jpg",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            Container(
              width: _isExpanded ? 0 : 150,
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: screenSize.height * .05 + 55,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: ConstComponents.drawerItems.length,
                      itemBuilder: (context, index) {
                        final item = ConstComponents.drawerItems[index];
                        final selected = _selectedItem == index;
                        final hasSubMenu = selected && item.subMenu!.isNotEmpty;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 100),
                          height: hasSubMenu
                              ? item.subMenu!.length.toDouble() * 35
                              : 57,
                          decoration: BoxDecoration(
                            color: hasSubMenu
                                ? theme.colorScheme.secondary
                                : Colors.transparent,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                          ),
                          child: ListView.builder(
                            padding: const EdgeInsets.all(6),
                            itemCount: hasSubMenu ? item.subMenu!.length : 0,
                            itemBuilder: (context, index2) {
                              final subMenu = item.subMenu![index2];
                              return InkWell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    subMenu,
                                    style: theme.textTheme.bodySmall,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: screenSize.height * .4),
          Center(
            child: Text(
              "Monirul Islam",
              style: theme.textTheme.headlineLarge,
            ),
          ),
          Center(
            child: Text(
              "Complex UI Design With Flutter",
              style: theme.textTheme.labelSmall,
            ),
          ),
          const Spacer(),
          Container(
            height: screenSize.height * .06,
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () => _globalKey.currentState!.openDrawer(),
                    child: const Icon(
                      Bootstrap.apple,
                      size: 40,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onSecondary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.onTertiary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              style: theme.textTheme.labelSmall,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                prefixIcon: Icon(AntDesign.search_outline),
                                hintText: "Search",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              _currentTime,
                              style: theme.textTheme.bodySmall
                                  ?.copyWith(color: Colors.white),
                            ),
                            Text(
                              DateTime.now().dateFormat(),
                              style: theme.textTheme.labelLarge
                                  ?.copyWith(color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FlutterIconButton extends StatelessWidget {
  const FlutterIconButton({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: const FlutterLogo(size: 40),
    );
  }
}
