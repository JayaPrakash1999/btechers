// import com.facebook.FacebookSdk;
// import com.facebook.appevents.AppEventsLogger;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'dart:io';

void main()
{
  runApp(new JPR());
}
class JPR extends StatefulWidget
{
@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _JPR();
  }

}
class _JPR extends State<JPR>
{
int count;
bool isLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Mobile Addiction App Login"),
          backgroundColor: Colors.green,
        ),
        body: Container(
          child: Center(
            child: isLoggedIn
                ? RaisedButton(
                    child: Text("open APP"),
                    onPressed: () => just(),
                  )
                : RaisedButton(
                    child: Text("Login with Facebook"),
                    onPressed: () => initiateFacebookLogin(),
                  ),
          ),
        ),
      ),
    );
  }

void just()
{
  runApp(new FirstScreen(count));
}

void initiateFacebookLogin() async {
    var facebookLogin = FacebookLogin();
    var facebookLoginResult =
        await facebookLogin.logInWithReadPermissions(['email']);
     switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        print("Error");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("CancelledByUser");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        print("LoggedIn");
        onLoginStatusChanged(true);
        break;
    }
  }

  void onLoginStatusChanged(bool isLoggedIn) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
    });
    // print("hello");
  }
}
  
  

  class FirstScreen extends StatelessWidget {
  int count;
  FirstScreen(this.count);
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Mobile Addiction Rating Application"),
        ),
        body:Center(
          child: Column(
            children: <Widget>[
              Text("\nDEVELOPED BY ",textDirection: TextDirection.ltr,style:TextStyle(fontSize: 25.0,color: Colors.green),),
              Text("\n JAYA PRAKASH REDDY \n",textDirection: TextDirection.ltr,style:TextStyle(fontSize: 25.0,color: Colors.red),),
              ShowImage(),
          FlatButton(
          child: Text("ABOUT"),
          color: Colors.red,
          onPressed: (){
            count=0;
            Navigator.push(
              ctxt,
              new MaterialPageRoute(builder: (ctxt) => new AboutScreen(count)),
            );

          },
        ),
              FlatButton(
                child: Text("START"),
                color: Colors.green,
                onPressed: (){
                  count=0;
                  Navigator.push(
                ctxt,
                new MaterialPageRoute(builder: (ctxt) => new SecondScreen(count)),
              );

                },
              ),
              RaisedButton(
                child: Text("EXIT"),
                color: Colors.lightBlue,
                onPressed: (){
                  count=0;
                  exit(0);

                },
              )
            ],
          ),
        )

    );
  }
}



class AboutScreen extends StatelessWidget {
  int count;
  AboutScreen(this.count);
  @override
  Widget build (BuildContext ctxt) {
    int CallMe(){
      count=0;
      return count;
    }
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Mobile Addiction Rating Application"),
        ),
        body:Center(
          child: Column(
            children: <Widget>[
            Text("ABOUT:",style:TextStyle(fontSize:35.0,color:Colors.green[500])),  
            Text("This app is about to show the rating of mobile addiction by person.\n\nAnd You can exit the APP anytime by clicking the EXIT button in every Page.\n\nYou need to give correct information and should answer to every question.\n\nQuestions start by clicking READY button below or START button in HOME PAGE.\n",textDirection: TextDirection.ltr,style:TextStyle(fontSize: 20.0,color:Colors.red[500]),),
            Text("Your score starts from ${CallMe()}\n",style:TextStyle(fontSize:25.0,color:Colors.green[500])),
            FlatButton(
              child: Text("HOME PAGE"),
              color: Colors.red,
              onPressed: (){
                Navigator.push(
                  ctxt,
                  new MaterialPageRoute(builder: (ctxt) => new FirstScreen(count)),
                );
              },
            ),
            Text("\n"),
              FlatButton(
                child: Text("READY"),
                color: Colors.green,
                onPressed: (){
                  count=0;
                  Navigator.push(
                    ctxt,
                    new MaterialPageRoute(builder: (ctxt) => new SecondScreen(count)),
                  );

                },
              ),
              Text("\n"),
              RaisedButton(
                child: Text("EXIT"),
                color: Colors.lightBlue,
                onPressed: (){
                  count=0;
                  exit(0);

                },
              )
            ],
          ),
        )

    );
  }
}




