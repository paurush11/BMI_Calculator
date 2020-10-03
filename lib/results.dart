import 'package:flutter/material.dart';
import 'reusablecard.dart';
import 'constants.dart';
import 'Calculate.dart';


class Resultspage extends StatelessWidget {
  Resultspage({@required this.ResultsValue,@required this.ResultsMeaning,@required this.ResultsSummary});
  final String ResultsMeaning;
  final String ResultsValue;
  final String ResultsSummary;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Results"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: reusablecard(
              colour: Color(KReusablecardcolor),
              cardChild: Center(child: Text("Results",style: KResultsStyle,),),
            ),
          ),
          Expanded(
            flex: 4,
            child: reusablecard(
              colour: Color(KReusablecardcolor),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(child: Text(ResultsMeaning,style: KResultMeaning,),),
                  Center(child: Text(ResultsValue,style: KResultValue,),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(ResultsSummary,style: KResultSummary,
                    textAlign: TextAlign.justify,),),
                  ),
                ],
              ),
            ),
          ),
          Expanded(

            child: Calculate(
              onpress: (){
                Navigator.pop(context);
              },
              Value: "Re-Calculate",
            )
          )
        ],
      )
    );
  }
}
