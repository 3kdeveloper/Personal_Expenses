import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPerOfTotal;

  ChartBar({
    this.label,
    this.spendingAmount,
    this.spendingPerOfTotal,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
            child: Container(
          height: 20,
          child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
        )),
        SizedBox(
          width: 4,
        ),
        Container(
          width: 10,
          height: 60,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPerOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: 4,
        ),
        Container(
          child: Text(label),
        ),
      ],
    );
  }
}