//class SecondScreen extends StatelessWidget {
//  @override
//  Widget build (BuildContext ctxt) {
//    return new Scaffold(
//        appBar: new AppBar(
//          title: new Text("Mobile Addiction Rating Application"),
//        ),
//        ,
//
//        body:
//    );
//  }
//}
class SecondScreen extends StatelessWidget {
  int count;
  SecondScreen(this.count);
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Mobile Addiction Rating Application"),
        ),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("1",textDirection: TextDirection.ltr,style:TextStyle(fontSize: 50.0),),
              ShowImage2(),
              Text("Do you Use yor mobile early in the morning on the bed ?",textDirection: TextDirection.ltr,style:TextStyle(fontSize: 25.0,),),
              FlatButton(
                child: Text("Yes"),
                color: Colors.deepOrange  ,
                onPressed: (){
                  count+=2;
                  Navigator.push(
                    ctxt,
                    new MaterialPageRoute(builder: (ctxt) => new ThirdScreen(count)),
                  );
                },
              ),
              FlatButton(
                child: Text("No"),
                color: Colors.deepOrange,
                onPressed: (){
                  count=0;
                  Navigator.push(
                    ctxt,
                    new MaterialPageRoute(builder: (ctxt) => new ThirdScreen(count)),
                  );

                },
              ),
              // Text("\n"),
              FlatButton(
                child: Text("HOME PAGE"),
                color: Colors.green,
                onPressed: (){
                  count=0;
                  Navigator.push(
                    ctxt,
                    new MaterialPageRoute(builder: (ctxt) => new FirstScreen(count)),
                  );

                },
              ),
              RaisedButton(
                child: Text("EXIT"),
                color: Colors.lightBlue,
                onPressed: (){
                  count=0;
                  exit(0);

                },
              )
            ],
          ),
        )

    );
  }
}





class ThirdScreen extends StatelessWidget {
  int count;
  ThirdScreen(this.count);
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Mobile Addiction Rating Application"),
        ),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("2",textDirection: TextDirection.ltr,style:TextStyle(fontSize: 50.0),),
              ShowImage3(),
              Text("Do you Use yor mobile while driving ?\n",textDirection: TextDirection.ltr,style:TextStyle(fontSize: 25.0),),
              FlatButton(
                child: Text("Yes"),
                color: Colors.red,
                onPressed: (){
                  count+=2;
                  Navigator.push(
                    ctxt,
                    new MaterialPageRoute(builder: (ctxt) => new FourthScreen(count)),
                  );

                },
              ),
              FlatButton(
                child: Text("No"),
                color: Colors.red,
                onPressed: (){
                  count+=0;
                  Navigator.push(
                    ctxt,
                    new MaterialPageRoute(builder: (ctxt) => new FourthScreen(count)),
                  );

                },
              ),
              // Text("\n"),
              FlatButton(
                child: Text("HOME PAGE"),
                color: Colors.green,
                onPressed: (){
                  count=0;
                  Navigator.push(
                    ctxt,
                    new MaterialPageRoute(builder: (ctxt) => new FirstScreen(count)),
                  );

                },
              ),
              RaisedButton(
                child: Text("EXIT"),
                color: Colors.lightBlue,
                onPressed: (){
                  count=0;
                  exit(0);

                },
              )
            ],
          ),
        )

    );
  }
}
class FourthScreen extends StatelessWidget {
  int count;
  FourthScreen(this.count);
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Mobile Addiction Rating Application"),
        ),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("3",textDirection: TextDirection.ltr,style:TextStyle(fontSize: 50.0),),
              ShowImage4(),
              Text("Do you play atleast 2-3 hours on Mobile games ?\n",textDirection: TextDirection.ltr,style:TextStyle(fontSize: 25.0),),
              FlatButton(
                child: Text("Yes"),
                color: Colors.red[200],
                onPressed: (){
                  count+=2;
                  Navigator.push(
                    ctxt,
                    new MaterialPageRoute(builder: (ctxt) => new FifthScreen(count)),
                  );

                },
              ),
              FlatButton(
                child: Text("No"),
                color: Colors.red[200],
                onPressed: (){
                  Navigator.push(
                    ctxt,
                    new MaterialPageRoute(builder: (ctxt) => new FifthScreen(count)),
                  );

                },
              ),
              // Text("\n"),
              FlatButton(
                child: Text("HOME PAGE"),
                color: Colors.green,
                onPressed: (){
                  count=0;
                  Navigator.push(
                    ctxt,
                    new MaterialPageRoute(builder: (ctxt) => new FirstScreen(count)),
                  );

                },
              ),
              RaisedButton(
                child: Text("EXIT"),
                color: Colors.lightBlue,
                onPressed: (){
                  count=0;
                  exit(0);

                },
              )
            ],
          ),
        )

    );
  }
}


