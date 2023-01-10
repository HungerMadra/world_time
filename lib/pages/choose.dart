import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}
List<WorldTime> locations = [
  WorldTime('Lagos', 'time', 'nigeria.png', 'Africa/Lagos', true),
  WorldTime('London', 'time', 'uk.png' , 'Europe/London', true),
  WorldTime('Athens', 'time', 'greece.png', 'Europe/Berlin', true),
  WorldTime('Cairo', 'time', 'egypt.png', 'Africa/Cairo', true),
  WorldTime('Nairobi', 'time', 'kenya.png', 'Africa/Nairobi', true),
  WorldTime('Chicago', 'time', 'usa.png', 'America/Chicago', true),
  WorldTime('New York', 'time', 'usa.png', 'America/New_York', true),
  WorldTime('Seoul', 'time', 'south_korea.png', 'Asia/Seoul', true),
  WorldTime('Jakarta', 'time', 'indonesia.png', 'Asia/Jakarta', true),
];

/*void updateTime(index) async {
  WorldTime instance = locations[index];
  await instance.getTime();
  Navigator.pop(context, {
    'location': instance.location,
    'flag': instance.flag,
    'time': instance.time,
    'isDayTime': instance.isDayTime});
}*/

class _ChooseLocationState extends State<ChooseLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text('Choose A Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(itemCount:locations.length,
      itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
          child: Card(
            child: ListTile(
              onTap: () async {
                WorldTime instance = locations[index];
                await instance.getTime();
                Navigator.pop(context, {
                  'location': instance.location,
                  'flag': instance.flag,
                  'time': instance.time,
                  'isDayTime': instance.isDayTime});
              },
                title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
            ),
          ),
        );
      }
      ),
    );
  }
}
