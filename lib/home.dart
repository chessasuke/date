import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final eventTime = DateTime(2023, 07, 1, 9);
  Duration get secsUntilEvent => eventTime.difference(DateTime.now());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Date Planner',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/fed.jpeg'),
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Countdown(
                seconds: secsUntilEvent.inSeconds,
                build: (BuildContext context, double time) {
                  final days = secsUntilEvent.inDays;
                  final hours = (secsUntilEvent.inHours - days * 24);
                  final mins = (secsUntilEvent.inMinutes - hours * 60) % 60;
                  final secs = (secsUntilEvent.inSeconds - hours * 3600) % 60;

                  final strSecs = secs < 10 ? '0$secs' : '$secs';

                  print(
                      ' ---- days: $days | hours: $hours | mins: $mins | secs: $secs');

                  return Container(
                    constraints: BoxConstraints(maxWidth: 300),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            '$days Days',
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '$hours:$mins:$strSecs',
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'FAQ',
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Column(
                            children: [
                              ExpansionTile(
                                title: Text(
                                  'Date & Time',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                children: <Widget>[
                                  ListTile(
                                    title: Text(
                                      'Saturaday, July 1st 2023 at 9:00 am',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(
                                  'Where does Federica needs to be at above Date & Time?',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                children: <Widget>[
                                  ListTile(
                                      title: Text(
                                    'Tate Tanglewood',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  )),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(
                                  'What does Federica needs to bring?',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                children: <Widget>[
                                  ListTile(
                                    title: Text(
                                      'Her hot ass and good actitude',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(
                                  'Does Federica needs specific clothes for the activities?',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                children: <Widget>[
                                  ListTile(
                                    title: Text(
                                      'She needs confortable clothes and maybe clothes that she doesnt mind to stain.',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                interval: const Duration(milliseconds: 100),
                onFinished: () {
                  print('Timer is done!');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