class FifthScreen extends StatelessWidget {
  int count;
  FifthScreen(this.count);
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Mobile Addiction Rating Application"),
        ),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("4",textDirection: TextDirection.ltr,style:TextStyle(fontSize: 50.0),),
              ShowImage5(),
              Text("Do you check your moble with anxiety frequently without any need ?\n",textDirection: TextDirection.ltr,style:TextStyle(fontSize: 25.0),),
             
              FlatButton(
                child: Text("Yes"),
                color: Colors.green,
                onPressed: (){
                  count+=2;
                  Navigator.push(
                    ctxt,
                    new MaterialPageRoute(builder: (ctxt) => new SixthScreen(count)),
                  );

                },
              ),
              FlatButton(
                child: Text("No"),
                color: Colors.green,
                onPressed: (){
                  count+=0;
                  Navigator.push(
                    ctxt,
                    new MaterialPageRoute(builder: (ctxt) => new SixthScreen(count)),
                  );

                },
              ),
              // Text("\n"),
               FlatButton(
                child: Text("HOME PAGE"),
                color: Colors.red,
                onPressed: (){
                  count=0;
                  Navigator.push(
                    ctxt,
                    new MaterialPageRoute(builder: (ctxt) => new FirstScreen(count)),
                  );

                },
              ),RaisedButton(
                child: Text("EXIT"),
                color: Colors.lightBlue,
                onPressed: (){
                  count=0;
                  exit(0);

                },
              )

            ],
          ),
        )

    );
  }
}


class SixthScreen extends StatelessWidget {
  int count;
  SixthScreen(this.count);
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Mobile Addiction Rating Application"),
        ),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("5",textDirection: TextDirection.ltr,style:TextStyle(fontSize: 50.0),),
              ShowImage6(),
              Text("Do you influence by socialmedia to take any Decisions ?",textDirection: TextDirection.ltr,style:TextStyle(fontSize: 25.0),),
              
               FlatButton(
                child: Text("Yes"),
                color: Colors.green,
                onPressed: (){
                  count+=2;
                  Navigator.push(
                    ctxt,
                    new MaterialPageRoute(builder: (ctxt) => new SeventhScreen(count)),
                  );

                },
               ),
              FlatButton(
                child: Text("No"),
                color: Colors.green,
                onPressed: (){
                  Navigator.push(
                    ctxt,
                    new MaterialPageRoute(builder: (ctxt) => new SeventhScreen(count)),
                  );

                },
              ),
              // Text("\n"),
              FlatButton(
                child: Text("HOME PAGE"),
                color: Colors.red,
                onPressed: (){
                  count=0;
                  Navigator.push(
                    ctxt,
                    new MaterialPageRoute(builder: (ctxt) => new FirstScreen(count)),
                  );

                },
              ),
              RaisedButton(
                child: Text("EXIT"),
                color: Colors.lightBlue,
                onPressed: (){
                  count=0;
                  exit(0);

                },
              )
            ],
          ),
        )

    );
  }
}


class SeventhScreen extends StatelessWidget {
  int count;
  SeventhScreen(this.count);
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Mobile Addiction Rating Application"),
        ),
        body:Center(
          child: Column(
            children: <Widget>[
              Text("6",textDirection: TextDirection.ltr,style:TextStyle(fontSize: 35.0),),
              ShowImage7(),
              Text("Do you use mobile while eating ?\n",textDirection: TextDirection.ltr,style:TextStyle(fontSize: 25.0),),
              
               FlatButton(
                child: Text("Yes"),
                color: Colors.blue,
                onPressed: (){
                  count+=2;
                  Navigator.push(
                    ctxt,
                    new MaterialPageRoute(builder: (ctxt) => new EndScreen(count)),
                  );

                },
              ),
              FlatButton(
                child: Text("No"),
                color: Colors.blue,
                onPressed: (){
                  count+=0;
                  Navigator.push(
                    ctxt,
                    new MaterialPageRoute(builder: (ctxt) => new EndScreen(count)),
                  );

                },
              ),
              // Text("\n"),
              FlatButton(
                child: Text("HOME PAGE"),
                color: Colors.red,
                onPressed: (){
                  count=0;
                  Navigator.push(
                    ctxt,
                    new MaterialPageRoute(builder: (ctxt) => new FirstScreen(count)),
                  );

                },
              ),
              RaisedButton(
                child: Text("EXIT"),
                color: Colors.lightBlue,
                onPressed: (){
                  count=0;
                  exit(0);

                },
              )
            ],
          ),
        )

    );
  }
}


