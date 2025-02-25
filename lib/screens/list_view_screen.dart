import 'package:first_start/model/employee.dart';
import 'package:first_start/screens/form_employee.dart';
import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<Employee> listEmployee = [];
  List<Employee> filteredListEmployee = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getAllEmployee();
    searchController.addListener(_filterEmployees);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  _getAllEmployee() {
    listEmployee.add(Employee(id: 1, name: 'Sereyrith', gender: "Male", phoneNumber: "08123456789"));
    listEmployee.add(Employee(id: 2, name: 'Sothanroth', gender: "Male", phoneNumber: "08123456780"));
    listEmployee.add(Employee(id: 3, name: 'Sopanha', gender: "Male", phoneNumber: "08123456781"));
    listEmployee.add(Employee(id: 4, name: 'Lita', gender: "Female", phoneNumber: "08123456782"));
    listEmployee.add(Employee(id: 5, name: 'Nyka', gender: "Female", phoneNumber: "08123456783"));
    filteredListEmployee = List.from(listEmployee);
  }

  _filterEmployees() {
    setState(() {
      filteredListEmployee = listEmployee
          .where((employee) => employee.name?.toLowerCase().contains(searchController.text.toLowerCase()) ?? false)
          .toList();
    });
  }

  _operationEmployee(Employee employee) {
    if(employee.id == 0){
      setState(() {
        employee.id = listEmployee.length + 1;
        listEmployee.add(employee);
      });
    }else{
      int index = listEmployee.indexWhere((element) => element.id == employee.id);
      setState(() {
        listEmployee[index] = employee;
      }); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text('List View Employee', style:  TextStyle(color: Colors.black),)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredListEmployee.length,
              itemBuilder: (BuildContext context, int index) {
                var employee = filteredListEmployee[index];
                return Container(
                  margin: EdgeInsets.only(top: 10, left: 14, right: 14),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return FormEmployee(employee: employee);
                      })).then((onValue){
                        if(null != onValue.name){
                          _operationEmployee(onValue);
                        }
                      });
                    },
                    leading: Icon(Icons.account_circle),
                    title: Text('${employee.name}', style: TextStyle(color: Colors.blueAccent)),
                    subtitle: Text('${employee.phoneNumber}'),
                    trailing: InkWell(
                      onTap: (){
                        setState(() {
                          listEmployee.removeAt(index);
                        });
                      },
                      child: Icon(Icons.delete, color: Colors.red, size: 30,),
                    )
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return FormEmployee();
          })).then((onValue){
            _operationEmployee(onValue);
          });
        }, 
        backgroundColor: Colors.green,
        child: Icon(Icons.add, color: Colors.white,), 
        ),
      
    );
  }
}