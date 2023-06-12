import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wegift/common/widgets/custom_app_bar.dart';
import 'package:wegift/common/widgets/policy_helper/policy_helper.dart';
import 'package:wegift/src/utils/helper.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Privacy Policy", backBtn: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TermsHeader(headerText: "Privacy Policy"),
              const TermsPara(
                  paraText:
                      "WeGift built the WeGift app as a Free app. This SERVICE is provided by WeGift at no cost and is intended for use as is. This page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service. If you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy. The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which are accessible at WeGift unless otherwise defined in this Privacy Policy."),
              TermsTextGroup(
                  title: "Information Collection and Use",
                  subTitle:
                      "For a better experience, while using our Service, we may require you to provide us with certain personally identifiable information, including but not limited to First Name, Last Name, Phone Number, Email, Anniversary, Birthday, Profile Photo.. The information that we request will be retained by us and used as described in this privacy policy. The app does use third-party services that may collect information used to identify you. Link to the privacy policy of third-party service providers used by the app"),
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
              TermsTextGroup(
                  title: "Log Data",
                  subTitle:
                      "We want to inform you that whenever you use our Service, in a case of an error in the app we collect data and information (through third-party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing our Service, the time and date of your use of the Service, and other statistics."),
              TermsTextGroup(
                  title: "Cookies",
                  subTitle:
                      "Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory. This Service does not use these “cookies” explicitly. However, the app may use third-party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service."),
              TermsTextGroup(
                  title: "Service Providers",
                  subTitle:
                      "We may employ third-party companies and individuals due to the following reasons:"),
              Bullet(bullets: [
                BulletModel(bulletString: "To facilitate our Service;"),
                BulletModel(
                    bulletString: "To provide the Service on our behalf;"),
                BulletModel(
                    bulletString: "To perform Service-related services; or"),
                BulletModel(
                    bulletString:
                        "To assist us in analyzing how our Service is used.")
              ]),
              const TermsPara(
                  paraText:
                      "We want to inform users of this Service that these third parties have access to their Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose."),
              TermsTextGroup(
                  title: "Security",
                  subTitle:
                      "We value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security."),
              TermsTextGroup(
                  title: "Links to Other Sites",
                  subTitle:
                      "This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services."),
              TermsTextGroup(
                  title: "Children’s Privacy",
                  subTitle:
                      "These Services do not address anyone under the age of 13. We do not knowingly collect personally identifiable information from children under 13 years of age. In the case we discover that a child under 13 has provided us with personal information, we immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do the necessary actions."),
              TermsTextGroup(
                  title: "Changes to This Privacy Policy",
                  subTitle:
                      "We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page\nThis policy is effective as of 2022-09-05"),
              TermsTextGroup(
                  title: "Contact Us",
                  subTitle:
                      "If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at wegiftapp@gmail.com."),
              // Text("wdad"),
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
                          text: 'This privacy policy page was created at ',
                        ),
                        WidgetSpan(
                            child: InkWell(
                                onTap: () {
                                  launchUrlString(
                                      'https://privacypolicytemplate.net/');
                                },
                                child: const Text(
                                  "privacypolicytemplate.net ",
                                  style: TextStyle(color: Colors.blue),
                                ))),
                        const TextSpan(text: 'and modified/generated by '),
                        WidgetSpan(
                            child: InkWell(
                                onTap: () {
                                  launchUrlString(
                                      'https://app-privacy-policy-generator.nisrulz.com/');
                                },
                                child: const Text(
                                  "App Privacy Policy Generator.",
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
