
import 'package:fixithandyman/util/app_constant.dart';
import 'package:fixithandyman/views/login_screen.dart';
import 'package:fixithandyman/views/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _slides = [
    {
      'image': 'assets/images/Freelancer-rafiki 1.png',
      'title':"A click away for your first Job of the day.",
      'text': 'Easily find daily and contract job. Negotiate with a lot of customers. Fix it and get paid.',
    },
    {
      'image': 'assets/images/Freelancer-rafiki 1.png',
      'title':'Welcome back to Fix it!',
      'text': 'You are a slide away for you first job',
    },
    {
      'image': 'assets/images/Online Review-pana 1.png',
      'title':'Never Miss an opportunity',
      'text': 'Easily find work, chat and collaborate on the go.',
    },
    
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _login() {
    // Navigate to the next screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(), // Replace NextScreen() with the actual widget of your next screen
      ),
    );
  }

  void _signup() {
    // Navigate to the next screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignUpScreen(), // Replace NextScreen() with the actual widget of your next screen
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.yellow,
        // foregroundColor: Colors.white,
        // title: Text('Welcome'),
          automaticallyImplyLeading: false,
          actions: <Widget> [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GestureDetector(
                onTap: _login,
                child: const Text(
                  "Skip",
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
              ),
            )
          ]
      ),
      body: Container(
        color: AppConstants.lightColor, // Set the background color to yellow
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _slides.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        _slides[index]['image']!,
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        _slides[index]['title']??'',
                        style: const TextStyle(fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        _slides[index]['text']!,
                        style: const TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_slides.length, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  width: 10.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? Colors.blueAccent
                        : Colors.grey,
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
           Align(
  alignment: Alignment.bottomCenter,
  child: Column(
    children: [
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(AppConstants.primaryColor),
          ),
          onPressed: _login,
          child: const Text(
            'Login',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 10, // Optional: Add some spacing between the buttons
      ),
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(AppConstants.lightColor),
          ),
          onPressed: _signup,
          child: const Text(
            'Signup',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    ],
  ),
),

          ],
        ),
      ),
    );
  }
}
