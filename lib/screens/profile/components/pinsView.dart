import 'package:flutter/material.dart';
import 'package:rena/models/pin.dart';
import 'package:rena/screens/profile/components/PinInfo.dart';

class PinsView extends StatefulWidget {
  final Pins pins = new Pins();
  @override
  _PinsViewState createState() => _PinsViewState();
}

class _PinsViewState extends State<PinsView> {
  int _selectedIndex;
  PageController _pageController =
      PageController(viewportFraction: 1, initialPage: 0);
  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle themeActive = Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 20);

    TextStyle themeInactive = themeActive.copyWith(
      color: Theme.of(context).textTheme.bodyText1.color.withOpacity(0.6),
    );
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Flexible(
          flex: 1,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: widget.pins.pinCategories.length,
              itemBuilder: (BuildContext ctx, int index) {
                return TextButton(
                    child: Text(widget.pins.pinCategories[index],
                        style: (this._selectedIndex != index)
                            ? themeInactive
                            : themeActive),
                    onPressed: () => _pageController.jumpToPage(index));
              })),
      Flexible(
          flex: 4,
          child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int pageIndex) {
                _selected(pageIndex);
              },
              itemCount: widget.pins.pinCategories.length,
              itemBuilder: (context, pageIndex) {
                return GridView.builder(
                    itemCount: widget.pins.pins[pageIndex].length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (BuildContext ctx, int index) {
                      return this
                          .getPinWidget(widget.pins.pins[pageIndex][index]);
                    });
              }))
    ]);
  }

  Widget getPinWidget(Pin pinData) {
    Widget pinIcon, result;
    if (pinData.isAcquied()) {
      pinIcon = Image.asset(pinData.imageURL);
      result = GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext ctx2) {
                  return PinInfo(pinData);
                });
          },
          child: pinIcon);
    } else {
      result = ColorFiltered(
        colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcATop),
        child: Image.asset(pinData.imageURL),
      );
    }
    return result;
  }

  void _selected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
