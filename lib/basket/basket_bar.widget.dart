import 'package:flutter/material.dart';

import '../authentication/auth.page.dart';

class BasketBar extends StatelessWidget implements PreferredSizeWidget {
  const BasketBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Panier'),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        onPressed: () => {Navigator.pop(context)},
        tooltip: 'Back',
      ),
      actions: [
        IconButton(
          icon: Container(
              height: 34,
              width: 40,
              child: const CircleAvatar(
                  radius: 48,
                  backgroundImage: NetworkImage(
                    'https://picsum.photos/500/500',
                  ))),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
        ),
      ],
    );
  }
}
