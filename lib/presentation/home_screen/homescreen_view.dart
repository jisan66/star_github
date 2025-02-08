import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_github/core/models/hive_model.dart';
import 'package:star_github/presentation/common_widgets/custom_appbar.dart';
import 'package:star_github/presentation/details_screen/details_screen.dart';
import 'package:star_github/presentation/home_screen/bloc/home_screen_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 100) {
      _currentPage++;
      context.read<StarGithubBloc>().add(FetchStarGithubRepos(page: _currentPage)); // Trigger pagination
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StarGithubBloc()..add(FetchStarGithubRepos(page: 1)),
      child: Scaffold(
        backgroundColor: Color(0xFF17181c),
        appBar: AppBar(title: Text("Most Starred Repo")),
        body: BlocBuilder<StarGithubBloc, StarGithubState>(
          builder: (context, state) {
            if (state is StarGithubLoading) {
              return Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            } else if (state is StarGithubLoaded) {
              return RefreshIndicator(
                onRefresh: () async {
                  // Dispatch the event to refresh data
                  context.read<StarGithubBloc>().add(FetchStarGithubRepos(page: 1));
                },
                child: ListView.separated(
                  controller: _scrollController,
                  physics: const AlwaysScrollableScrollPhysics(), // Ensures refresh works even when list is empty
                  itemCount: state.items.length + 1 ,
                  itemBuilder: (context, index) {
                    if (index == state.items.length) {
                      // Show loading indicator when reaching the end
                      return state.hasMoreData
                          ? Center(child: CircularProgressIndicator())
                          : SizedBox();
                    }
                    Item item = state.items[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => DetailsScreen()));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Repo Name: ${item.name ?? 'No Name Found'}',
                                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'Repo Full Name: ${item.fullName ?? "No Name Found"}',
                                  style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.yellow, size: 18),
                                    SizedBox(width: 5),
                                    Text(
                                      item.score.toString(),
                                      style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: ClipOval(
                                child: Container(
                                  color: Colors.white,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF17181c),
                                    size: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(color: Colors.white54, height: 0.05);
                  },
                ),
              );
            } else if (state is StarGithubError) {
              return Center(
                child: Text(
                  "Error: ${state.message}",
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
            return Center(
              child: Text(
                "No Data Available",
                style: TextStyle(color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }
}
