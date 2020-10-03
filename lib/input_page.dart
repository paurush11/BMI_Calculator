import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusablecard.dart';
import 'gendercard.dart';
import 'constants.dart';
import 'results.dart';
import 'Calculate.dart';
import 'brain.dart';


enum Gendertype {
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gendertype g;
  int height = 180;
  int weight = 40;
  int age = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child:Row(
                children: <Widget>[
                  Expanded(
                      child: reusablecard(
                        onPress: (){
                          setState(() {
                            g = Gendertype.male;
                          });
                        },
                        colour :g == Gendertype.male? Color(KReusablecardcolor):Color(KInactiveReusablecardcolor),
                        cardChild: Genderwidget(icon: FontAwesomeIcons.mars,gendername: "Male",),

                      ),
                  ),
                  Expanded(
                      child: reusablecard(
                        onPress: (){
                          setState(() {
                            g = Gendertype.female;
                          });
                        },
                        colour :g == Gendertype.female? Color(KReusablecardcolor):Color(KInactiveReusablecardcolor),
                        cardChild: Genderwidget(icon: FontAwesomeIcons.venus, gendername: "Female",),
                      ),
                  ),
                ],
              )),
          Expanded(
            child: reusablecard(
              colour :Color(KReusablecardcolor),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Height" , style: Klabeltextcard ,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(), style: KNumbertextstyle,),
                      Text("cm", style: Klabeltextcard,)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white ,
                      inactiveTrackColor: Color(0XFF8D8E98),
                      thumbColor: Color(0XFFEB1555),
                      overlayColor: Color(0X30EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      
                      onChanged: (double newvalue ){
                        setState(() {
                          height = newvalue.toInt();
                        });

                      },
                      

                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: reusablecard(
                  colour :Color(KReusablecardcolor),
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Weight", style: Klabeltextcard,),
                      Text(weight.toString(),style: KNumbertextstyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Roundiconbutton(
                            icon: FontAwesomeIcons.minus,
                            onpress: (){
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Roundiconbutton(
                            icon: FontAwesomeIcons.plus,
                            onpress: (){
                              setState(() {
                                weight++;
                              });
                            },
                          ),




                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: reusablecard(
                  colour : Color(KReusablecardcolor),
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Text("Age",style: Klabeltextcard,),
                      Text(age.toString(),style: KNumbertextstyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Roundiconbutton(
                            icon: FontAwesomeIcons.minus,
                            onpress: (){
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Roundiconbutton(
                            icon: FontAwesomeIcons.plus,
                            onpress: (){
                              setState(() {
                                age++;
                              });
                            },
                          ),


                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
          Calculate(
            onpress: (){
              brain B = brain(height: height,weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context)=> Resultspage(

                ResultsValue: B.getBmiValue(),
                ResultsMeaning: B.getType(),
                ResultsSummary: B.getMessage(),
              )));
            },
            Value: "Calculate Your BMI",

          )
        ],
      ),

    );
  }
}


class Roundiconbutton extends StatelessWidget {

  Roundiconbutton({ @required this.icon, @required this.onpress});
  final IconData icon;
  final Function onpress;
  @override
  Widget build(BuildContext context) {

    return RawMaterialButton(
      child: Icon(icon),
      shape: CircleBorder(),
      fillColor: Color(0XFF4C4F5E),
      onPressed: onpress,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      )
    );
  }
}

