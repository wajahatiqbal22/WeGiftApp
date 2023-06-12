import 'dart:developer';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wegift/common/colors.dart';
import 'package:wegift/common/widgets/buttons/common_post_login_button.dart';
import 'package:wegift/extensions/build_context_extension.dart';
import 'package:wegift/extensions/list_extension.dart';
import 'package:wegift/extensions/string_extension.dart';
import 'package:wegift/src/auth/controllers/auth_controller.dart';
import 'package:wegift/src/auth/domain/entities/we_gift_user/we_gift_user.dart';
import 'package:wegift/src/auth/widgets/signup/follow_invite/search_contact_field.dart';
import 'package:wegift/src/auth/widgets/signup/form_header.dart';

class InviteFriends extends StatefulWidget {
  const InviteFriends({super.key, required this.inviteBy});

  final InviteBy inviteBy;

  @override
  State<InviteFriends> createState() => _FollowContactViewState();
}

class _FollowContactViewState extends State<InviteFriends> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // initFollowings();
      context.read<AuthController>().initContact(isFromRegistration: false);
    });
    super.initState();
  }

  // void initFollowings() {
  //   followedUsersSubscription =
  //       context.read<Bootstrap>().userService.getFollowedUsers().listen((event) {
  //     setState(() {
  //       followedUsers = event;
  //     });
  //   });
  // }

  // StreamSubscription? followedUsersSubscription;
  // List<WeGiftUser> followedUsers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Invite by ${widget.inviteBy.name.capitalizeFirstLetter}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Builder(builder: (context) {
          final controller = context.watch<AuthController>();
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FormHeader(text: "Find friends and family"),
              // SizedBox(height: context.height * 0.08),
              const SizedBox(height: 10),
              SearchContactField(
                onChanged: (v) {
                  controller.search(v);
                },
              ),

              // const ContactStateHandler(),
              const SizedBox(height: 40),
              Expanded(
                child: Builder(
                  builder: (context) {
                    final contacts = context.watch<AuthController>().searchedContacts;
                    final contactState = controller.contactState;
                    if (contactState == ContactState.getting) {
                      return const Center(child: CircularProgressIndicator.adaptive());
                    }

                    return ListView.builder(
                      itemCount: contacts.length,
                      // controller.allContacts.length + controller.phoneNumberUsers.length,
                      itemBuilder: (c, i) {
                        final contact = contacts[i];

                        if (contact is WeGiftUser) {
                          return ListTile(
                            leading: contact.userDetails?.photoUrl != null
                                ? CircleAvatar(
                                    backgroundImage: NetworkImage(contact.userDetails!.photoUrl!))
                                : CircleAvatar(child: Text(contact.firstName[0].toUpperCase())),
                            title: Text("${contact.firstName} ${contact.lastName}"),
                            subtitle: Text(contact.username ?? ""),
                            trailing: CommonPostLoginButton(
                              isFilled: true,
                              btnColor: kPrimaryColor,
                              btnText:
                                  // followedUsers.any((element) => element.uid == contact.uid)
                                  //     ? "Following"
                                  //     :
                                  "Follow",
                              height: 35,
                              width: 90,
                              borderRadius: 50,
                              onTap: () {
                                context.read<AuthController>().followUser(contact);
                              },
                            ),
                          );
                        } else if (contact is Contact) {
                          return ListTile(
                            leading: contact.avatar != null
                                ? CircleAvatar(backgroundImage: MemoryImage(contact.avatar!))
                                : const Icon(CupertinoIcons.person),
                            title: Text(contact.displayName ?? ""),
                            subtitle: Text(contact.phones!.isNotEmpty
                                ? contact.phones?.existsAt(0)?.value ?? ""
                                : ""),
                            trailing: CommonPostLoginButton(
                              height: 35,
                              width: 90,
                              isFilled: true,
                              btnColor: kPrimaryColor,
                              borderRadius: 50,
                              btnText: 'Invite',
                              onTap: () async {
                                if (widget.inviteBy == InviteBy.sms) {
                                  await showDialog(
                                    context: context,
                                    builder: (context) {
                                      String contactNo = '';
                                      if (contact.phones != null && contact.phones!.isNotEmpty) {
                                        contactNo = contact.phones!.first.value!;
                                      }
                                      return InviteBySMSDialog(
                                        inviter: context.read<AuthController>().wegiftUser,
                                        contactNo: contactNo.replaceAll(
                                            RegExp(r"\p{P}|\s+", unicode: true), ""),
                                        onDone: () {
                                          context.showSnackbar("Invitation sent successfully!");
                                          context.pop();
                                        },
                                      );
                                    },
                                  );
                                } else if (widget.inviteBy == InviteBy.share) {
                                  Share.share(
                                      "${context.read<AuthController>().wegiftUser.firstName} invited you to look WeGift app.\nhttps://www.google.com/invite");
                                }
                              },
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    );
                  },
                ),
              ),

              // Flexible(
              //   flex: 0,
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(vertical: 12.0),
              //     child: ProgressButtons(
              //       onNext: () async {
              //         FocusScope.of(context).unfocus();

              //         final controller = context.read<AuthController>();
              //         controller.setUserData(
              //             onSuccess: () {
              //               context.offAll(AppRouter.MainPageView);
              //             },
              //             onError: () {});
              //       },
              //       primaryButtonText: "Done",
              //     ),
              //   ),
              // ),
            ],
          );
        }),
      ),
    );
  }

  @override
  void dispose() {
    // followedUsersSubscription?.cancel();
    super.dispose();
  }
}

