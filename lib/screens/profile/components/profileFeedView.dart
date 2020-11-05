import 'package:flutter/material.dart';
import 'package:rena/models/postModel.dart';
import 'package:rena/models/scoreBoard.dart';

class ProfileFeedView extends StatefulWidget {
  PostsModel posts;
  ProfileFeedView(ProfileEntry user) {
    posts = new PostsModel(user);
  }
  @override
  _ProfileFeedViewState createState() => _ProfileFeedViewState();
}

class _ProfileFeedViewState extends State<ProfileFeedView> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    TextStyle inactiveTheme = Theme.of(context).textTheme.caption;
    TextStyle activeTheme = inactiveTheme.copyWith(
        decoration: TextDecoration.underline,
        decorationColor: Theme.of(context).highlightColor);
    return Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(children: [
          Row(children: [
            TextButton(
                onPressed: () {
                  _selectIndex(0);
                },
                child: Text(
                  'Nyast först',
                  style: (_selectedIndex == 0) ? activeTheme : inactiveTheme,
                )),
            TextButton(
                onPressed: () {
                  _selectIndex(1);
                },
                child: Text(
                  'Mest populära',
                  style: (_selectedIndex == 1) ? activeTheme : inactiveTheme,
                ))
          ]),
          Flexible(
              child: ListView.builder(
                  itemCount: widget.posts.posts.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return PostView(widget.posts.posts[index]);
                  }))
        ])
        //Align(alignment: Alignment.topRight, child:  CloseButton())],)
        );
  }

  void _selectIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class PostView extends StatelessWidget {
  PostModel postData;
  PostView(this.postData);
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: PostHeader(postData)),
          Container(
              margin: EdgeInsets.all(10),
              height: 200,
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).hintColor),
                  borderRadius: BorderRadius.circular(15)),
              child: (postData.imageUrl != null)
                  ? Container(
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: Image(
                            image: AssetImage(postData.imageUrl),
                            width: 120,
                          )))
                  : null),
          Row(children: [
            ReactionCounter('👊 ', postData.fistBumps),
            ReactionCounter('😍 ', postData.heartEyes),
            ReactionCounter('🌈 ', postData.rainbows)
          ]),
          Container(
              padding: EdgeInsets.all(10),
              child: Align(
                  alignment: Alignment.topLeft, child: Text(postData.textBody)))
        ]));
  }
}

class PostHeader extends StatelessWidget {
  PostModel postData;
  PostHeader(this.postData);
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      CircleAvatar(
        child: Text(postData.profile.getStringAvatar()),
        backgroundColor: postData.profile.color,
        foregroundColor: Colors.white,
      ),
      Expanded(
          child: Column(children: [
        Align(
            alignment: Alignment.topLeft,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(postData.profile.name))),
        Align(
            alignment: Alignment.topLeft,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(postData.date)))
      ])),
      Icon(Icons.menu)
    ]);
  }
}

class ReactionCounter extends StatefulWidget {
  final String reactionEmoji;
  final int initCount;
  ReactionCounter(this.reactionEmoji, this.initCount);
  @override
  _ReactionCounterState createState() => _ReactionCounterState();
}

class _ReactionCounterState extends State<ReactionCounter> {
  bool _pressed = false;
  int count;
  @override
  void initState() {
    count = widget.initCount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              //border: Border.all(color: Theme.of(context).hintColor),
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10)),
          child: Text('${widget.reactionEmoji} ${count}',
              style: Theme.of(context).textTheme.caption),
        ));
  }

  void _onTap() {
    setState(() {
      _pressed = !_pressed;
      _pressed ? count++ : count--;
    });
  }
}
