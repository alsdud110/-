import 'package:flutter/material.dart';
import 'package:rsp_game/game/enum.dart';
import 'package:rsp_game/game/widgets/input_card.dart';

class UserInput extends StatelessWidget {
  final bool isDone;
  final InputType? userInput;

  // 전달받은 callback함수 (setUserInput) 에 파라미터가 있으니 Function(InputType) 으로 받을 준비를 해야한다.
  final Function(InputType) callback;
  const UserInput(
      {super.key,
      required this.isDone,
      required this.callback,
      this.userInput});

  @override
  Widget build(BuildContext context) {
    return isDone
        ? Center(
            child: InputCard(
              child: SizedBox(
                width: 100,
                height: 100,
                child: Center(
                  child: Image.asset(userInput!.path),
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    callback(InputType.values[index]);
                  },
                  child: Center(
                    child: InputCard(
                      child: Image.asset(InputType.values[index].path),
                    ),
                  ),
                );
              },
              itemCount: InputType.values.length,
            ),
          );
  }
}
