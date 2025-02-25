import 'package:first_start/model/employee.dart';
import 'package:first_start/widgets/custom_input_widgets.dart';
import 'package:flutter/material.dart';

class FormEmployee extends StatefulWidget {
  final Employee? employee;
  
  const FormEmployee({super.key, this.employee});

  @override
  State<FormEmployee> createState() => _FormEmployeeState();
}

class _FormEmployeeState extends State<FormEmployee> {
  
  bool selectedGender = true;
  var employee = Employee();
  var nameController = TextEditingController(); 
  var phoneNumberController = TextEditingController();

  @override
  void initState() {
    employee.id = 0;
    if(null != widget.employee?.name){
      setState(() {
        employee = widget.employee!;
        nameController.text = employee.name??"";
        phoneNumberController.text = employee.phoneNumber??"";
        if(employee.gender != "Male"){
          selectedGender = false;
        }
      });
    }
    super.initState();
  }

  _onCreateEmployee(){
    if(nameController.text.isEmpty){
      return;
    }else if(phoneNumberController.text.isEmpty){
      return;
    }else{
      employee.gender = selectedGender == true ? "Male" : "Female";
      employee.name = nameController.text;
      employee.phoneNumber = phoneNumberController.text;
      Navigator.pop(context, employee);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.green,iconTheme: IconThemeData(color: Colors.black),
        title: Center(child: Text('Form Employee', style:  TextStyle(color: Colors.black),)),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 35, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomInputWidgets(
              controller: nameController,
              prefixIcon: Icons.account_circle,
              labelText: 'Name',
              hintText: 'Input your name',
            ),
            const SizedBox(height: 20),
            CustomInputWidgets(
              controller: phoneNumberController,
              prefixIcon: Icons.phone,
              labelText: 'Phone Number',
              hintText: 'Input your phone number',
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              child: Text("Select your gender", style: TextStyle(fontSize: 16, color: Colors.black),),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedGender = true;
                      });
                    },
                    child: Row(
                    children: [
                      selectedGender == true ? Icon(Icons.check_circle, color: Colors.blueAccent,) : Icon(Icons.check_circle_outline),
                      SizedBox(width: 4,),
                      Text("Male", style: TextStyle(fontSize: 16, color: Colors.black),)
                    ],
                  ),
                  ),
                  SizedBox(width: 30,),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedGender = false;
                      });
                    },
                    child: Row(
                    children: [ 
                      selectedGender == false ? Icon(Icons.check_circle, color: Colors.blueAccent,) : Icon(Icons.check_circle_outline),
                      SizedBox(width: 4,),
                      Text("Female", style: TextStyle(fontSize: 16, color: Colors.black),)
                    ],
                  ),
                  )
                ],
              )
            ),
            SizedBox(height: 40),
            InkWell(
              onTap: (){
                _onCreateEmployee();
              },
              child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  employee.name == null ? "Create" : "Update", 
                  style: TextStyle(fontSize: 20, color: Colors.white),),
              ),
            ),
            )
        ],),
      ),
    );
  }
}