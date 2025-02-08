import 'package:flutter/material.dart';
import 'package:star_github/core/models/hive_model.dart';
import 'package:star_github/presentation/common_widgets/custom_appbar.dart';

import '../../utils/services/date_formatter.dart';

class DetailsScreen extends StatelessWidget {
  final Item? item;

  const DetailsScreen({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    debugPrint('----------------------------------${item?.updatedAt ?? ''}');
    String date = DateFormatter().formatDateString(item?.updatedAt ?? '');

    return Scaffold(
      backgroundColor: Color(0xFF0d1117),
      appBar: AppBar(title: Text('Repo Owner Details')),
      body: SingleChildScrollView(
        // Allow the content to scroll
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // The image section can now scroll
              Container(
                padding: EdgeInsets.all(16),
                color: Color(0xFF161b22),
                child: Center(
                  child: Column(
                    spacing: 24,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Container(
                          color: Colors.grey,
                          child: Image.network(
                            item?.owner?.avatarUrl ?? '',
                            fit: BoxFit.cover,
                            width: 150,  // Set a smaller width
                            height: 150, // Set a smaller height
                          ),
                        ),
                      ),
                      Container(
                        width: 350,
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.1),
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: Colors.white.withOpacity(.15)),
                        ),
                        child: Text(
                          textAlign: TextAlign.center,
                          item?.owner?.login ?? '',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 4,
                thickness: 0.1,
              ),
              // Repository details
              Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                color: Color(0xFF161b22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Repository Name : ${item?.name ?? ''}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      'Repository Description : ${item?.description ?? ''}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      'Last update : $date',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
