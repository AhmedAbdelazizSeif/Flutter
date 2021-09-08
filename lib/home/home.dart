import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var height = 150.0;

  void showAlert(){
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text('Congratulations'),
            content: Text('Your height is ${height.round()}'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              TextButton(onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                      (Route<dynamic> route) => false,
                );
              }, child: Text('Okay')),
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Flutter"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white10,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Text("Your Height",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 50,
                        fontWeight: FontWeight.w900),),
                  Text(
                    '${height.round()}',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                  Slider(value: height,
                    onChanged: (val){
                      setState(() {
                        height= val;
                      });
                    }
                    ,max: 220,
                    min: 150,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black ,
                        borderRadius: BorderRadius.circular(20)
                    ),

                    child: MaterialButton(
                        onPressed:
                        showAlert,
                        child: Text("Press Me",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.normal)
                        )
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
