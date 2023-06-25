import 'package:bmicalculator/card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'bottombutton.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.bmiResult,
      required this.resultText,
      required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Your Result',
                  style: KTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Resuablecard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        resultText.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: KresultTextStyle,
                      ),
                      Text(
                        bmiResult,
                        textAlign: TextAlign.center,
                        style: KBMITextStyle,
                      ),
                      Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: kBodyTextStyle,
                      ),
                    ],
                  ),
                  onPress: () {}),
            ),
            BottomButton(
              buttonTitle: 'RE-CALCULATE',
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ));
  }
}
