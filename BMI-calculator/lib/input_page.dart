import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculator/card.dart';
import 'package:bmicalculator/icon.dart';
import 'constants.dart';
import 'result_page.dart';
import 'Roundicon.dart';
import 'bottombutton.dart';
import 'calculate.dart';

enum Gender {
  male,
  female,
}

const activecardcolor = Color(0xFF1D1E33);
const inactivecardcolor = Color(0xFF111328);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;
  /*
  Color maleCardColour = inactivecardcolor;
  Color femaleCardColour = inactivecardcolor;

  void updateColour(int gender) {
    if (gender == 1) {
      if (maleCardColour == inactivecardcolor) {
        maleCardColour = activecardcolor;
      } else {
        maleCardColour = inactivecardcolor;
      }
    }
    if (gender == 2) {
      if (femaleCardColour == inactivecardcolor) {
        femaleCardColour = activecardcolor;
      } else {
        maleCardColour = inactivecardcolor;
      }
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                      child: Resuablecard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? activecardcolor
                        : inactivecardcolor,
                    cardChild: const Reusableicon(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  )),
                  Expanded(
                      child: Resuablecard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    cardChild: const Reusableicon(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                    colour: selectedGender == Gender.female
                        ? activecardcolor
                        : inactivecardcolor,
                  )),
                ],
              )),
              Expanded(
                  child: Resuablecard(
                      colour: activecardcolor,
                      onPress: () {
                        setState(() {});
                      },
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'HEIGHT',
                            style: KlabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                height.toString(),
                                style: kNumberTextStyle,
                              ),
                              Text(
                                'cm',
                                style: KlabelTextStyle,
                              )
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              inactiveTrackColor: Color(0xFF8D8E98),
                              activeTrackColor: Colors.white,
                              thumbColor: Color(0xFFEB1555),
                              overlayColor: Color(0x29EB1555),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30.0),
                            ),
                            child: Slider(
                                value: height.toDouble(),
                                min: 120.0,
                                max: 220.0,
                                onChanged: (double newValue) {
                                  setState(() {
                                    height = newValue.round();
                                  });
                                }),
                          ),
                        ],
                      ))),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: Resuablecard(
                      onPress: () {
                        setState(() {});
                      },
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: KlabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                      colour: activecardcolor,
                    ),
                  ),
                  Expanded(
                      child: Resuablecard(
                    onPress: () {
                      setState(() {});
                    },
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: KlabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    colour: activecardcolor,
                  )),
                ],
              )),
              BottomButton(
                buttonTitle: 'CALCULATE',
                onTap: () {
                  Calculator calc = Calculator(height: height, weight: weight);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                                bmiResult: calc.calculateBMI(),
                                resultText: calc.getResult(),
                                interpretation: calc.getInterpretation(),
                              )));
                },
              )
            ]));
  }
}
