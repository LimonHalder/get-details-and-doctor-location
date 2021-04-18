import 'package:bloc_pattern/MapSample.dart';

import 'Doctor.dart';
import 'DoctorBloc.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final DoctorBloc _doctorBloc = DoctorBloc();
  @override
  Void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Doctor List")),
      body: Container(
        child: StreamBuilder<List<Doctor>>(
            stream: _doctorBloc.doctorListStream,
            builder:
                (BuildContext context, AsyncSnapshot<List<Doctor>> snapshot) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            "${snapshot.data[index].id}",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(6.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${snapshot.data[index].name}",
                                style: TextStyle(
                                    fontSize: 22.0, color: Colors.deepOrangeAccent),
                              ),
                              Text(
                                "Visiting Fees ${snapshot.data[index].salary}",
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Find Location",style: TextStyle(fontSize: 15.0,),),
                            IconButton(
                              color: Colors.red,
                              
                              icon: Icon(
                                Icons.location_on,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MapSample()));
                              },
                            )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}

mixin Void {}
