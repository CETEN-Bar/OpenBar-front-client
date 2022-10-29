import 'package:flutter/material.dart';

class MenuTile extends StatelessWidget {
  final String title;
  final String description;
  final Color backgroundColor;
  final Widget nextPage;
  const MenuTile(
      {super.key,
      required this.title,
      required this.description,
      required this.backgroundColor,
      required this.nextPage});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                description,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        )
      },
    );
  }
}
