import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_place/parallex_effect_section.dart';

import 'data.dart';
import 'detail_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String>placeList=["Asia","Europe","Africa","Australia"];
  int selectIndex=0;
 final  Color primaryColor=const Color(0xfff9c42a);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f7f7),
      appBar: AppBar(
        backgroundColor: const Color(0xfff7f7f7),
        centerTitle: false,
        leading:const  Padding(
          padding:  EdgeInsets.only(left: 10),
          child:   CircleAvatar(
            backgroundImage: AssetImage("assets/profile.jpeg"),
          ),
        ),
        title: Column(
          children: [
            Text("Dev Learner",style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),),
            Text("@dev_73arner",style: Theme.of(context).textTheme.titleMedium,)
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.filter_list))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Experience Your Summer in",style: Theme.of(context).textTheme.headlineMedium,),
            Text("Portugal",style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),),
           const  SizedBox(height: 20,),
            Container(
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 20,
                    offset: const Offset(5,5)
                  )
                ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for(int i=0;i<placeList.length;i++)...[
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          selectIndex=i;
                        });
                      },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(placeList[i],style: Theme.of(context).textTheme.bodyLarge?.copyWith(color:selectIndex==i? primaryColor :const  Color(0xff858585),),),
                            selectIndex==i?  CircleAvatar(radius: 5,backgroundColor: primaryColor,):const SizedBox()
                          ],
                        ))

                  ]
                ],
              ),

            ),
           const  SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              const   Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Popular"),
                    Text("Choices Place")
                  ],
                ),
                IconButton(onPressed: (){}, icon:const  Icon(Icons.more_horiz))
              ],
            ),
            const SizedBox(height: 20,),
           // Parallex Widget
           const  ParallexWidget(),
            const  SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text("Favorites",style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                Text("See all",style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold,color: primaryColor)),
              ],
            ),
            const SizedBox(height: 20,),
           ListView.builder(
             physics:const  NeverScrollableScrollPhysics(),
             itemCount: newtravelPlaceList.length,
               shrinkWrap: true,
               itemBuilder: (context,index){
             return Container(
               margin:const  EdgeInsets.only(top: 10),
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   color: Colors.white,
                   boxShadow: [
                     BoxShadow(
                         color: Colors.grey.shade200,
                         blurRadius: 20,
                         offset: const Offset(5,5)
                     )
                   ]
               ),
               padding: const EdgeInsets.all(10),
               child: ListTile(
                 onTap: (){
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailScreen(data:newtravelPlaceList[index])));
                 },
                   leading: Hero(
                     tag:newtravelPlaceList[index].imageUrl,
                     child: ClipRRect(
                         borderRadius: BorderRadius.circular(10),
                         child: SizedBox(
                           width: 80,
                             height: 80,
                             child: Image.asset(newtravelPlaceList[index].imageUrl,fit: BoxFit.fill,))),
                   ),
                   title:Text(newtravelPlaceList[index].name,style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)) ,
                   subtitle:Text(newtravelPlaceList[index].place,style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)) ,
                   trailing:const  Icon(Icons.more_horiz)
               ),
             );
           }),
            const SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }
}
