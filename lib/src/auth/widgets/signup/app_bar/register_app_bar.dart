import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wegift/extensions/build_context_extension.dart';
import 'package:wegift/extensions/register_state.dart';
import 'package:wegift/src/auth/controllers/auth_controller.dart';

class RegisterScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const RegisterScreenAppBar({
    Key? key,
    required this.onBack,
    required this.onNext,
  }) : super(key: key);

  final VoidCallback onBack, onNext;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "WeGift",
        style: context.textTheme.headline4?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      leading: IconButton(
        onPressed: onBack,
        icon: const Icon(
          Icons.chevron_left,
          size: 40,
        ),
      ),
      actions: [
        // Builder(builder: (context) {
        //   final registerState =
        //       context.select((AuthController value) => value.getRegisterState);

        //   return registerState.isContactScreens
        //       ? TextButton(
        //           onPressed: () {
        //             context.read<AuthController>().initContact();
        //           },
        //           child: Row(
        //             children: const [
        //               Icon(Icons.refresh),
        //               Padding(
        //                 padding: EdgeInsets.all(8.0),
        //                 child: Text('Refresh'),
        //               ),
        //             ],
        //           ),
        //         )
        //       : const SizedBox.shrink();
        // }),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 50);
}
