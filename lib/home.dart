import 'dart:math';
import 'package:bmi/result.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isMale = true;
  double height = 170;

  int age = 18;

  int weight = 80;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Body Mass Index Calac'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        m1Expanded(context, 'male'),
                        const SizedBox(
                          width: 20,
                        ),
                        m1Expanded(context, 'female'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Height',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                height.toStringAsFixed(1),
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              Text(
                                'cm',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                          Slider(
                            value: height,
                            min: 90,
                            max: 220,
                            onChanged: (newVal) {
                              setState(() => height = newVal);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        m2Expanded(context, 'age'),
                        const SizedBox(
                          width: 20,
                        ),
                        m2Expanded(context, 'weight'),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.teal,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 12,
                  child: TextButton(
                    child: Text(
                      'Calculate',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    onPressed: () {
                      setState(() {
                        var result = (weight / pow(height / 100, 2));
                        print(result);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => Result(
                                result: result, isMale: isMale, age: age)));
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Expanded m1Expanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            (isMale = type == 'male') ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: (isMale && type == 'male') || (!isMale && type == 'female')
                ? Colors.blueGrey
                : Colors.teal,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              type == 'male'
                  ? const Icon(
                      Icons.male,
                      size: 90,
                    )
                  : const Icon(
                      Icons.female,
                      size: 90,
                    ),
              const SizedBox(
                height: 15,
              ),
              Text(
                type == 'male' ? 'Male' : 'Female',
                style: Theme.of(context).textTheme.headline2,
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2Expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == 'age' ? 'Age' : 'Weight',
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              type == 'age' ? '$age' : '$weight',
              style: Theme.of(context).textTheme.headline1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                    child: const Icon(
                      Icons.add,
                      size: 30,
                    ),
                    heroTag: type == 'age' ? 'age++' : 'weight++',
                    onPressed: () {
                      setState(() => type == 'age' ? age++ : weight++);
                    }),
                const SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                    child: const Icon(
                      Icons.remove,
                      size: 30,
                    ),
                    heroTag: type == 'age' ? 'age--' : 'weight--',
                    onPressed: () {
                      setState(() => type == 'age' ? age-- : weight--);
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
