import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wegift/common/widgets/custom_app_bar.dart';
import 'package:wegift/common/widgets/policy_helper/policy_helper.dart';
import 'package:wegift/src/utils/helper.dart';

class TermsOfServices extends StatelessWidget {
  const TermsOfServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Terms of Service", backBtn: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TermsHeader(headerText: "Privacy Policy"),
              const TermsPara(
                  paraText:
                      "By downloading or using the app, these terms will automatically apply to you – you should make sure therefore that you read them carefully before using the app. You’re not allowed to copy or modify the app, any part of the app, or our trademarks in any way. You’re not allowed to attempt to extract the source code of the app, and you also shouldn’t try to translate the app into other languages or make derivative versions. The app itself, and all the trademarks, copyright, database rights, and other intellectual property rights related to it, still belong to WeGift. WeGift is committed to ensuring that the app is as useful and efficient as possible. For that reason, we reserve the right to make changes to the app or to charge for its services, at any time and for any reason. We will never charge you for the app or its services without making it very clear to you exactly what you’re paying for. The WeGift app stores and processes personal data that you have provided to us, to provide our Service. It’s your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone’s security features and it could mean that the WeGift app won’t work properly or at all. The app does use third-party services that declare their Terms and Conditions. Link to Terms and Conditions of third-party service providers used by the app"),
              Bullet(
                bullets: [
                  BulletModel(
                      bulletString: "Google Play Services",
                      link: "https://www.google.com/policies/privacy/"),
                  BulletModel(
                      bulletString: "Google Analytics for Firebase",
                      link: "https://firebase.google.com/policies/analytics"),
                  BulletModel(
                      bulletString: "Firebase Crashlytics",
                      link: "https://firebase.google.com/support/privacy/"),
                  BulletModel(
                      bulletString: "Facebook",
                      link:
                          "https://www.facebook.com/about/privacy/update/printable"),
                ],
              ),
              const TermsPara(
                  paraText:
                      "You should be aware that there are certain things that WeGift will not take responsibility for. Certain functions of the app will require the app to have an active internet connection. The connection can be Wi-Fi or provided by your mobile network provider, but WeGift cannot take responsibility for the app not working at full functionality if you don’t have access to Wi-Fi, and you don’t have any of your data allowance left. If you’re using the app outside of an area with Wi-Fi, you should remember that the terms of the agreement with your mobile network provider will still apply. As a result, you may be charged by your mobile provider for the cost of data for the duration of the connection while accessing the app, or other third-party charges. In using the app, you’re accepting responsibility for any such charges, including roaming data charges if you use the app outside of your home territory (i.e. region or country) without turning off data roaming. If you are not the bill payer for the device on which you’re using the app, please be aware that we assume that you have received permission from the bill payer for using the app.\n\nAlong the same lines, WeGift cannot always take responsibility for the way you use the app i.e. You need to make sure that your device stays charged – if it runs out of battery and you can’t turn it on to avail the Service, WeGift cannot accept responsibility. With respect to WeGift’s responsibility for your use of the app, when you’re using the app, it’s important to bear in mind that although we endeavor to ensure that it is updated and correct at all times, we do rely on third parties to provide information to us so that we can make it available to you. WeGift accepts no liability for any loss, direct or indirect, you experience as a result of relying wholly on this functionality of the app. At some point, we may wish to update the app. The app is currently available on Android & iOS – the requirements for the both systems(and for any additional systems we decide to extend the availability of the app to) may change, and you’ll need to download the updates if you want to keep using the app. WeGift does not promise that it will always update the app so that it is relevant to you and/or works with the Android & iOS version that you have installed on your device. However, you promise to always accept updates to the application when offered to you, We may also wish to stop providing the app, and may terminate use of it at any time without giving notice of termination to you. Unless we tell you otherwise, upon any termination, (a) the rights and licenses granted to you in these terms will end; (b) you must stop using the app, and (if needed) delete it from your device."),
              TermsTextGroup(
                  title: "Changes to This Terms and Conditions",
                  subTitle:
                      "We may update our Terms and Conditions from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Terms and Conditions on this page.\nThese terms and conditions are effective as of 2022-09-05"),
              TermsTextGroup(
                  title: "Contact Us",
                  subTitle:
                      "If you have any questions or suggestions about our Terms and Conditions, do not hesitate to contact us at wegiftapp@gmail.com."),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RichText(
                    text: TextSpan(
                      style: getNormalText.copyWith(
                          color: Colors.grey[600], fontSize: 15, height: 1.6),
                      children: [
                        const TextSpan(
                          text:
                              'This Terms and Conditions page was generated by ',
                        ),
                        WidgetSpan(
                            child: InkWell(
                                onTap: () {
                                  launchUrlString(
                                      'https://app-privacy-policy-generator.nisrulz.com/');
                                },
                                child: const Text(
                                  "App Privacy Policy Generator",
                                  style: TextStyle(color: Colors.blue),
                                ))),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
