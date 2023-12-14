import 'package:flutter/material.dart';
import '../../utils/global.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectCategory = "all";
  bool isSalad = true,isDessert = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
              "Surat City",
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
              )
          ),
          leading: const Icon(Icons.location_on, color: Colors.black,),
          actions:  [
            InkWell(
              onTap:() {
                Navigator.pushNamed(context,"cart");
              },
                child: Icon(Icons.shopping_cart, color: Colors.black)
            ),
          ],
        ),
        body: Column(
            children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.all(10),
                    child: const Text.rich(
                        TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "Find The\t",
                                        style: TextStyle(
                                          fontSize: 40,
                                          color: Colors.black,
                                        )
                                    ),
                                    TextSpan(
                                        text: "Best \nFood",
                                        style: TextStyle(
                                          fontSize: 40,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        )
                                    ),
                                    TextSpan(
                                        text: "\tAround You",
                                        style: TextStyle(
                                          fontSize: 40,
                                          color: Colors.black,
                                        )
                                    )
                                  ]
                              )
                          )
                      ),
                    ],
                  ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left:30,top:15),
                  margin: const EdgeInsets.all(10),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                  color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                ),
                 child: const Row(
                   children: [
                     Icon(Icons.search),
                     Text("\t\tSearch Your Favourite Food",
                       style: TextStyle(
                           fontSize: 20
                       ),
                     )

                   ],
                 ),
                  alignment:Alignment.topLeft,
                )
              ],
            ),
            const SizedBox(
              height: 10,
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                   margin: const EdgeInsets.all(20),
                  child: const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                        text: "Find",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                    TextSpan(
                        text: "\t5km >",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                    ]
                  ),
                )
                )
              ],
            ),
          Container(
           margin: const EdgeInsets.only(left:20),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.start,
            children: [
            DropdownButton(
            value: selectCategory,
            items: const [
              DropdownMenuItem(child: Text("All"), value: "all"),
              DropdownMenuItem(child: Text("Salads"), value: "salads"),
              DropdownMenuItem(child: Text("Dessert"), value: "dessert"),
            ],
    onChanged: (String ? value )
    {
              setState(()
              {
                selectCategory = value;
                if(value=="salads")
                {
                  isSalad=true;
                  isDessert=false;
                }
                else if(value=="dessert")
                {
                  isSalad=false;
                  isDessert=true;
                }
                else
                  {
                    isSalad=true;
                    isDessert=true;
                  }

              }
              );
    },
    )
          ],
        ),
      ),
            const SizedBox(
              height:5
            ),
            Container(
              margin: EdgeInsets.only(left:10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Visibility(
                    visible: isSalad,
                    child: const Text(
                      "Salads",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible:isSalad,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    saladList.length,
                        (index) => InkWell(
                      onTap: () {
                        Map m1 = saladList[index];
                        Navigator.pushNamed(context, 'item',
                            arguments: m1).then((value)=>print("$value"));
                      },
                      child: Container(
                        height: 180,
                        width: 150,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        decoration:  BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black26,
                                  spreadRadius: 2,
                                  blurRadius: 5
                              )
                            ]),
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Visibility(
                                visible: isSalad,
                                child: Image.asset(
                                    "${saladList[index]['image']}",
                                    height: 80,
                                    width: 150
                                )
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Visibility(
                              visible: isSalad,
                              child: Text(
                                "${saladList[index]['name']}",
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Visibility(
                                  visible: isSalad,
                                  child: Text(
                                    "${saladList[index]['time']}",
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                ),
                                Visibility(
                                  visible: isSalad,
                                  child: Text(
                                    "${saladList[index]['rate']}",
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Visibility(
                                  visible: isSalad,
                                  child: Text(
                                    "\$${saladList[index]['price']}",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: isSalad,
                                  child: const Icon(
                                   Icons.add_box,size: 15,color: Colors.green),
                                  ),

                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
              Container(
                margin: EdgeInsets.only(left:10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: isDessert,
                      child: const Text(
                        "Dessert",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: isDessert,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      dessertList.length,
                          (index) => InkWell(
                            onTap: (){
                              Map m1 = dessertList[index];
                              Navigator.pushNamed(context, 'item',
                                  arguments: m1);
                            },
                            child: Container(
                        height: 180,
                        width: 150,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        decoration:  BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black26,
                                    spreadRadius: 2,
                                    blurRadius: 5)
                              ]),
                        alignment: Alignment.center,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Visibility(
                                  visible: isDessert,
                                  child: Image.asset(
                                      "${dessertList[index]['image']}",
                                      height: 80,
                                      width: 150)),
                              const SizedBox(
                                height: 10,
                              ),
                              Visibility(
                                visible: isDessert,
                                child: Text(
                                  "${dessertList[index]['name']}",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Visibility(
                                    visible: isDessert,
                                    child: Text(
                                      "${dessertList[index]['time']}",
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Visibility(
                                visible: isDessert,
                                child: Text(
                                  "${dessertList[index]['rate']}",
                                  style: const TextStyle(
                                    color: Colors.grey,
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                        ),

                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Visibility(
                                    visible: isDessert,
                                    child: Text(
                                      "\$${dessertList[index]['price']}",
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                  ),
                                  Visibility(
                                    visible: isDessert,
                                    child: const Icon(
                                        Icons.add_box,size: 15,color: Colors.green),
                                  ),
                                ],
                              ),
                            ],
                        ),
                      ),
                          ),
                    ),
                  ),
                ),
              ),

            ]
      )
    )
      );

  }
}