class EndScreen extends StatelessWidget {
  int count;
  String Ans;
  EndScreen(this.count);
  int CallMe(count)
  {
    return count;
  }
  String Rating(count)
  {
    if(count>=0 && count<=4)
    {
      return "You are well";
    }
    else if(count>4 && count<=8)
    {
      return "You need to control yourself from Addiction";
    }
    else if(count>8 && count<=12)
    {
      return "You need to consult a psychiatrist to stop addicting from mobile";
    }
    else
    {
      return "you went wrong somewhere, please START AGAIN";
    }
  }
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Mobile Addiction Rating Application"),
        ),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Rating\n",textDirection: TextDirection.ltr,style:TextStyle(fontSize: 25.0,color: Colors.deepOrange),),
              Text("If your score is between 2 and 4  = You are well\n"
                  " If your score is between 4 and 8  =You need to control yourself from addiction\n"
                  "If your score is between 8 and 12  =You need to consult a psychiatrist to stop addicting from mobile\n"
                  ,textDirection: TextDirection.ltr,style:TextStyle(fontSize: 15.0,color:Colors.lightGreen),),
              Text("Your score is ${CallMe(count)}\n",style: TextStyle(fontSize: 20.0,color: Colors.black),),
              Text("${Rating(count)}\n",style: TextStyle(fontSize: 25.0,color: Colors.blue),),
              FlatButton(
                child: Text("HOME PAGE"),
                color: Colors.red,
                onPressed: (){
                  count=0;
                  Navigator.push(
                    ctxt,
                    new MaterialPageRoute(builder: (ctxt) => new FirstScreen(count)),
                  );

                },
              ),
              Text("\n"),
              FlatButton(
                child: Text("START AGAIN"),
                color: Colors.green,
                onPressed: (){
                  count=0;
                  Navigator.push(
                    ctxt,
                    new MaterialPageRoute(builder: (ctxt) => new SecondScreen(count)),
                  );

                },
              ),
              Text("\nTHANKING YOU\n",style: TextStyle(fontSize: 35.0,color:Colors.deepOrangeAccent),),
              // RaisedButton(
              //   child: Text("EXIT"),
              //   color: Colors.indigo,
              //   onPressed: (){
              //     count=0;
              //     exit(0);

              //   },
              // ),
              RaisedButton(
                child: Text("EXIT"),
                color: Colors.lightBlue,
                onPressed: (){
                  count=0;
                  exit(0);

                },
              )
            ],
          ),
        )

    );
  }
}







class ShowImage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage =AssetImage('images/1.jpeg');
    Image image =Image(image: assetImage,width: 250.0,height: 250.0,);
    return Container(child: image,);

  }
}

class ShowImage2 extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage =AssetImage('images/mrg.jpeg');
    Image image =Image(image: assetImage,width: 250.0,height: 250.0,);
    return Container(child: image,);

  }
}
class ShowImage3 extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage =AssetImage('images/dr.jpeg');
    Image image =Image(image: assetImage,width: 250.0,height: 250.0,);
    return Container(child: image,);

  }
}


class ShowImage4 extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage =AssetImage('images/game.jpeg');
    Image image =Image(image: assetImage,width: 250.0,height: 250.0,);
    return Container(child: image,);

  }
}


class ShowImage5 extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage =AssetImage('images/anx.jpeg');
    Image image =Image(image: assetImage,width: 250.0,height: 250.0,);
    return Container(child: image,);

  }
}


class ShowImage6 extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage =AssetImage('images/Social.jpeg');
    Image image =Image(image: assetImage,width: 250.0,height: 250.0,);
    return Container(child: image,);

  }
}

class ShowImage7 extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage =AssetImage('images/eat.jpeg');
    Image image =Image(image: assetImage,width: 250.0,height: 250.0,);
    return Container(child: image,);

  }
}




// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.display1,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
