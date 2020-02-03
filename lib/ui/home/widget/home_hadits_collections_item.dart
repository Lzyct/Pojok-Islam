part of 'home_widget.dart';

class HaditsCollections extends StatelessWidget {
  const HaditsCollections({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(
              Dimens.Space16, Dimens.Space8, Dimens.Space16, Dimens.Space8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                Strings.haditsCollections,
                style: TextStyle(
                    color: Palette.colorPrimary,
                    fontSize: Dimens.Subheading1,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              GestureDetector(
                onTap: (){
                  print("hadits collection");
                },
                child: Text(
                  Strings.seeAll,
                  style: TextStyle(color: Palette.colorPrimary),
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: context.heightInPercent(context, 14),
          margin: EdgeInsets.only(left: Dimens.Space8, right: Dimens.Space8),
          child: ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                    width: context.widthInPercent(context, 50),
                    child: Card(
                        child: Container(
                      padding: EdgeInsets.all(Dimens.Space16),
                      child: Text(
                          Strings.loremIpsum,overflow: TextOverflow.fade,),
                    )));
              }),
        )
      ],
    );
  }
}
