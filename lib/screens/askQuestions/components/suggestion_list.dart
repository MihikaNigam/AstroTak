import 'package:astro_tak/utils/app_color.dart';
import 'package:flutter/material.dart';

class SuggestionList extends StatelessWidget {
  final List<dynamic> suggList;
  final myfunc;
  const SuggestionList({Key? key, required this.suggList, this.myfunc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () => myfunc(suggList[i].toString()),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 20, 3),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.ac_unit_rounded,
                    color: primary,
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      suggList[i].toString(),
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
              color: grey,
              indent: 15,
              endIndent: 15,
              thickness: 1.5,
            ),
        itemCount: suggList.length);
  }
}
