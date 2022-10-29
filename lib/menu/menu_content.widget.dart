import 'package:flutter/material.dart';
import 'package:openbar/authentication/auth.model.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthModel>(
      builder: (context, authdata, child) => Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: Container(
                  height: 34,
                  width: 40,
                  child: const CircleAvatar(
                    radius: 48,
                    backgroundImage: NetworkImage(
                      'https://picsum.photos/500/500',
                    ),
                  ),
                ),
                onPressed: () {},
              ),
              Text(
                authdata.getUsername(),
              )
            ],
          ),
          Row(
            children: authdata.groups
                .map(
                  (group) => Chip(
                    label: Text(
                      group,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shadowColor: Theme.of(context).colorScheme.primary,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
