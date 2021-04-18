import 'dart:async';
import 'Doctor.dart';
class DoctorBloc{


   // sink to add in pipe
   // stream to get data from pi
   // 
  List<Doctor> _doctorList = [
    Doctor(1, "Doctor1", 100),
    Doctor(2, "Doctor2", 250),
    Doctor(3, "Doctor3", 300),
    Doctor(4, "Doctor4", 1000),
    Doctor(5, "Doctor5", 100),
    Doctor(6, "Doctor6", 1000),
    Doctor(7, "Doctor7", 2500),
    Doctor(8, "Doctor8", 300),
    Doctor(9, "Doctor9", 1034),
    Doctor(10, "Doctor10", 10000),
    Doctor(11, "Doctor11", 1500),
    Doctor(12, "Doctor12", 2700),
    Doctor(13, "Doctor13", 600),
    Doctor(14, "Doctor14", 1800),
    Doctor(15, "Doctor15", 1000),
    Doctor(16, "Doctor16", 9000),
    Doctor(17, "Doctor17", 2600),
    Doctor(18, "Doctor18", 300),
    Doctor(19, "Doctor19", 600),
    Doctor(20, "Doctor20", 100)
  ];

  final _doctorListStreamController = StreamController<List<Doctor>>();

   // for inc and dec
  
  
  final _doctorSalaryIncrementStreamController = StreamController<Doctor>();

  final _doctorSalaryDecrementStreamController = StreamController<Doctor>();


   // getter
    
  Stream<List<Doctor>> get doctorListStream =>
  _doctorListStreamController.stream;


  StreamSink<List<Doctor>> get doctorListSink =>
   _doctorListStreamController.sink;

  StreamSink<Doctor> get doctorSalaryIncrement => 
   _doctorSalaryIncrementStreamController.sink;

  StreamSink<Doctor> get doctorSalaryDecrement => 
   _doctorSalaryDecrementStreamController.sink;

  

  DoctorBloc(){
    _doctorListStreamController.add(_doctorList);
    
   
    _doctorSalaryIncrementStreamController.stream.listen(_incrementSalary);
    _doctorSalaryDecrementStreamController.stream.listen(_decrementSalary);

  }
  
   _incrementSalary(Doctor doctor){
     double salary = doctor.salary;
     double incrementSalary = salary*20/100;
     
     _doctorList[doctor.id -1].salary = salary + incrementSalary;
     doctorListSink.add(_doctorList);
   }
   _decrementSalary(Doctor doctor){
     double salary = doctor.salary;
     double decrementSalary = salary*20/100;
     
     _doctorList[doctor.id -1].salary = salary - decrementSalary;
     doctorListSink.add(_doctorList);
   }



    void dispose (){
      _doctorListStreamController.close();
      _doctorSalaryIncrementStreamController.close();
      _doctorSalaryDecrementStreamController.close();
    }



}



