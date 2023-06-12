import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewScreen extends StatelessWidget {
  WebViewScreen({Key? key, required this.args}) : super(key: key);
  final WebViewScreenArgs args;
  late InAppWebViewController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(args.initialUrl)),
        onUpdateVisitedHistory: (controller, url, androidIsReload) {
          args.onNavigated(url.toString());
        },
        onWebViewCreated: (controller) {
          this.controller = controller;
        },
        iosOnNavigationResponse: (controller, navigationResponse) {
          return Future.value(IOSNavigationResponseAction.ALLOW);
        },

        // javascriptMode: JavascriptMode.unrestricted,
        // initialUrl: url,
        // initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
        // navigationDelegate: (request) {
        //   url = request.url;
        //   print(url);
        //   return NavigationDecision.navigate;
        // },
      ),
      // WebView(
      //   initialUrl: args.initialUrl,
      //   onWebResourceError: (e) {
      //     log("ERROR: ${e.description}");
      //   },
      //   javascriptMode: JavascriptMode.unrestricted,
      //   initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
      //   navigationDelegate: (request) {
      //     args.onNavigated(request.url);

      //     return NavigationDecision.navigate;
      //   },
      // ),
    );
  }
}

class WebViewScreenArgs {
  final String initialUrl;
  final Function(String?) onNavigated;

  WebViewScreenArgs({required this.initialUrl, required this.onNavigated});
}
