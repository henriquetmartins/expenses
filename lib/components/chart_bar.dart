import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;

  ChartBar({
    this.label,
    this.percentage,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 15,
          child: FittedBox(
            child: Text('${value.toStringAsFixed(2)}'),
          ),
        ),
        SizedBox(height: 5),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                  decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(5),
                color: Color.fromRGBO(220, 220, 220, 1),
              )),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 5),
        Text(label)
      ],
    );
  }
}
