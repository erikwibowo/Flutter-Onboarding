import 'package:flutter/material.dart';
import 'package:onboarding/slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: onBoarding(),
    );
  }
}

class onBoarding extends StatefulWidget {
  @override
  _onBoardingState createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    SliderPage(
      title: "Keep Save",
      description: "lorem ipsum",
      image: "assets/1.svg"
    ),
    SliderPage(
      title: "Buy & Invest",
      description: "lorem ipsum",
      image: "assets/2.svg"
    ),
    SliderPage(
      title: "Sell & Excange",
      description: "lorem ipsum",
      image: "assets/3.svg"
    )    
  ];

  _onChanged(int index){
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            itemCount: _pages.length,
            onPageChanged: _onChanged,
            itemBuilder: (context, int index){
              return _pages[index];
            },

          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(_pages.length, (int index){
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 10,
                  width: (index == _currentPage) ? 30:10,
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: (index == _currentPage) ? Colors.blue:Colors.blue.withOpacity(0.5)
                  ),
                );
              })),
              InkWell(
                onTap: (){
                  _controller.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOutQuint);
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 70,
                  alignment: Alignment.center,
                  width: (_currentPage == (_pages.length - 1)) ? 200:70,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: (_currentPage == (_pages.length - 1)) ? 
                  Text("Get Started", 
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),):
                  Icon(Icons.navigate_next, 
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
              SizedBox(height: 50,)
            ],
          ),
        ],
      ),
    );
  }
}