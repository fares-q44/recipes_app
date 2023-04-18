import 'package:flutter/material.dart';

class SingleInstructionItem extends StatelessWidget {
  const SingleInstructionItem({
    super.key,
    required this.index,
    required this.instruction,
  });
  final int index;
  final String instruction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromRGBO(166, 102, 38, 1),
              ),
              child: Text(
                'Step ' + (index + 1).toString() + '\n' + instruction + '\n',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
