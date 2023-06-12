import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wegift/src/utils/helper.dart';

class TermsPara extends StatelessWidget {
  const TermsPara({
    Key? key,
    required this.paraText,
  }) : super(key: key);
  final String paraText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Text(
        "$paraText",
        style: getNormalText.copyWith(
            color: Colors.grey[600], fontSize: 14, height: 1.6),
      ),
    );
  }
}

class TermsHeader extends StatelessWidget {
  const TermsHeader({
    Key? key,
    required this.headerText,
  }) : super(key: key);
  final String headerText;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Text(
          headerText,
          style: getPrimaryText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class TermsTextGroup extends StatelessWidget {
  TermsTextGroup({required this.title, required this.subTitle, Key? key})
      : super(key: key);
  String title;
  String subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: getPrimaryText,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            subTitle,
            style: getNormalText.copyWith(
                color: Colors.grey[600], fontSize: 14, height: 1.6),
          ),
        ],
      ),
    );
  }
}

class LinkText extends StatelessWidget {
  const LinkText({required this.linkTitle, required this.link, super.key});
  final String linkTitle;
  final String link;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await launchUrlString(link);
      },
      child: Text(
        linkTitle,
        style:
            getNormalText.copyWith(color: Colors.blue, fontSize: 15, height: 0),
      ),
    );
  }
}

class Bullet extends StatelessWidget {
  const Bullet({required this.bullets, super.key});
  final List<BulletModel> bullets;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Column(
        children: bullets.map((strone) {
          return Row(children: [
            const Text(
              "\u2022",
              style: TextStyle(fontSize: 20),
            ), //bullet text
            const SizedBox(
              width: 10,
            ), //space between bullet and text
            Expanded(
              child: InkWell(
                onTap: strone.link != null
                    ? () async {
                        await launchUrlString(strone.link!);
                      }
                    : null,
                child: Text(
                  strone.bulletString,
                  style: getNormalText.copyWith(
                      color:
                          strone.link != null ? Colors.blue : Colors.grey[700],
                      fontSize: 15,
                      height: 0),
                ),
              ), //text
            )
          ]);
        }).toList(),
      ),
    );
  }
}

class BulletModel {
  String bulletString;
  String? link;

  BulletModel({required this.bulletString, this.link});
}
