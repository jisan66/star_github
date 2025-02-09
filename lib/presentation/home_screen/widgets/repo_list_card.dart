import 'package:flutter/material.dart';
import 'package:star_github/core/models/hive_model.dart';
import 'package:star_github/utils/themes/custom_theme.dart';

import '../../details_screen/details_screen.dart';

class RepoListCard extends StatelessWidget {
  Item? item;
  RepoListCard({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => DetailsScreen(item: item)),
        );
      },
      child: Container(
        color: primaryColor,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Repo Name: ${item?.name ?? 'No Name Found'}',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Repo Full Name: ${item?.fullName ?? "No Name Found"}',
                    style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 18),
                      SizedBox(width: 5),
                      Text(
                        item?.score.toString() ?? '',
                        style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF17181c),
                        size: 14,
                      ),
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
