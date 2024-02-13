import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:rive/rive.dart';
import 'package:vroom_app/app/app_colors.dart';

import '../app_enums.dart';
import 'app_text/text_600.dart';

class AppStateHandler extends StatelessWidget {
  late final Widget child;
  late final GeneralLoadingState loadingState;
  late final Widget? loadingWidget;
  late final Widget? emptyWidget;
  late final Widget? offlineWidget;
  late final Function()? onRetry;
  final bool hasRefreshIndicator;
  final ScrollController? scrollController;

  AppStateHandler(
      {required this.child,
      required this.loadingState,
      this.loadingWidget,
      this.emptyWidget,
      this.offlineWidget,
      this.hasRefreshIndicator: false,
      this.scrollController,
      this.onRetry});

  @override
  Widget build(BuildContext context) {
    Widget childToReturn = Container();
    if (loadingState == GeneralLoadingState.done) {
      childToReturn = child;
    } else if (loadingState == GeneralLoadingState.waiting) {
      childToReturn = Center(
        child: loadingWidget ??
            Container(
              // padding: EdgeInsets.all(200),
              width: 92,
              height: 92,
              child: RiveAnimation.asset(
                'assets/images/vroom_animation.riv',
                // fit: BoxFit.fitWidth,
              ),
            ),
      );
    } else if ( loadingState == GeneralLoadingState.offline){

      childToReturn = (offlineWidget !=null ? offlineWidget : emptyWidget !=null ? emptyWidget :   Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Remix.emotion_happy_fill,
              size: 120,
              color: Colors.orangeAccent,
            ),
            SizedBox(
              height: 20,
            ),
            Text600(
              text: "Hmmm, its seems quite in here. For now ;)",
            ),
            SizedBox(
              height: 20,
            ),
            onRetry != null
                ? ElevatedButton(
                onPressed: onRetry,
                child: Text(
                  "Try again",
                  style: TextStyle(color: Colors.white),
                ))
                : Container()
          ],
        ),
      ))!;
    }


    else if (loadingState == GeneralLoadingState.empty) {
      childToReturn = emptyWidget ??
          Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Remix.emotion_happy_fill,
                  size: 120,
                  color: Colors.orangeAccent,
                ),
                SizedBox(
                  height: 20,
                ),
                Text600(
                  text: "Hmmm, its seems quite in here. For now ;)",
                ),
                SizedBox(
                  height: 20,
                ),
                onRetry != null
                    ? ElevatedButton(
                        onPressed: onRetry,
                        child: Text(
                          "Try again",
                          style: TextStyle(color: Colors.white),
                        ))
                    : Container()
              ],
            ),
          );
    }  else if (loadingState == GeneralLoadingState.error) {
      childToReturn = Container(
        decoration: BoxDecoration(
            color: AppColors.background
        ),
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Remix.error_warning_fill,
              size: 120,
              color: AppColors.primary,
            ),
            SizedBox(
              height: 20,
            ),
            Text600(
              text:
                  "Oooops! We can't reach our server at the moment,\nPlease check your connection and try again",
            ),
            SizedBox(
              height: 20,
            ),
            onRetry != null
                ? ElevatedButton(
                    onPressed: onRetry,
                    child: Text(
                      "Try again",
                      style: TextStyle(color: Colors.white),
                    ))
                : Container()
          ],
        ),
      );
    }
    if (hasRefreshIndicator) {
      return RefreshIndicator(
          child: childToReturn,
          onRefresh: () {
            if (onRetry != null) onRetry!();
            return Future.value(true);
          });
    }
    return childToReturn;
  }
}
