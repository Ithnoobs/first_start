import 'package:first_start/model/employee.dart';
import 'package:first_start/screens/list_view_detail.dart';
import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<Employee> listEmployee = [];

  @override
  void initState() {
    super.initState();
    _getAllEmployee();
  }

  _getAllEmployee(){
    listEmployee.add(Employee(id: 1, name: 'Employee 1', gender: "Male", phoneNumber: "08123456789"));
    listEmployee.add(Employee(id: 2, name: 'Employee 2', gender: "Female", phoneNumber: "08123456780"));
    listEmployee.add(Employee(id: 3, name: 'Employee 3', gender: "Male", phoneNumber: "08123456781"));
    listEmployee.add(Employee(id: 4, name: 'Employee 4', gender: "Female", phoneNumber: "08123456782"));
    listEmployee.add(Employee(id: 5, name: 'Employee 5', gender: "Male", phoneNumber: "08123456783"));
    listEmployee.add(Employee(id: 6, name: 'Employee 6', gender: "Female", phoneNumber: "08123456784"));
    listEmployee.add(Employee(id: 7, name: 'Employee 7', gender: "Male", phoneNumber: "08123456785"));
    listEmployee.add(Employee(id: 8, name: 'Employee 8', gender: "Female", phoneNumber: "08123456786"));
    listEmployee.add(Employee(id: 9, name: 'Employee 9', gender: "Male", phoneNumber: "08123456787"));
    listEmployee.add(Employee(id: 10, name: 'Employee 10', gender: "Female", phoneNumber: "08123456788"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text('List View Employee', style:  TextStyle(color: Colors.black),)),
      ),
      body: ListView.builder(
        itemCount: listEmployee.length,
        itemBuilder: (BuildContext context, int index){
          var employee = listEmployee[index];
        return Container(
            margin: EdgeInsets.only(top: 10, left: 14, right: 14),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return ListViewDetail();
                }));
              },
            leading: Icon(Icons.account_circle),
            title: Text('${employee.name}', style: TextStyle(color: Colors.blueAccent)),
            subtitle: Text('${employee.phoneNumber}'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          );
      })   
    );
  }
}