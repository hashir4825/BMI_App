import 'package:bmi_app/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI App',
      home: Splash_screen(),
      theme: ThemeData(primaryColor: Colors.purple),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var weight_controller = TextEditingController();
  var height_controller_inch = TextEditingController();
  var height_controller_ft = TextEditingController();
  var result = "";
  var error = "";
  var bottom_pic="assets/images/bmi.jpg";


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Colors.purple,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        // body: OutlinedButton(
        //   child: Text("Press"),
        //   onPressed: ()
        //   {
        //     print("Pressed");
        //   },
        // ),

        body: Center(
          child: Container(
            width: 300,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16,),
                  Center(child: Text("BMI Calculator",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,fontFamily: "Times New Roman"),)),
                  SizedBox(height: 43,),
                  Text("Enter your weight",style: TextStyle(fontSize: 20),),
                  SizedBox(height: 13,),
                  TextField(
                    keyboardType: TextInputType.phone,
                    controller: weight_controller,
                    decoration: InputDecoration(
                      hintText: "Enter your weight (in kgs)",
                      prefixIcon: Icon(Icons.line_weight_sharp),
                      suffixText: "kgs",
                      filled: true,
                      fillColor: Colors
                          .grey[200], // Change the fill color to your preference
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2.0),
                        borderSide: BorderSide.none, // Hide the border
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 20.0), // Adjust padding
                    ),
                  ),
                  SizedBox(
                    height: 31,
                  ),
                  Text("Enter your height",style: TextStyle(fontSize: 20),),
                  SizedBox(height: 13,),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          controller: height_controller_ft,
                          decoration: InputDecoration(
                            hintText: "ft",
                            prefixIcon: Icon(Icons.height_rounded),
                            suffixText: "ft",
                            filled: true,
                            fillColor: Colors
                                .grey[200], // Change the fill color to your preference
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              borderSide: BorderSide.none, // Hide the border
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 20.0), // Adjust padding
                          ),
                         ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Container(
                        width: 150,
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          controller: height_controller_inch,
                          decoration: InputDecoration(
                            hintText: "inch",
                            prefixIcon: Icon(Icons.height_rounded),
                            suffixText: "inch",
                            filled: true,
                            fillColor: Colors
                                .grey[200], // Change the fill color to your preference
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.0),
                              borderSide: BorderSide.none, // Hide the border
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 20.0), // Adjust padding
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 31,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        var weight_int = double.tryParse(weight_controller.text);
                        var height_ft = double.tryParse(height_controller_ft.text);
                        var height_inch = double.tryParse(height_controller_inch.text);

                        if (weight_int != null && height_ft != null && height_inch!=null) {
                          var height_metres = height_ft*0.3048 + height_inch * 0.0254;

                          if (weight_int > 0 && height_metres > 0) {
                            double bmi = weight_int / (height_metres * height_metres);
                            var msg;
                            if(bmi < 18.5)
                            {
                              msg = "You are under weight";
                              bottom_pic="assets/images/underweight.jpg";
                            }
                            else if(bmi >= 18.5 && bmi < 25)
                            {
                              msg = "You are healthy";
                              bottom_pic = "assets/images/healthy.jpg";
                            }
                            else if(bmi >= 25 && bmi < 30)
                              {
                                msg = "You are over weight";
                                bottom_pic = "assets/images/overweight.jpg";
                              }
                            else
                            {
                              msg = "You are obese";
                              bottom_pic = "assets/images/obese.jpg";
                            }
                            setState(() {
                              result = "Your BMI: ${bmi.toStringAsFixed(2)} \n ${msg}";
                              error = ""; // Reset any previous error
                            });
                          }
                          // else {
                          //   error = "*Kindly Enter valid weight and height!!";
                          //   result = "";
                          //   setState(() {});
                          // }
                        } else {
                          error = "*Kindly Enter all Fields!";
                          result = "";
                          bottom_pic="assets/images/error.jpg";
                          setState(() {});
                        }
                      },

                      child: Text("Calculate"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.purple), // Change the color here
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      error,
                      style: TextStyle(
                          color: Colors.red.shade300,
                          fontStyle: FontStyle.italic,
                          fontSize: 18),
                    ),
                  ),
                  Center(
                    child: Text(
                      result,
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  SizedBox(height: 12,),
                  Center(child: Image.asset(bottom_pic,height: 200,)),
                ],
              ),
            ),
          ),

        ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Made by Hashir Iqbal • ${DateTime.now().year}',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            Text(
              ' © ',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),

    );
  }
}
