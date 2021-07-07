import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bottle(),
    );
  }
}
class Bottle extends StatefulWidget {

  @override
  _BottleState createState() => _BottleState();
}

class _BottleState extends State<Bottle>with SingleTickerProviderStateMixin {
  double xfactor = 0;
  bool isPlay = false;

  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
      super.initState();
      animationController = AnimationController(vsync: this, duration: Duration(seconds: 2));

      animationController.repeat();
  }


  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Bottle Spin Game', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                SizedBox(height: 50,),
                Transform.rotate(
                  angle: animationController.value * xfactor,


                  child: Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/bott.jpg')
                        )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      xfactor= 6.3;
                      animationController.forward();
                    });

                  },
                  onDoubleTap: (){
                    xfactor = 6.3;
                    animationController.reverse();

                  },
                  child: Container(
                    height: 40,
                    width: 340,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(child: Text('Play', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),)),
                  ),
                )
              ],
            ),


          );

    });
  }
  @override
  void dispose() {

    super.dispose();
  }
}

