import 'package:flutter/material.dart';

class FadePageView extends StatefulWidget {
  final List<Widget> pages;
  final int initialPage;
  final FadePageViewController controller;

  const FadePageView({
    super.key,
    required this.pages,
    required this.controller,
    this.initialPage = 0,
  });

  @override
  State<FadePageView> createState() => _FadePageViewState();
}

class _FadePageViewState extends State<FadePageView> {
  late int _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage;
  }

  void animateToPage(int page) {
    if (page >= 0 && page < widget.pages.length && page != _currentPage) {
      setState(() {
        _currentPage = page;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.controller,
      builder: (context, value, child) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 160),
          reverseDuration: const Duration(milliseconds: 160),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              ),
              child: child,
            );
          },
          layoutBuilder: (Widget? currentChild, List<Widget> previousChildren) {
            return ColoredBox(
              color: Colors.white,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  ...previousChildren,
                  if (currentChild != null) currentChild,
                ],
              ),
            );
          },
          child: KeyedSubtree(
            key: ValueKey(value),
            child: widget.pages[value],
          ),
        );
      }
    );
  }

  // Getter for current page
  int get currentPage => _currentPage;
  
  // Method to get page controller-like functionality
  void nextPage() {
    if (_currentPage < widget.pages.length - 1) {
      animateToPage(_currentPage + 1);
    }
  }
  
  void previousPage() {
    if (_currentPage > 0) {
      animateToPage(_currentPage - 1);
    }
  }
}

class FadePageViewController extends ValueNotifier<int> {
  FadePageViewController({int initialPage = 0}) : super(initialPage);

  void changePage(int index) {
    value = index;
  }
}