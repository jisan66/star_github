import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_github/core/models/hive_model.dart';
import 'package:star_github/presentation/common_widgets/custom_appbar.dart';
import 'package:star_github/presentation/details_screen/details_screen.dart';
import 'package:star_github/presentation/home_screen/bloc/home_screen_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StarGithubBloc()..add(FetchStarGithubRepos()),
      child: Scaffold(
        backgroundColor: Color(0xFF17181c),
        appBar: AppBar(title: Text("Most Starred Repo",)),
        body: BlocBuilder<StarGithubBloc, StarGithubState>(
            builder: (context, state){
              if(state is StarGithubLoading){
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              }
              else if (state is StarGithubLoaded){
                return ListView.separated(
                  controller: _scrollController, // Attach controller here
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    Item item = state.items[index];
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>DetailsScreen()));
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                spacing: 8,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Repo Name : ${item.name ?? 'No Name Found'}', style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w600),),
                                  Text('Repo Full Name : ${item.fullName ?? "No Name Found"}', style: TextStyle(color: Colors.white, fontSize: 14,fontWeight: FontWeight.w400),),
                                  Row(
                                    spacing: 8,
                                    children: [
                                      Icon(Icons.star, color: Colors.yellow,size: 18,),
                                      Text(item.score.toString(), style: TextStyle(color: Colors.white, fontSize: 14,fontWeight: FontWeight.w400),),
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
                      ),
                    );
                  }, separatorBuilder: (BuildContext context, int index) {
                  return Divider(color: Colors.white54,height: .05,);
                },
                );
              }
              else if (state is StarGithubError)
                {
                  return Center(child: Text("Error: ${state.message}"));
                }
              return Center(child: Text("No Data Available"));
            }
        ),
      ),
    );
  }
}
