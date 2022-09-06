import 'dart:developer';

import 'package:flutter/material.dart';

import 'grid.dart';
import 'homescreen.dart';

class InputScreen extends StatefulWidget {
  final int columns;
  final int rows;

  const InputScreen({Key? key, required this.columns, required this.rows})
      : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  late List textList;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    textList =
        List.filled(widget.columns * widget.rows, null, growable: false);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,

        appBar: AppBar(
          title: Center(child: Text('Input Screen')),

        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width*0.3,vertical: 20),
              child: SizedBox(
                height: height*0.75,
                child: ListView.builder(
                    itemCount: widget.rows * widget.columns,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(

                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        //padding: EdgeInsets.all(5),

                        child: TextFormField(
                          textAlign: TextAlign.center,

                          scrollPadding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom ),
                          onChanged: (value) {
                            textList[index] = value;
                            if (textList.length ==
                                widget.rows * widget.columns &&
                                !textList.contains(null)) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CustomGridView(
                                              textList:
                                              textList,
                                              columns: widget.columns,
                                              rows: widget.rows)));
                            }
                          },
                          decoration: InputDecoration(
                              //disabledBorder: InputBorder.none,
                              hintText:
                              "Enter ${index + 1} alphabet"),
                        ),
                      );
                    }),
              ),
            ),

            ElevatedButton(onPressed: (){
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomeScreen()));
            }, child: Text('Go Back'))
          ],
        ));

  }
}
