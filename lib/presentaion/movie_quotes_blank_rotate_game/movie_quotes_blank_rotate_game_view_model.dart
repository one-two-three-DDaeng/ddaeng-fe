import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:one_two_three_ddaeng_fe/domain/model/count_model.dart';
import 'package:one_two_three_ddaeng_fe/domain/model/movie_line_model.dart';
import 'package:one_two_three_ddaeng_fe/presentaion/dialog/title_content_two_button_dialog.dart';
import 'package:one_two_three_ddaeng_fe/presentaion/movie_quotes_blank_game_result/movie_quotes_blank_game_result_view.dart';

class MovieQuotesBlankRotateGameViewModel extends ChangeNotifier {
  int _step = 1;
  int get step => _step;

  int _quizCount = 5;
  int get quizCount => _quizCount;

  int _leftTime = 0;
  int get leftTime => _leftTime;

  int get leftQuiz => _quizCount - _oCount - _xCount;

  int _oCount = 0;
  int _xCount = 0;

  int _maxOpenCount = 0;
  int get maxOpenCount => _maxOpenCount;

  List<String> _quiz = [];
  List<String> get quiz => _quiz;

  List<int> _openIndex = [];
  List<int> get openIndex => _openIndex;

  String _movieName = '';
  String get movieName => _movieName;

  bool _isProgress = false;
  bool get isProgress => _isProgress;

  Future<bool> clickBack(BuildContext context) async {
    if (step == 1) {
      return true;
    } else {
      var result = await titleContentTwoButtonDialog(context: context, content: '정말로 게임에서 나가시겠습니까?', buttonText1: '취소', buttonText2: '확인');
      if (result != null) {
        if (result) {
          return true;
        }
      }
      return false;
    }
  }

  void clickMinus() {
    _quizCount--;
    notifyListeners();
  }

  void clickPlus() {
    _quizCount++;
    notifyListeners();
  }

  void clickStart(BuildContext context) {
    _step = 2;
    getMovie(context);
  }

  void getMovie(BuildContext context) async {
    _isProgress = true;
    notifyListeners();
    _movieName = '';
    _quiz.clear();
    _openIndex.clear();
    _leftTime = 30;

    var result = await getMovieCount();

    var countModel = CountModel.fromJson(jsonDecode(result));

    int number = Random().nextInt(countModel.data[0].count);

    var result2 = await getMovieLineContent(number.toString());

    var movieModel = MovieLineModel.fromJson(jsonDecode(result2));

    _movieName = movieModel.data[0].movieName;
    _quiz.addAll(movieModel.data[0].line.split(''));

    _maxOpenCount = (_quiz.length * 3 / 10).round();

    _isProgress = false;
    notifyListeners();
  }

  void clickBox(int index) {
    if (_openIndex.contains(index) || _openIndex.length >= _maxOpenCount || index % 2 == 1) {
      return;
    } else {
      _openIndex.add(index);
      notifyListeners();
    }
  }

  void clickViewAnswer(BuildContext context) async {
    String answer = '';

    for (int i = 0; i < _quiz.length; i++) {
      answer += _quiz[i] == '√' ? ' ' : _quiz[i];
    }

    var result = await titleContentTwoButtonDialog(
      context: context,
      content: '$_movieName\n\n$answer',
      buttonText1: '오답',
      buttonText2: '정답',
    );

    if (result == null || !result) {
      _xCount++;
    } else {
      _oCount++;
    }
    if (leftQuiz != 0) {
      if (context.mounted) {
        getMovie(context);
      }
    } else {
      if (context.mounted) {
        goResultPage(context);
      }
    }
  }

  void goResultPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MovieQuotesBlankGameResultView(
          timer: false,
          oCount: _oCount,
          xCount: _xCount,
        ),
      ),
    );
  }

  Future<dynamic> getMovieCount() async {
    try {
      final response = await http.get(Uri.parse('http://54.180.81.222/api/movie/line/count'));

      if (response.statusCode == 200) {
        return response.body;
      } else {
        print(response.statusCode);
      }
    } on TimeoutException catch (_) {
      print('탐아웃');
    } catch (e) {
      print('네트워크에러');
    }
  }

  Future<dynamic> getMovieLineContent(String lineSeq) async {
    try {
      final response = await http.get(Uri.parse('http://54.180.81.222/api/movie/line/$lineSeq'));

      if (response.statusCode == 200) {
        return response.body;
      } else {
        print(response.statusCode);
      }
    } on TimeoutException catch (_) {
      print('탐아웃');
    } catch (e) {
      print('네트워크에러');
    }
  }
}
