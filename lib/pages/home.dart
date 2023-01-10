import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map<dynamic,dynamic>;
    print(data);

    String bgImage = (data?['isDayTime'] ?? false) ?'day.png' : 'night.png';
    Color bgColor = (data?['isDayTime'] ?? false) ? Colors.lightBlue : Colors.blue;

    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
              fit:BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,120,0,0),
          child: SafeArea(
            child: Column(
              children: [
            TextButton.icon(onPressed: ()async {
              dynamic result = await Navigator.pushNamed(context, '/location');
              setState(() {
                data = {
                  'time': result['time'],
                  'location': result['location'],
                  'isDayTime': result['isDayTime'],
                  'flag': result['flag']
                };
              });
            }, icon: const Icon(Icons.edit_location), label: const Text('Edit Location'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey[300],
              ),
            ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data['location'],
                      style: TextStyle(fontSize: 28, letterSpacing: 2, color: Colors.white),
                ),
                  ],
                ),
                SizedBox(height: 20),
                Text(data['time'],
                style: TextStyle(fontSize: 66, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
      );
  }
}
