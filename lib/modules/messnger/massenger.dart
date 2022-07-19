
import 'package:flutter/material.dart';
class massenger extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 20,
        title:Row(
          children: const [
            CircleAvatar(
              radius: 20.0,
            backgroundImage: NetworkImage('https://scontent.fcai1-2.fna.fbcdn.net/v/t39.30808-6/229489981_3013679238920541_3279468984430779362_n.jpg?_nc_cat=103&ccb=1-6&_nc_sid=09cbfe&_nc_eui2=AeGEHjsZCMRl_kyg1vbJiWxZf00qlS3N0Zd_TSqVLc3Rl73PEIng3r-Gc4I2Q70I1IwNLAc71lHKtVulpatQbmsj&_nc_ohc=tAiXjAWKAxEAX9loju5&_nc_ht=scontent.fcai1-2.fna&oh=00_AT-96VVInGEY2ozZ64-kSz80zF7DJSyL2u4EQaYJMHRj6Q&oe=627EE91F')
            ),
            SizedBox(width: 10,),
            Text('Chats'
            ,style: TextStyle(
                    color: Colors.black,
                    fontWeight:FontWeight.bold)),
          ],
        ) ,
          actions:  [
            IconButton(onPressed: (){},
              icon: const CircleAvatar(
                radius: 15.0,
                backgroundColor: Colors.blue,
                child: Icon(Icons.camera_alt_outlined,
                size: 15,
                color: Colors.white,),
              ),
            ),
            IconButton(onPressed: (){},
              icon: const CircleAvatar(
                radius: 15.0,
                backgroundColor: Colors.blue,
                child: Icon(Icons.edit,
                  size: 15,
                  color: Colors.white,),
              ),
            ),
          ],
      ),
      body:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius:BorderRadius.circular(5.0)),
                padding: const EdgeInsets.all(5),
                child: Row(
                  children:const [
                    Icon(Icons.search),
                    SizedBox(width: 10,),
                    Text('Search',style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 100,
                  child:
              ListView.separated(
                                scrollDirection: Axis.horizontal,
                                 itemBuilder: (context,index) => buildStoryItem(),
                                 separatorBuilder: (context,index) => SizedBox(width: 20,),
                  itemCount: 15)),
              SizedBox(height: 8,),
               ListView.separated(

                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context,index) => buildChatItem(),
                    separatorBuilder:(context,index)=>SizedBox(height: 10,)  ,
                    itemCount: 15),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildChatItem() =>  Container(
    width: 50,
    child: Row(
      crossAxisAlignment :CrossAxisAlignment.start,

      children: [

        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children:const [
            CircleAvatar(
              backgroundImage: NetworkImage('https://scontent.fcai1-2.fna.fbcdn.net/v/t39.30808-6/229489981_3013679238920541_3279468984430779362_n.jpg?_nc_cat=103&ccb=1-6&_nc_sid=09cbfe&_nc_eui2=AeGEHjsZCMRl_kyg1vbJiWxZf00qlS3N0Zd_TSqVLc3Rl73PEIng3r-Gc4I2Q70I1IwNLAc71lHKtVulpatQbmsj&_nc_ohc=tAiXjAWKAxEAX9loju5&_nc_ht=scontent.fcai1-2.fna&oh=00_AT-96VVInGEY2ozZ64-kSz80zF7DJSyL2u4EQaYJMHRj6Q&oe=627EE91F'),
              radius:25,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(end: 3.0,bottom: 3.0),
              child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 5),
            ),
          ],
        ),
        SizedBox(width: 10,),
        Column(
          children: [
            Row(
            children: [
              Text('moemen ali ahmed',maxLines: 1,overflow: TextOverflow.ellipsis,),


            ],
          ),
            Row(
              children: [
                Text('Hello,How are you?',maxLines: 1,overflow: TextOverflow.ellipsis,),
                SizedBox(width: 5,),
                CircleAvatar(
                  radius: 2,
                  backgroundColor: Colors.blue,
                ),
              ],
            )

          ],
        ),



      ],
    ),
  );
  Widget buildStoryItem() => Container(
    width: 50,
    child: Column(

      children: [

        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children:const [
            CircleAvatar(
              backgroundImage: NetworkImage('https://scontent.fcai1-2.fna.fbcdn.net/v/t39.30808-6/229489981_3013679238920541_3279468984430779362_n.jpg?_nc_cat=103&ccb=1-6&_nc_sid=09cbfe&_nc_eui2=AeGEHjsZCMRl_kyg1vbJiWxZf00qlS3N0Zd_TSqVLc3Rl73PEIng3r-Gc4I2Q70I1IwNLAc71lHKtVulpatQbmsj&_nc_ohc=tAiXjAWKAxEAX9loju5&_nc_ht=scontent.fcai1-2.fna&oh=00_AT-96VVInGEY2ozZ64-kSz80zF7DJSyL2u4EQaYJMHRj6Q&oe=627EE91F'),
              radius:25,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(end: 3.0,bottom: 3.0),
              child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 5),
            ),
          ],
        ),
        const Text('mo\'men ali AHMED',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,),
      ],
    ),
  );

}

