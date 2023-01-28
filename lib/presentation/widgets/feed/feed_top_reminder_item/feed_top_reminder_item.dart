part of widgets;

class FeedTopReminderItem extends StatelessWidget {
  const FeedTopReminderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Stack(
          alignment: AlignmentDirectional.center,
          clipBehavior: Clip.none,
          children: [
            IconButton(
              onPressed: () {
                context.push(Routes.remindersPage);
              },
              icon: Icon(
                Icons.notifications_none_rounded,
                color: AppPalette.blackColor,
                size: 27.h,
              ),
            ),
            Consumer(builder: (_, ref, __) {
              final isReminderExist = ref.watch(
                isTodayReminderExistProvider,
              );
              return Positioned(
                left: 22.w,
                bottom: 29.h,
                child: b.Badge(
                  toAnimate: true,
                  showBadge: isReminderExist,
                  shape: b.BadgeShape.square,
                  position: b.BadgePosition.topEnd(),
                  animationType: b.BadgeAnimationType.scale,
                  animationDuration: Durations.twoHundredMillisecondsDuration,
                  badgeColor: AppPalette.mainPurpleColor,
                  borderRadius: BorderRadius.circular(30),
                ),
              );
            }),
          ]),
    );
  }
}
