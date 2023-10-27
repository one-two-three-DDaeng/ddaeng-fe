import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_two_three_ddaeng_fe/presentaion/movie_quotes_blank_rotate_game/movie_quotes_blank_rotate_game_view.dart';
import 'package:one_two_three_ddaeng_fe/presentaion/movie_quotes_blank_rotate_game/movie_quotes_blank_rotate_game_view_model.dart';
import 'package:one_two_three_ddaeng_fe/presentaion/movie_quotes_blank_timer_game/movie_quotes_blank_timer_game_view.dart';
import 'package:one_two_three_ddaeng_fe/presentaion/movie_quotes_blank_timer_game/movie_quotes_blank_timer_game_view_model.dart';
import 'package:one_two_three_ddaeng_fe/utils/custom_color.dart';
import 'package:one_two_three_ddaeng_fe/utils/custom_radius.dart';
import 'package:one_two_three_ddaeng_fe/utils/custom_shadow.dart';
import 'package:one_two_three_ddaeng_fe/utils/custom_text.dart';
import 'package:provider/provider.dart';

class GameListView extends StatelessWidget {
  const GameListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 20.h,
          ),
          gameCard(
            title: '영화 명대사 맞추기1',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider(
                    create: (_) => MovieQuotesBlankTimerGameViewModel(),
                    child: const MovieQuotesBlankTimerGameView(),
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          gameCard(
            title: '영화 제목 맞추기',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider(
                    create: (_) => MovieQuotesBlankRotateGameViewModel(),
                    child: const MovieQuotesBlankRotateGameView(),
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          gameCard(
            title: '미정',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget gameCard({
    required String title,
    required void Function() onTap,
  }) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 16.h,
          ),
          decoration: BoxDecoration(borderRadius: customRadius(12.w), color: Colors.white, boxShadow: [
            customBoxShadow(
              blurRadius: 20,
              offsetY: 5,
              offsetX: 3,
              color: CustomColor.shadowColor,
            ),
          ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title,
                style: customTextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      side: BorderSide(
                        width: 1.w,
                        color: CustomColor.redColor,
                      ),
                    ),
                    onPressed: onTap,
                    child: Text(
                      'START',
                      style: customTextStyle(
                        fontSize: 14,
                        color: CustomColor.redColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
