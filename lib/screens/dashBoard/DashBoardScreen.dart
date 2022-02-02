
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xFFFAFAFA),
        title: const Text("DashBoard"),
        iconTheme: const IconThemeData(color: Colors.black,size: 30,opacity: 1),
        actions: [
      IconButton(
      icon: const Icon(FontAwesomeIcons.angleDoubleRight,
        size: 30, //Icon Size
        color: Colors.black, //Color Of Icon
      ),
      onPressed: () {
        // do something
      },)
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text("Abhishek Mishra"),
              accountEmail: Text("abhishekm977@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0),
                ),
                backgroundImage:
                NetworkImage("http://tineye.com/images/widgets/mona.jpg"),
              ),
          decoration:  BoxDecoration(
              image:  DecorationImage(
                  fit: BoxFit.cover,
                  image:  AssetImage("assets/images/drawer_bg.jpg")
              )
          )
            ),
            ListTile(
              leading: const Icon(Icons.home), title: const Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.document_scanner), title: const Text("Scan NRIC / Document"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings), title: const Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout), title: const Text("LogOut"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body:  SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            Container(
                width: 148.0,
                height: 148.0,
                decoration:  const BoxDecoration(
                    shape: BoxShape.circle,
                    image:  DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage("https://via.placeholder.com/400x400")
                    )
                )),
            const SizedBox(height: 10,),
            const Text("Test Name",style:  TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            const Text("QIU Email Address",style: TextStyle(color: Colors.black45),),
            const SizedBox(height: 10,),
              Expanded(
                child: SizedBox(
              width: double.infinity,
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),),
                margin: EdgeInsets.zero,
                child:   Column(children: [
                  const SizedBox(height: 30,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:  [
                     const Text("List",style: TextStyle(color: Colors.white,fontSize: 16),),
                      RichText(
                        text: const TextSpan(
                          children: [
                            WidgetSpan(
                              child:  Icon(Icons.lightbulb, size: 30,color: Colors.white,),
                            ),
                            TextSpan(
                              text: " Tips",
                              style: TextStyle(color: Colors.white,fontSize: 16),
                            ),
                          ],
                        ),
                      )
                  ],),
                  const SizedBox(height: 30,),
                  const CardWidget("NRIC",'Scan your Ic',FontAwesomeIcons.addressCard),
                  const SizedBox(height: 10,),
                  const CardWidget("SPM Transcript",'Scan your SPM Result',Icons.document_scanner),
                  const SizedBox(height: 10,),
                  const CardWidget("STPM Transcript",'Scan your STPM Result',Icons.document_scanner),
                  const SizedBox(height: 10,),
                  const CardWidget("Other Document",'Scan your Document',FontAwesomeIcons.copy),
                  const SizedBox(height: 10,),


                ],),
                elevation: 9,
                color: Colors.black,
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  const CardWidget(this.title,this.subTitle,this.icon,{
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 9,
      color: const Color(0xFFF44236),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            const SizedBox(width: 60,),
            Flexible(
                child: ListTile(
                  title: Text(title,style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color:  Colors.white),),
                  subtitle:  Text(subTitle,style: const TextStyle(color: Colors.white70,fontSize: 17),),
                  leading:  Icon(icon,color: Colors.white,size: 40,),
                )
            ),
            const SizedBox(width: 10,),
          ],
        )
      ),
    );
  }
}
