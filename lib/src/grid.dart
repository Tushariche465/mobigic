import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mobigic/src/homescreen.dart';

class CustomGridView extends StatefulWidget {
  final List textList;
  final int columns;
  final int rows;

  const CustomGridView(
      {Key? key,
        required this.textList,
        required this.columns,
        required this.rows})
      : super(key: key);

  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  String search = '';

  @override
  void initState() {
    super.initState();
    log("Length from input : ${widget.textList}");
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: Text('Result'),
        ),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(11, 5, 11, 5),
            padding: EdgeInsets.symmetric(horizontal: 30),
            height: height * 0.06,
            decoration: BoxDecoration(
              border: Border.all(width: 1.0),
              borderRadius: const BorderRadius.all(
                  Radius.circular(11)
              ),
            ),

            child:  TextFormField(
                onChanged: (value) {
                  if (mounted) {
                    setState(() {
                      search = value;
                    });
                  }
                },
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: "Search Elements"),
              ),
            ),

          Center(
            child: Container(
              margin: const EdgeInsets.all(7),
              height: height * 0.67,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: widget.columns,
                      ),
                  itemCount: widget.textList.length,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        padding: EdgeInsets.all(height*0.04),
                        child: TextFormField(
                          textAlign: TextAlign.center,

                          initialValue: widget.textList[index],
                          style: TextStyle(
                              fontSize:  search.contains(widget.textList[index])?height*0.045:height*0.025,
                              color: search.contains(widget.textList[index])
                                  ? Colors.cyanAccent
                                  : Colors.white,
                              fontWeight:
                              search.contains(widget.textList[index])
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            setState(() {
                              widget.textList[index] = value;
                            });
                          },
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: (){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
              child: Text('Homepage'),
            ),
          )
        ],
      ),
    );
  }
}