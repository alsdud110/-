import 'package:flutter/material.dart';
import 'package:rsp_game/game/enum.dart';

class GameResult extends StatelessWidget {
  final bool isDone;
  final Result? result;

  // 전달받은 callback함수 (reset) 에 파라미터가 없으니 VoidCallback 으로 받을 준비를 해야한다.
  final VoidCallback callback;
  const GameResult(
      {super.key, required this.isDone, this.result, required this.callback});

  @override
  Widget build(BuildContext context) {
    return isDone
        ? InkWell(
            onTap: () => callback(),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    result!.displayString,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "다시 하려면 화면을 터치하세요.",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
          )
        : const Center(
            child: Text(
              "가위, 바위, 보 중 하나를 선택해 주세요.",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          );
  }
}
