import 'dart:developer';
import 'dart:io';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:wegift/common/colors.dart';
import 'package:wegift/common/widgets/buttons/common_post_login_button.dart';
import 'package:wegift/common/widgets/custom_app_bar.dart';
import 'package:wegift/constants/notifications.dart';
import 'package:wegift/extensions/build_context_extension.dart';
import 'package:wegift/extensions/date_time_extension.dart';
import 'package:wegift/extensions/string_extension.dart';
import 'package:wegift/src/app/router/routes.dart';
import 'package:wegift/src/auth/controllers/auth_controller.dart';
import 'package:wegift/src/auth/domain/entities/we_gift_user/we_gift_user.dart';
import 'package:wegift/src/auth/domain/services/notifiers/auth_state.dart';
import 'package:wegift/src/bottom_nav_bar/screen/app_bottom_nav.dart';
import 'package:wegift/src/home/model/notifications_settings.dart';
import 'package:wegift/src/profile/widgets/profile_settings_tile.dart';
import 'package:wegift/src/search/controller/search_controller.dart';

class ProfileSetting extends StatefulWidget {
  ProfileSetting({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileSetting> createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController userNameController = TextEditingController();

  final TextEditingController birthdayController = TextEditingController();

  final TextEditingController anniversaryController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final Map<NotificationTypes, bool> optionEvents = {};

  final _formKey = GlobalKey<FormState>();
  late WeGiftUser user = context.read<AuthController>().wegiftUser;

  @override
  void initState() {
    final controller = context.read<AuthController>();
    final user = controller.wegiftUser;

    firstNameController.text = user.firstName;
    lastNameController.text = user.lastName;
    userNameController.text = user.username ?? "";
    phoneController.text = user.phoneNumber ?? "";
    birthdayController.text = user.userDetails!.birthday != null
        ? DateFormat("MM/dd/yyyy").format(user.userDetails!.birthday!)
        : "";
    anniversaryController.text = user.userDetails!.anniversary != null
        ? DateFormat("MM/dd/yyyy").format(user.userDetails!.anniversary!)
        : "";
    for (final e in optionalEvents) {
      optionEvents[e] = user.userDetails?.optionalEvents[e] ?? false;
    }
    emailController.text = user.email;
    super.initState();
  }

  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Profile Settings", backBtn: true),
      bottomNavigationBar: const AppBottomNav(),
      body: Builder(builder: (context) {
        final controller = context.read<AuthController>();
        return SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 40),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            maximumSize: Size(context.width * 0.8, 44)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            controller.updateUser(user, photo: file,
                                onSuccess: (user) {
                              context.showSnackbar(
                                  "Successfully updated your profile");
                            }, onError: (e) {
                              context.showSnackbar(e.message ?? "",
                                  isError: true);
                            });
                          }
                        },
                        child: Builder(builder: (context) {
                          final isLoading = context.select(
                              (AuthController value) =>
                                  value.loadingState == LoadingState.loading);
                          return isLoading
                              ? const CircularProgressIndicator.adaptive()
                              : const Text("Done");
                        }),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: file != null
                      ? FileImage(file!)
                      : user.userDetails!.photoUrl != null
                          ? NetworkImage(user.userDetails!.photoUrl!)
                              as ImageProvider
                          : null,
                  child: file == null && user.userDetails!.photoUrl == null
                      ? Text(
                          "${user.firstName} ${user.lastName}".initals,
                          style: const TextStyle(fontSize: 48),
                        )
                      : null,
                ),
                const SizedBox(height: 20),
                CommonPostLoginButton(
                  borderRadius: 10,
                  btnText: "Change Photo",
                  onTap: () async {
                    final file = await ImagePicker().pickImage(
                        source: ImageSource.gallery, imageQuality: 30);
                    if (file != null) {
                      setState(() {
                        this.file = File(file.path);
                      });
                    }
                  },
                ),
                SizedBox(height: context.height * 0.04),
                ProfileSettingTiles(
                  validator: (v) {
                    if (v?.isEmpty ?? false) {
                      return "Cannot be empty";
                    }
                    return null;
                  },
                  onChanged: (v) {
                    user = user.copyWith(firstName: v);
                  },
                  label: "First Name",
                  hintText: "Will",
                  controller: firstNameController,
                ),
                ProfileSettingTiles(
                  validator: (v) {
                    if (v?.isEmpty ?? false) {
                      return "Cannot be empty";
                    }
                    return null;
                  },
                  onChanged: (v) {
                    user = user.copyWith(lastName: v);
                  },
                  label: "Last Name",
                  hintText: "Smith",
                  controller: lastNameController,
                ),
                ProfileSettingTiles(
                  isEnabled: false,
                  label: "Username",
                  hintText: "Smith72",
                  controller: userNameController,
                ),
                ProfileSettingTiles(
                  masks: [
                    MaskTextInputFormatter(
                        mask: '###-###-####',
                        filter: {"#": RegExp(r'[0-9]')},
                        type: MaskAutoCompletionType.lazy)
                  ],
                  isEnabled:
                      controller.services.authService.user.phoneNumber == null,
                  label: "Phone",
                  hintText: "574-123-4567",
                  controller: phoneController,
                  validator: (v) {
                    if (v?.isEmpty ?? false) {
                      return "Cannot be empty";
                    }
                    return null;
                  },
                ),
                ProfileSettingTiles(
                  label: "Email",
                  hintText: "wsmith72@gmail.com",
                  controller: emailController,
                  validator: (v) {
                    final emailRegex = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                    if (!emailRegex.hasMatch(v!)) {
                      return "Incorrect email!";
                    }
                    return null;
                  },
                ),
                ProfileSettingTiles(
                  onTap: () async {
                    final now = DateTime.now();
                    final DateTime? date = await showDatePicker(
                      context: context,
                      initialDate: user.userDetails!.birthday!,
                      firstDate: user.userDetails!.birthday!
                          .subtract(const Duration(days: 365 * 100)),
                      lastDate: now,
                    );
                    if (date != null &&
                        (DateTime.now().year - date.year) >= 17) {
                      user = user.copyWith(
                        userDetails: user.userDetails?.copyWith(
                          birthday: date,
                          dobAsString: date.getDateMonthAsString(),
                        ),
                      );
                      birthdayController.text =
                          user.userDetails!.birthday != null
                              ? DateFormat("MM/dd/yyyy")
                                  .format(user.userDetails!.birthday!)
                              : "";
                    } else {
                      context.showSnackbar(
                          "You need to be atleast 17 years old !",
                          isError: true);
                    }
                  },
                  validator: (v) {
                    if (v?.isEmpty ?? false) {
                      return "Cannot be empty";
                    }
                    return null;
                  },
                  label: "Birthday",
                  masks: [
                    MaskTextInputFormatter(
                        mask: '##/##/####',
                        filter: {"#": RegExp(r'[0-9]')},
                        type: MaskAutoCompletionType.lazy)
                  ],
                  hintText: "mm/dd/yyyy",
                  controller: birthdayController,
                ),
                ProfileSettingTiles(
                  masks: [
                    MaskTextInputFormatter(
                        mask: '##/##/####',
                        filter: {"#": RegExp(r'[0-9]')},
                        type: MaskAutoCompletionType.lazy)
                  ],
                  onTap: () async {
                    final now = DateTime.now();
                    final DateTime? date = await showDatePicker(
                      context: context,
                      initialDate: user.userDetails!.anniversary ?? now,
                      firstDate: (user.userDetails!.anniversary ?? now)
                          .subtract(const Duration(days: 365 * 100)),
                      lastDate: now.add(const Duration(days: 365 * 100)),
                    );
                    if (date != null) {
                      user = user.copyWith(
                        userDetails: user.userDetails?.copyWith(
                            anniversary: date,
                            aniversaryAsString: date.getDateMonthAsString()),
                      );

                      anniversaryController.text =
                          user.userDetails!.anniversary != null
                              ? DateFormat("MM/dd/yyyy")
                                  .format(user.userDetails!.anniversary!)
                              : "";
                      setState(() {});
                    }
                  },
                  label: "Anniversay",
                  hintText: "mm/dd/yyyy",
                  controller: anniversaryController,
                  isRemovable: true,
                ),
                const SizedBox(height: 20),
                // Builder(
                //   builder: (context) {
                //     return Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Padding(
                //           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
                //           child: Row(
                //             children: const [
                //               Text(
                //                 'Optional Events',
                //                 style: TextStyle(
                //                   fontSize: 20,
                //                   fontWeight: FontWeight.w500,
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //         ...optionEvents.entries
                //             .map(
                //               (e) => EventTiles(
                //                 value: optionEvents[e.key] ?? false,
                //                 onChanged: (v) {
                //                   setState(() {
                //                     optionEvents[e.key] = v;
                //                     user = user.copyWith(
                //                         userDetails: user.userDetails
                //                             ?.copyWith(optionalEvents: optionEvents));
                //                   });
                //                 },
                //                 titleStyle: GoogleFonts.poppins(
                //                   fontSize: 14,
                //                   fontWeight: FontWeight.w500,
                //                 ),
                //                 text: e.key.constructedName,
                //                 isNotifcationSection: false,
                //               ),
                //             )
                //             .toList(),
                //       ],
                //     );
                //   },
                // ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    showDeleteUserDialogue(
                      context,
                      onSucess: () {
                        context.offAll(AppRouter.onboarding);
                      },
                      onError: (error) {
                        context.pop();
                        context.showSnackbar(error);
                      },
                      onLoading: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Row(
                                    children: const [
                                      Center(
                                        child: CircularProgressIndicator
                                            .adaptive(),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        "Deleting your account...",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ));
                      },
                    );
                  },
                  child: const Text("Delete Account"),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

void showDeleteUserDialogue(BuildContext context,
    {required Function onSucess,
    required Function onLoading,
    required Function(String error) onError}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Column(
            children: const [
              Center(child: Text('Delete Account')),
              Divider(
                thickness: 1,
              )
            ],
          ),
          icon: const Icon(
            Icons.delete,
            size: 35,
            color: Colors.red,
          ),
          content: Column(mainAxisSize: MainAxisSize.min, children: const [
            Text(
                "This process is irreversible. Are you sure you want to delete your account?"),
          ]),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text("Cancel")),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () async {
                try {
                  context.pop();
                  onLoading.call();
                  await context.read<AuthController>().deleteUser();
                  onSucess.call();
                } on FirebaseFunctionsException catch (e, stk) {
                  onError.call(e.message!);
                  // context.showSnackbar(e.message!);
                }
              },
              child: const Text('Delete'),
            )
          ],
        );
      });
}
