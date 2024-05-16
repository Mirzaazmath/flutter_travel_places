import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:travel_place/data.dart';

import 'detail_screen.dart';

class ParallexWidget extends StatefulWidget {
  const ParallexWidget({super.key});

  @override
  State<ParallexWidget> createState() => _ParallexWidgetState();
}

class _ParallexWidgetState extends State<ParallexWidget> {
  /// PAGEVIEW CONTROLLER
  /// viewportFraction IS THE SIZE FOR PER PAGE
  PageController pageController = PageController(viewportFraction: 0.6);

  /// CREATE AN OFFSET TO HANDLE THE PARALLAX EFFECT
  double pageOffSet = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// PAGECONTROLLER addListener
    pageController.addListener(() {
      /// WHEN EVER THE CHANGES HAPPEN IT TRIGGER SET START WHICH CHANGE THE OFFSET VALUE
      /// OFFSET VALUE IS REALLY NEEDED TO PERFORM PARALLAX EFFECT
      setState(() {
        pageOffSet = pageController.page!;
      });

      /// PRINTING THE  CHANGES
      debugPrint(pageOffSet.toString());
    });
  }

  /// MAKE SURE TO DISPOSE THE CONTROLLER TO PREVENT MEMORY LEAK
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,

      /// HERE WE ARE USING THE PAGEVIEW BUILDER FOR OUR EFFECT
      child: PageView.builder(

          /// CONTROLLER
          controller: pageController,

          /// COUNT
          itemCount: travelPlaceList.length,
          itemBuilder: (context, index) {
            /// PRINTING THE VALUE
            debugPrint("${-pageOffSet.abs() + index}");
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailScreen(data:travelPlaceList[index])));
                        },
                        child: Hero(
                          tag:travelPlaceList[index].imageUrl,
                          child: SizedBox(
                            height: 300,

                            /// TWO THINGS TO UNDER WHILE USING CREATING THE PARALLAX EFFECT
                            /// 1. MAKE SURE TO ADD Alignment AND PASS THE OFFSET VALUE
                            /// 2. MAKE SURE TO USE BoxFit.cover, ONLY
                            child: Image.asset(
                              travelPlaceList[index].imageUrl,
                              fit: BoxFit.cover,
                              alignment: Alignment(-pageOffSet.abs() + index, 0),
                            ),
                          ),
                        ),
                      )),

                  /// POSITION FOR TEXT
                  Positioned(
                      bottom: 20,
                      right: 0,
                      left: 0,
                      child: Container(
                        margin: const EdgeInsets.only(left: 5, right: 5),
                        height: 60,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
                            child: Container(
                              margin: const EdgeInsets.only(left: 10, right: 10),
                              height: 60,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10)),
                              child:Column(
                                children: [
                                  Text(travelPlaceList[index].name,style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
                                  Text(travelPlaceList[index].place,style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white,),),
                                ],
                              )
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            );
          }),
    );
  }
}
