import 'package:flutter/material.dart';
import 'package:star_github/presentation/common_widgets/custom_appbar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF17181c),
      appBar: AppBar(title: Text( 'Repo Owner Details')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(16),
                color: Color(0xFF24292E),
                child: Center(
                  child: Column(
                    spacing: 24,
                    children: [
                      ClipRRect(borderRadius: BorderRadius.all(Radius.circular(20)),child: Container(color: Colors.red,child: Icon(Icons.camera, color: Colors.white54,size: 120),)),
                      Text('Owner\'s Name',style: Theme.of(context).textTheme.titleLarge,),
                    ],
                  ),
                ),
              ),
            ),
            // SizedBox(height: 8),
            Divider(height: 4, thickness: 0.1,),
            // SizedBox(height: 8),
            Expanded(
              flex: 5,
              child: Container(
                padding: EdgeInsets.all(12),
                width: double.infinity,
                color: Color(0xFF24292E),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text('Repository Name',style: Theme.of(context).textTheme.titleMedium,),
                    Text('Repository Description',style: Theme.of(context).textTheme.titleSmall,),
                    Text('Last update : 20-02-2024',style: Theme.of(context).textTheme.bodyLarge,),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
