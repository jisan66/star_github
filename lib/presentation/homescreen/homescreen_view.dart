import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF17181c),
      appBar: AppBar(title: Text("Most Starred Repo"),
      centerTitle: true,
      elevation: 0,
      // foregroundColor: Colors.transparent,
     backgroundColor: Color(0xFF17181c),),
      body: ListView.separated(
        controller: _scrollController, // Attach controller here
        itemCount: 100,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Repo Title", style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w600),),
                    Text("Repo Name", style: TextStyle(color: Colors.white, fontSize: 14,fontWeight: FontWeight.w400),),
                    Row(
                      spacing: 8,
                      children: [
                        Icon(Icons.star, color: Colors.yellow,size: 18,),
                        Text("2323", style: TextStyle(color: Colors.white, fontSize: 14,fontWeight: FontWeight.w400),),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                  width:20,
                  child: ClipOval(
                    child: Container(
                      color: Colors.white, // Ensures no background color
                      child: Icon(
                        weight: 12,
                        Icons.arrow_forward_ios,
                        color: Color(0xFF17181c), // Dark color
                        size: 14,
                      ),
                    ),
                  ),
                )
              ],
            )
          );
        }, separatorBuilder: (BuildContext context, int index) {
          return Divider(color: Colors.white54,height: .05,);
      },
      ),
    );
  }
}
