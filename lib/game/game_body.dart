import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rsp_game/game/enum.dart';
import 'package:rsp_game/game/widgets/cpu_input.dart';
import 'package:rsp_game/game/widgets/game_result.dart';
import 'package:rsp_game/game/widgets/user_input.dart';

class GameBody extends StatefulWidget {
  const GameBody({super.key});

  @override
  State<GameBody> createState() => _GameBodyState();
}

class _GameBodyState extends State<GameBody> {
  late bool isDone;
  InputType? _userInput;
  late InputType _cpuInput;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isDone = false;
    setCpuInput();
  }

  void setUserInput(InputType userInput) {
    setState(() {
      isDone = true;
      _userInput = userInput;
    });
  }

  void setCpuInput() {
    final random = Random();
    _cpuInput = InputType.values[random.nextInt(3)];
  }

  Result? getResult() {
    if (_userInput == null) return null;

    switch (_userInput) {
      case InputType.rock:
        switch (_cpuInput) {
          case InputType.rock:
            return Result.draw;
          case InputType.scissors:
            return Result.playerWin;
          case InputType.paper:
            return Result.CpuWin;
        }
      case InputType.scissors:
        switch (_cpuInput) {
          case InputType.rock:
            return Result.CpuWin;
          case InputType.scissors:
            return Result.draw;
          case InputType.paper:
            return Result.playerWin;
        }
      case InputType.paper:
        switch (_cpuInput) {
          case InputType.rock:
            return Result.playerWin;
          case InputType.scissors:
            return Result.CpuWin;
          case InputType.paper:
            return Result.draw;
        }
      default:
        return null;
    }
  }

  void reset() {
    setState(() {
      isDone = false;
      setCpuInput();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("가위 바위 보!")),
      body: Column(
        children: [
          Expanded(
            child: CpuInput(
              isDone: isDone,
              cpuInput: _cpuInput,
            ),
          ),
          Expanded(
            child: GameResult(
              isDone: isDone,
              result: getResult(),
              callback: reset, // 매개변수가 없음
            ),
          ),
          Expanded(
            child: UserInput(
              isDone: isDone,
              callback: setUserInput, // 매개변수가 있음
              userInput: _userInput,
            ),
          ),
        ],
      ),
    );
  }
}
