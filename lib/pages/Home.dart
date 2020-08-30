import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String bgimage = data['isDay'] ? 'day.png' : 'night.png';
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgimage'),
            fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
          child: SafeArea(
            child: Column(
              children: [
                FlatButton.icon(
                  onPressed: () async{
                    dynamic instance = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': instance['time'],
                        'location': instance['location'],
                        'flag': instance['flag'],
                        'isDay': instance['isDay'],
                      };
                    });
                  },
                  icon: Icon(Icons.edit_location,
                  color: Colors.grey[300],),
                  label: Text('Edit location',
                  style: TextStyle(
                    color: Colors.grey[300],
                  ),),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        letterSpacing: 1.0,
                        fontSize: 28.0,
                        color: Colors.white
                      ),
                    ),
                  ],
                ),
                SizedBox(height:18.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 50.0,
                    color: Colors.white
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
