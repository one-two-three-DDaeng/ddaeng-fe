import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_two_three_ddaeng_fe/utils/custom_color.dart';
import 'package:one_two_three_ddaeng_fe/utils/custom_text.dart';
import 'package:onboarding/onboarding.dart';

class GameDescriptionView extends StatefulWidget {
  final String title;
  final String subTitle;
  final List<String> ruleList;
  final List<String> gameDescriptionList;
  final List<String> moreEnjoyList;
  const GameDescriptionView({
    super.key,
    required this.title,
    required this.subTitle,
    required this.ruleList,
    required this.gameDescriptionList,
    required this.moreEnjoyList,
  });

  @override
  State<GameDescriptionView> createState() => _GameDescriptionViewState();
}

class _GameDescriptionViewState extends State<GameDescriptionView> {
  int currentIndex = 0;

  @override
  void initState() {
    currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ..._defaultHeader(width),
          Expanded(
            child: Onboarding(
              pages: [
                PageModel(
                  widget: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width / 5,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Text(
                              '★Rule★',
                              style: customTextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ...List.generate(
                          widget.ruleList.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Text(
                              widget.ruleList[index],
                              style: customTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                PageModel(
                  widget: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width / 4,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Text(
                              '★게임 설명★',
                              style: customTextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ...List.generate(
                          widget.gameDescriptionList.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Text(
                              '${index + 1}. ${widget.gameDescriptionList[index]}',
                              style: customTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                PageModel(
                  widget: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width * 3 / 5,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Text(
                              '★★★게임 더욱 즐기는 법★★★',
                              style: customTextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ...List.generate(
                          widget.moreEnjoyList.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Text(
                              '${index + 1}. ${widget.moreEnjoyList[index]}',
                              style: customTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
              startPageIndex: 0,
              onPageChange: (pageIndex) => {
                currentIndex = pageIndex,
              },
              footerBuilder: (context, netDragDistance, pagesLength, setIndex) => Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                  left: 30,
                  right: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width / 3,
                      child: CustomIndicator(
                        netDragPercent: netDragDistance,
                        indicator: Indicator(
                          activeIndicator: const ActiveIndicator(
                            color: Colors.grey,
                            borderWidth: 1,
                          ),
                          closedIndicator: const ClosedIndicator(
                            color: CustomColor.mainColor,
                            borderWidth: 1,
                          ),
                          indicatorDesign: IndicatorDesign.polygon(
                            polygonDesign: PolygonDesign(
                              polygon: DesignType.polygon_circle,
                              polygonSpacer: 30.0,
                            ),
                          ),
                        ),
                        pagesLength: pagesLength,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(90, 30),
                        backgroundColor: currentIndex == pagesLength - 1 ? CustomColor.mainColor : CustomColor.buttonBlackColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        currentIndex == pagesLength - 1 ? '알겠어요!' : '스킵',
                        style: customTextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _defaultHeader(double width) => [
        Center(
          child: SizedBox(
            width: width / 3,
            child: FittedBox(
              child: Text(
                '게임 설명',
                style: customTextStyle(
                  fontSize: 36,
                  color: CustomColor.mainColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            widget.title,
            style: customTextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            widget.subTitle,
            style: customTextStyle(
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ];
}
