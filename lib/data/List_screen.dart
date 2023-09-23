import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:untitled32/data/product_model.dart';

import '../screen/product_screen.dart';



class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  Future<List<ProductData>> getData() async {

    final res = await http.get(Uri.parse('https://dummyjson.com/products'));
    List<ProductData> dataA = [];
    if (res.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(res.body);
      for (var item in responseData['products']) {
        dataA.add(ProductData.fromjson(item));
      }
    }

    return dataA;
  }



  List<ProductData> myList = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () async {
        var data = await getData();
        myList = data;
        isLoading = false;
        setState(() {

        });
      },
    );
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: SvgPicture.asset(
            'images/dd.svg',

          ),
          leadingWidth: 110,

        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: GridView.builder(
                  itemCount: myList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder:(context)=>ProductScreen(dataK:myList[index],
                            ),
                            ));
                      },

                      child: Container(
                        height: 100,
                        width: 100,
margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.network(
                                myList[index].image,
                              ),
                            ),
                            Text( myList[index].name,),
Text(
  '${myList[index].price.toString()}EGP',
),

                          ],
                        ),
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                ),
              ),
      ),
    );
  }
}
