import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wegift/common/colors.dart';
import 'package:wegift/common/widgets/buttons/common_post_login_button.dart';
import 'package:wegift/extensions/build_context_extension.dart';
import 'package:wegift/extensions/list_extension.dart';
import 'package:wegift/extensions/register_state.dart';
import 'package:wegift/src/app/bootstrap/bootstrap.dart';
import 'package:wegift/src/app/router/routes.dart';
import 'package:wegift/src/auth/controllers/auth_controller.dart';
import 'package:wegift/src/auth/domain/entities/we_gift_user/we_gift_user.dart';
import 'package:wegift/src/auth/widgets/signup/follow_invite/search_contact_field.dart';
import 'package:wegift/src/auth/widgets/signup/form_header.dart';
import 'package:wegift/src/auth/widgets/signup/progress_buttons.dart';

class FollowContactView extends StatefulWidget {
  const FollowContactView(
      {super.key, required this.onNext, required this.state});

  final VoidCallback onNext;
  final RegisterState state;

  @override
  State<FollowContactView> createState() => _FollowContactViewState();
}

class _FollowContactViewState extends State<FollowContactView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      initFollowings();
      context.read<AuthController>().initContact();
    });
    super.initState();
  }

  void initFollowings() {
    followedUsersSubscription = context
        .read<Bootstrap>()
        .userService
        .getFollowedUsers()
        .listen((event) {
      setState(() {
        followedUsers = event;
      });
    });
  }

  StreamSubscription? followedUsersSubscription;
  List<WeGiftUser> followedUsers = [];

  @override
  Widget build(BuildContext context) {
    // context.pop();
    return Builder(builder: (context) {
      final controller = context.watch<AuthController>();
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SearchContactField(
          //   onChanged: (v) {
          //     controller.search(v);
          //   },
          // ),
          const SizedBox(height: 20),
          const Icon(
            Icons.sms,
            size: 50,
          ),
          const SizedBox(height: 10),
          const FormHeader(text: "Invite By SMS"),
          // const ContactStateHandler(),
          const SizedBox(height: 20),

          ElevatedButton(
              onPressed: () async {
                final messageBody =
                    '${context.read<AuthController>().wegiftUser.firstName} is on WeGift. Join WeGift now and never miss your friends events. Click on the link to download the app now! \nwww.wegiftapps.com';
                final Uri smsLaunchAndroid = Uri(
                  scheme: 'sms',
                  queryParameters: <String, String>{'body': messageBody},
                );
                final Uri smsLaunchIOS = Uri.parse('sms:' '&body=$messageBody');
                await launchUrl(
                    Platform.isIOS ? smsLaunchIOS : smsLaunchAndroid,
                    mode: LaunchMode.externalApplication);
                // final Uri smsLaunchUri = Uri(
                //   scheme: 'sms',
                //   path: null,
                //   queryParameters: <String, String>{
                //     'body':
                //         '${context.read<AuthController>().wegiftUser.firstName} is on WeGift. Install the app now',
                //   },
                // );
                // await launchUrl(smsLaunchUri);
              },
              child: const Text("Invite")),

          const SizedBox(
            height: 50,
          ),

          // Expanded(
          //   child: Builder(
          //     builder: (context) {
          //       final contacts =
          //           context.watch<AuthController>().searchedContacts;
          //       // final state = context
          // .select((AuthController authCon) => authCon.contactState);
          //       // log(state.toString());

          //       final contactState = controller.contactState;
          //       if (contactState == ContactState.getting) {
          //         return const Center(
          //             child: CircularProgressIndicator.adaptive());
          //       }

          //       return ListView.builder(
          //         itemCount: contacts.length,
          //         // controller.allContacts.length + controller.phoneNumberUsers.length,
          //         itemBuilder: (c, i) {
          //           final contact = contacts[i];

          //           if (contact is WeGiftUser) {
          //             return ListTile(
          //               leading: contact.userDetails?.photoUrl != null
          //                   ? CircleAvatar(
          //                       backgroundImage: NetworkImage(
          //                           contact.userDetails!.photoUrl!))
          //                   : CircleAvatar(
          //                       child:
          //                           Text(contact.firstName[0].toUpperCase())),
          //               title: Text("${contact.firstName} ${contact.lastName}"),
          //               subtitle: Text(contact.username ?? ""),
          //               trailing: CommonPostLoginButton(
          //                 isFilled: true,
          //                 btnColor: kPrimaryColor,
          //                 btnText: followedUsers
          //                         .any((element) => element.uid == contact.uid)
          //                     ? "Following"
          //                     : "Follow",
          //                 height: 35,
          //                 width: 90,
          //                 borderRadius: 50,
          //                 onTap: () {
          //                   context.read<AuthController>().followUser(contact);
          //                 },
          //               ),
          //             );
          //           } else if (contact is Contact) {
          //             return ListTile(
          //               leading: contact.avatar != null
          //                   ? CircleAvatar(
          //                       backgroundImage: MemoryImage(contact.avatar!))
          //                   : const Icon(CupertinoIcons.person),
          //               title: Text(contact.displayName ?? ""),
          //               subtitle: Text(contact.phones!.isNotEmpty
          //                   ? contact.phones?.existsAt(0)?.value ?? ""
          //                   : ""),
          //               trailing: CommonPostLoginButton(
          //                 height: 35,
          //                 width: 90,
          //                 isFilled: true,
          //                 btnColor: kPrimaryColor,
          //                 borderRadius: 50,
          //                 btnText: 'Invite',
          //                 onTap: () {
          //                   Share.share(
          //                       "Username1 invited you to look WeGift app.\nhttps://www.google.com/invite");
          //                 },
          //               ),
          //             );
          //           } else {
          //             return const SizedBox();
          //           }
          //         },
          //       );
          //     },
          //   ),
          // ),

          Flexible(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: ProgressButtons(
                onNext: () async {
                  if (Platform.isIOS) {
                    final upperContent = context;
                    showDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                        title: const Text("Data Permission"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "WeGift wants to upload your personal data to its server for seameless functionality of the application. Do you consent ?",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextButton(
                                onPressed: () async {
                                  final url =
                                      "https://docs.google.com/document/d/e/2PACX-1vRIsBD1l_QmfOfanMbPnzXzLl6gcrfbHIeZGN_OFR5Y8GM0UOKKNEnFdp01q3MkGelBJRi5xt8ZEJwu/pub";

                                  await launchUrlString(url);
                                },
                                child: const Text(
                                  "Privacy Policy",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 17),
                                )),
                          ],
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                upperContent.pop();
                              },
                              child: const Text("Deny")),
                          TextButton(
                              onPressed: () {
                                upperContent.pop();
                                FocusScope.of(upperContent).unfocus();

                                final controller =
                                    upperContent.read<AuthController>();
                                controller.setUserData(
                                    onSuccess: () {
                                      upperContent
                                          .offAll(AppRouter.mainPageView);
                                    },
                                    onError: () {});
                              },
                              child: const Text("Allow")),
                        ],
                      ),
                    );
                  } else {
                    FocusScope.of(context).unfocus();

                    final controller = context.read<AuthController>();
                    controller.setUserData(
                        onSuccess: () {
                          context.offAll(AppRouter.mainPageView);
                        },
                        onError: () {});
                  }
                },
                primaryButtonText: widget.state.primaryButtonText,
                secondaryButtonText: widget.state.secondaryButtonText,
              ),
            ),
          ),
        ],
      );
    });
  }

  @override
  void dispose() {
    followedUsersSubscription?.cancel();
    super.dispose();
  }
}
