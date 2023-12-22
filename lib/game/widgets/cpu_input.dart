import 'package:flutter/material.dart';
import 'package:rsp_game/game/enum.dart';
import 'package:rsp_game/game/widgets/input_card.dart';

class CpuInput extends StatelessWidget {
  final bool isDone;
  final InputType cpuInput;
  const CpuInput({super.key, required this.isDone, required this.cpuInput});

  @override
  Widget build(BuildContext context) {
    return isDone
        ? Center(
            child: InputCard(
              child: SizedBox(
                width: 100,
                height: 100,
                child: Center(
                  child: Image.asset(cpuInput.path),
                ),
              ),
            ),
          )
        : const Center(
            child: InputCard(
              child: SizedBox(
                width: 100,
                height: 100,
                child: Center(
                  child: Text(
                    "?",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          );
  }
}
