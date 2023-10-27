import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_two_three_ddaeng_fe/presentaion/movie_quotes_blank_timer_game/movie_quotes_blank_timer_game_view_model.dart';
import 'package:one_two_three_ddaeng_fe/presentaion/widget/progress_widget.dart';
import 'package:one_two_three_ddaeng_fe/utils/custom_color.dart';
import 'package:one_two_three_ddaeng_fe/utils/custom_text.dart';
import 'package:provider/provider.dart';

class MovieQuotesBlankTimerGameView extends StatefulWidget {
  const MovieQuotesBlankTimerGameView({super.key});

  @override
  State<MovieQuotesBlankTimerGameView> createState() => _MovieQuotesBlankTimerGameViewState();
}

class _MovieQuotesBlankTimerGameViewState extends State<MovieQuotesBlankTimerGameView> {
  late dynamic model;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      model = Provider.of<MovieQuotesBlankTimerGameViewModel>(context, listen: false);
    });
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      model.timer?.cancel();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MovieQuotesBlankTimerGameViewModel>();

    return WillPopScope(
      onWillPop: () => viewModel.clickBack(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '하나둘셋 땡!',
            style: customTextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: viewModel.step == 1
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 12.h),
                    child: Text(
                      '문제 갯수를 설정해주세요',
                      style: customTextStyle(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: viewModel.clickMinus,
                        child: Icon(
                          CupertinoIcons.minus,
                          size: 60.w,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      SizedBox(
                        width: 120.w,
                        child: Text(
                          viewModel.quizCount.toString(),
                          style: customTextStyle(
                            fontSize: 100,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      GestureDetector(
                        onTap: viewModel.clickPlus,
                        child: Icon(
                          CupertinoIcons.plus,
                          size: 60.w,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 24.w,
                      right: 24.w,
                      bottom: 36.h,
                    ),
                    child: ElevatedButton(
                      onPressed: () => viewModel.clickStart(context),
                      child: const Text(
                        '시작하기',
                      ),
                    ),
                  ),
                ],
              )
            : viewModel.isProgress
                ? progressWidget()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Stack(
                        children: [
                          Positioned(
                            left: 170.w,
                            right: 170.w,
                            child: Container(
                              alignment: Alignment.center,
                              width: 10.w,
                              height: 50.h,
                              child: Text(
                                viewModel.leftTime.toString(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: viewModel.leftTime / 30 * 360.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                  color: CustomColor.redColor.withOpacity(.3),
                                ),
                              ),
                              Container(
                                width: 360.w - viewModel.leftTime / 30 * 360.w,
                                height: 50.h,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20.w),
                        child: Text(
                          '남은 문제 개수: ${viewModel.leftQuiz}',
                          style: customTextStyle(),
                          textAlign: TextAlign.end,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Wrap(
                              //   crossAxisAlignment: WrapCrossAlignment.center,
                              //   runSpacing: 4.w,
                              //   spacing: 4.w,
                              //   alignment: WrapAlignment.center,
                              //   children: [
                              //     ...List.generate(
                              //       viewModel.quiz.length,
                              //       (index) => Container(
                              //         width: 36.w,
                              //         height: 36.w,
                              //         decoration: const BoxDecoration(
                              //           border: Border(
                              //             bottom: BorderSide(
                              //               width: 3,
                              //               color: Colors.black,
                              //             ),
                              //           ),
                              //         ),
                              //         alignment: Alignment.center,
                              //         child: Text(
                              //           viewModel.hintIndex.contains(index) ||
                              //                   viewModel.quiz[index] == '!' ||
                              //                   viewModel.quiz[index] == ',' ||
                              //                   viewModel.quiz[index] == '?' ||
                              //                   viewModel.quiz[index] == '√'
                              //               ? viewModel.quiz[index]
                              //               : '',
                              //           style: customTextStyle(
                              //             fontSize: 20,
                              //             fontWeight: FontWeight.bold,
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: 20.h,
                              // ),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                runSpacing: 4.w,
                                spacing: 4.w,
                                alignment: WrapAlignment.center,
                                children: [
                                  ...List.generate(
                                    viewModel.quiz.length,
                                    (index) => viewModel.quiz[index] == '!' ||
                                            viewModel.quiz[index] == ',' ||
                                            viewModel.quiz[index] == '?' ||
                                            viewModel.quiz[index] == '√'
                                        ? Text(
                                            viewModel.quiz[index] == '√' ? '  ' : viewModel.quiz[index],
                                            style: customTextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        : Container(
                                            width: 36.w,
                                            height: 36.w,
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  width: 3,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              viewModel.hintIndex.contains(index) ? viewModel.quiz[index] : '',
                                              style: customTextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              viewModel.leftTime <= 10
                                  ? Center(
                                      child: Text(
                                        '[${viewModel.movieName}]',
                                        style: customTextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.w),
                        child: ElevatedButton(
                          onPressed: () => viewModel.clickViewAnswer(context, false),
                          child: const Text('정답보기'),
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}
