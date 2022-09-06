import 'package:flutter/material.dart';
import 'package:mobigic/src/inputscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var rowController = TextEditingController();
  var columnController = TextEditingController();
  int row = 0;
  int column = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Mobigic test"),

      ),
      body: SingleChildScrollView(
        child: Container(
          height: height*0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.25,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: height * 0.07,
                      width: width * 0.5,
                      padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0) //
                                ),
                      ),
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: rowController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            hintText: "Enter m(no of rows)", border: InputBorder.none),
                      ),
                    ),
                    Container(
                      height: height * 0.07,
                      width: width * 0.5,
                      padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0),
                        borderRadius: const BorderRadius.all(Radius.circular(
                                5.0) //
                            ),
                      ),
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: columnController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            hintText: "Enter n(no of columns)", border: InputBorder.none),
                            //hintText: "Enter n(no of columns)", border: InputBorder.none),
                      ),
                    ),
                    SizedBox(

                        child: ElevatedButton(
                          onPressed: () {
                            if (rowController.text.isEmpty &&
                                columnController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Enter Proper Values")));
                            } else {
                              if(mounted){




                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InputScreen(
                                          columns: int.parse(columnController.text), rows: int.parse(rowController.text))));
                            }
                            }

                          },
                          child: const Text("Proceed"),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
