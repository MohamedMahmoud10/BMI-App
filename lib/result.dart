import 'dart:ui';

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final double result;

  final bool isMale;
  final int age;

  const Result(
      {Key? key, required this.result, required this.isMale, required this.age})
      : super(key: key);

 String get resultPhrase{
   String resultText;
   if(result>=30) {resultText='Obese';}
   else if (result>=25&&result<30){resultText='OverWeigthed';}
   else if (result>=18.5&&result<=25){resultText='Normal';}
   else {resultText='UnderWeighted';}

   return resultText;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Gender:${isMale ? 'Male' : 'Female'}',
                style:Theme.of(context).textTheme.headline1,
              ),Text(
                'Result:${result.toStringAsFixed(1)}',
                style:Theme.of(context).textTheme.headline1,
              ),Text(
                'Healthnis:\n${resultPhrase}',
                style:Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center ,
              ),Text(
                'Age:${age}',
                style:Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
