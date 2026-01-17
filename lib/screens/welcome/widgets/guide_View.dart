import 'package:flutter/material.dart';
import 'package:recipeshare/screens/welcome/widgets/guide_page.dart';
import 'package:recipeshare/screens/welcome/widgets/page_indicator.dart';
import 'package:recipeshare/constants/sizes.dart';

class GuideView extends StatefulWidget {
  const GuideView({super.key});

  @override
  State<GuideView> createState() => _GuideViewState();
}

class _GuideViewState extends State<GuideView> {
  final PageController _controller = PageController();
  int currentPageIndex = 0;

  final List<String> guideTexts = [
    "Bienvenue dans Recipe Share !",
    "Ajoutez vos recettes facilement.",
    "Partagez-les avec la communauté.",
    "Découvrez tous nos services.",
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      int page = _controller.page!.round();
      if (page != currentPageIndex) {
        setState(() {
          currentPageIndex = page;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: guidePageViewHeight,
          child: PageView( //  faire défiler des pages horizontalement ou verticalement.
            controller: _controller,
            children: List.generate(
              guideTexts.length,
                  (index) => GuidePage(
                text: guideTexts[index],
              ),
            ),
          ),
        ),
        PageIndicator(
          count: guideTexts.length,
          currentIndex: currentPageIndex,
        ),
      ],
    );
  }
}
