import 'dart:math';
class brain{
  brain({this.weight,this.height});
  final int weight;
  final int height;
  double _ans;
  String getBmiValue()
  {
    _ans = weight/pow(height/100,2);
    return _ans.toStringAsFixed(2);
  }
  String getType()
  {
    if(_ans<=25)
      if(_ans>=18.5)
        return "Normal";
      else
        return "UnderWeight";
    else
      return "Overweight";
  }

  String getMessage()
  {
    if(_ans<=28)
      if(_ans<=25)
        if(_ans>=18.5)
          return "You are absolutely fine! Keep Exercising";
        else
          return "You need to eat!!!";
      else
        return "Start Exercising !! You are overweight";
    else
      return "OMG!!! Come on now!! Start exercising ! You are Obese ";
  }

}
