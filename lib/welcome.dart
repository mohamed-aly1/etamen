import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _currentIndex = 0;
  final List<String> _photos = [
    'assets/w.png',
    'assets/ww.png',
    'assets/www.png',
  ];
  final List<String> _mainTexts = [
    "Request And Reserve A Nurse",
    'Provide Professional Nurses',
    'Check On Your Concerned People',
  ];
  final List<String> _subTexts = [
    "You can order a nurse immediately, or reserve a nurse for a period of time and the nearest nurse will reach you as soon as possible.",
    'All nurses have nursing degrees. and qualified to provide all health care services.',
    'Keep you updated with the progress between the patient and the caregiver.',
  ];

  Widget _buildPageIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: isActive ? 24.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive
            ? Theme.of(context).primaryColor
            : Color.fromARGB(255, 3255, 236, 229),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  List<Widget> _buildPageIndicators() {
    return List<Widget>.generate(_photos.length, (index) {
      return _buildPageIndicator(index == _currentIndex);
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  _skip() {
    setState(() {
      Navigator.of(context).pushReplacementNamed("SignUp");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: _skip,
              child: Text(
                "Skip",
                style: Theme.of(context).textTheme.bodyMedium,
              ))
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    _photos[_currentIndex],
                    height: 260.0,
                    width: 270.0,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    _mainTexts[_currentIndex],
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 1.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _subTexts[_currentIndex],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Color.fromARGB(255, 244, 140, 121),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (_currentIndex < 2) {
                                _currentIndex = (_currentIndex + 1);
                              } else {
                                Navigator.of(context).pushNamed("SignUp");
                              }
                            });
                          },
                          child: const Text('Next'),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _buildPageIndicators(),
                        ),
                        const SizedBox(height: 30.0),
                        Column(
                          children: [
                            Text(
                              "Have an account ?",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    Navigator.of(context)
                                        .pushReplacementNamed("SignIn");
                                  });
                                },
                                child: Text(
                                  "Sign in",
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
