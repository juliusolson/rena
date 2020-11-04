import 'package:flutter/material.dart';
import 'package:rena/models/postModel.dart';
import 'package:rena/models/scoreBoard.dart';

class ProfileFeedView extends StatefulWidget {
  final PostsModel posts = new PostsModel();
  @override
  _ProfileFeedViewState createState() => _ProfileFeedViewState();
}

class _ProfileFeedViewState extends State<ProfileFeedView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).scaffoldBackgroundColor, 
      child:
      Column(children: [Row(children: [Text('Nyast Först'), Text('Mest Populära')]),
      Flexible(child:ListView.builder(
        itemCount: widget.posts.posts.length,
        itemBuilder: (BuildContext ctx, int index){
        return PostView(widget.posts.posts[index]);}
        )
      )])
        //Align(alignment: Alignment.topRight, child:  CloseButton())],)
    );
  }
}

class PostView extends StatelessWidget {
  PostModel postData;
  PostView(this.postData);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(children: [Row(children: [CircleAvatar(child: Text(postData.profile.getStringAvatar()), backgroundColor: postData.profile.color,),
      Expanded(child:Column(children: [
        Align(alignment: Alignment.topLeft, child: Text(postData.profile.name)),
       Align(alignment: Alignment.topLeft, child: Text(postData.date))])), Icon(Icons.menu)])
      , 
      Container(margin: EdgeInsets.all(20),
       height: 200,
       decoration: BoxDecoration(border: Border.all(color: Theme.of(context).hintColor), 
       borderRadius: BorderRadius.circular(15))), 
      Row(children: [ReactionCounter('😍 ${postData.heartEyes}'), ReactionCounter('👊 ${postData.fistBumps}')]),
      Text(postData.textBody)]));
  }
}

class ReactionCounter extends StatelessWidget {
  String data;
  ReactionCounter(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(horizontal:5),
      decoration: BoxDecoration(border: Border.all(color: Theme.of(context).hintColor), 
        color: Colors.grey,
       borderRadius: BorderRadius.circular(15)),
       child: Text(data, style:Theme.of(context).textTheme.caption),
    );
  }
}