class InviteBySMSDialog extends StatefulWidget {
  const InviteBySMSDialog({
    Key? key,
    required this.contactNo,
    required this.inviter,
    required this.onDone,
  }) : super(key: key);
  final String contactNo;
  final Function() onDone;
  final WeGiftUser inviter;

  @override
  State<InviteBySMSDialog> createState() => _InviteBySMSDialogState();
}

class _InviteBySMSDialogState extends State<InviteBySMSDialog> with AutomaticKeepAliveClientMixin {
  final TextEditingController _phone = TextEditingController();
  late final PhoneNumber phone = PhoneNumber(isoCode: "US", phoneNumber: widget.contactNo);
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        width: context.width * 0.9,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Invite by SMS",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Text(
                'Is this number correct to invite?',
                textAlign: TextAlign.start,
              ),
              InternationalPhoneNumberInput(
                formatInput: false,
                textFieldController: TextEditingController(text: widget.contactNo),
                initialValue: phone,
                validator: (v) {
                  final regex = RegExp(
                      r"\+(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|2[98654321]\d|9[8543210]|8[6421]|6[6543210]|5[87654321]|4[987654310]|3[9643210]|2[70]|7|1)\d{1,14}$");
                  // if (!regex.hasMatch(_phone.text)) {
                  //   return "Invalid phone number.";
                  // }
                  if (_phone.text.length < 11) {
                    return "Invalid phone number";
                  }
                  return null;
                },
                ignoreBlank: true,
                onInputChanged: (phoneNumber) {
                  _phone.text = phoneNumber.phoneNumber ?? "";
                },
                maxLength: 15,
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  leadingPadding: 0,
                  trailingSpace: false,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.transparent,
                        side: const BorderSide(color: Colors.red)),
                    onPressed: () {
                      context.pop();
                    },
                    child: const Text("Cancel"),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () async {
                      await sendInvitation(_phone.text, widget.inviter.firstName, onSuccess: () {
                        widget.onDone();
                      }, onError: () {
                        context.showSnackbar(
                            "Something went wrong when inviting ${widget.contactNo}. Make sure the number is correct and try again!");
                      });
                    },
                    child: const Text("Invite"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> sendInvitation(String phone, String inviter,
      {Function()? onSuccess, Function()? onError}) async {
    FirebaseFunctions _functions = FirebaseFunctions.instance;
    final inviteFriendBySMS = _functions.httpsCallable("inviteFriendBySMS");
    final data = {"phone": phone, "inviter": inviter};
    try {
      await inviteFriendBySMS.call(data);
      onSuccess?.call();
    } catch (e) {
      log("ERROR: $e");
      onError?.call();
    }
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

enum InviteBy { sms, email, share }
