import 'package:flutter/material.dart';

import '../authentication/auth.page.dart';

class MainBar extends StatelessWidget implements PreferredSizeWidget {
  const MainBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('OpenBar 1.0'),
      leading: IconButton(
        icon: Icon(Icons.menu,
            color: Theme.of(context).colorScheme.onPrimaryContainer),
        onPressed: () => {},
        tooltip: 'Saved Suggestions',
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.logout,
              color: Theme.of(context).colorScheme.onPrimaryContainer),
          onPressed: () => {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            )
          },
          tooltip: 'Log out',
        ),
        IconButton(
            icon: Container(
                height: 34,
                width: 40,
                child: const CircleAvatar(
                    radius: 48,
                    backgroundImage: NetworkImage(
                      'https://picsum.photos/500/500',
                    ))),
            onPressed: () {}),
      ],
    );
  }
}
