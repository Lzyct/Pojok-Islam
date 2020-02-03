part of 'home_widget.dart';

class TimeShalatAdapter extends StatelessWidget {
  final String prayerTime;

  const TimeShalatAdapter({Key key, @required this.prayerTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var waktuShalat = prayerTime.split(";");
    List<TimeShalat> listShalat = []
      ..add(TimeShalat("${waktuShalat[0]}", "Subuh"))
      ..add(TimeShalat("${waktuShalat[1]}", "Syuruq"))
      ..add(TimeShalat("${waktuShalat[2]}", "Dzuhur"))
      ..add(TimeShalat("${waktuShalat[3]}", "Ashar"))
      ..add(TimeShalat("${waktuShalat[4]}", "Maghrib"))
      ..add(TimeShalat("${waktuShalat[5]}", "Isya"));


    return ListView.builder(
      itemCount: listShalat.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        //check isPassed or not
        DateFormat dateFormat = DateFormat.Hm();
        DateTime timeNow = DateTime.now();

        List<int> listIsPassed = [];
        List<int> listNotYet = [];
        int nextTime;

        //loop to check state isPassed or not
        for (int i = 0; i < listShalat.length; i++) {
          DateTime shalatTime = dateFormat.parse(listShalat[i].shalatTime);
          shalatTime = new DateTime(timeNow.year, timeNow.month, timeNow.day,
              shalatTime.hour, shalatTime.minute);
          if (timeNow.isAfter(shalatTime)) {
            listIsPassed.add(i);
          } else {
            if (nextTime == null) {
              nextTime = i;
            } else if (nextTime != i) {
              listNotYet.add(i);
            }
          }
        }

        Color textColor;
        if (listIsPassed.contains(index)) {
          textColor = Palette.textDisable;
        } else if (listNotYet.contains(index)) {
          textColor = Palette.textPrimary;
        } else {
          textColor = Colors.white;
        }

        var textSizeTitle = 0.0;
        var textSizeSummary = 0.0;
        var contentPadding = EdgeInsets.fromLTRB(
            Dimens.Space4, Dimens.Space2, Dimens.Space4, Dimens.Space2);
        var contentBoxShadow = new BoxShadow(
            spreadRadius: 5, color: Colors.black12, blurRadius: 5);
        if (listIsPassed.contains(index) || listNotYet.contains(index)) {
          textSizeTitle = Dimens.Subheading1;
          textSizeSummary = Dimens.Body1;
          contentPadding = EdgeInsets.fromLTRB(
              Dimens.Space2, Dimens.Space2, Dimens.Space2, Dimens.Space2);
          contentBoxShadow = new BoxShadow(
              spreadRadius: 0, color: Colors.transparent, blurRadius: 0);
        } else {
          textSizeTitle = Dimens.Subheading1;
          textSizeSummary = Dimens.Body1;
          contentPadding = EdgeInsets.fromLTRB(
              Dimens.Space8, Dimens.Space2, Dimens.Space8, Dimens.Space2);
          contentBoxShadow = new BoxShadow(
              spreadRadius: Dimens.Space2,
              color: Colors.black12,
              blurRadius: 5);
        }

        return Container(
          decoration: new BoxDecoration(
              boxShadow: [contentBoxShadow],
              gradient:
                  (listIsPassed.contains(index) || listNotYet.contains(index))
                      ? context.gradientButTransparent()
                      : context.gradientPrimary(),
              borderRadius: new BorderRadius.only(
                  bottomLeft: const Radius.circular(Dimens.Space16),
                  bottomRight: const Radius.circular(Dimens.Space16),
                  topLeft: const Radius.circular(Dimens.Space16),
                  topRight: const Radius.circular(Dimens.Space16))),
          padding: contentPadding,
          margin: EdgeInsets.all(Dimens.Space2),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(listShalat[index].shalatTime,
                    style: TextStyle(
                      color: textColor,
                      fontSize: textSizeTitle,
                      fontWeight: FontWeight.w700,
                    )),
                Text(
                  listShalat[index].shalatName,
                  style: TextStyle(
                      color: textColor,
                      fontSize: textSizeSummary,
                      fontWeight: FontWeight.normal),
                )
              ]),
        );
      },
    );
  }
}
