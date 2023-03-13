import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';
import 'package:ui/Categories.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:swipe_cards/swipe_cards.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

var response ; 




void main() {
runApp(MyApp());
}

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
	return MaterialApp(
	title: 'Splash Screen',
	theme: ThemeData(
		primarySwatch: Colors.deepPurple,
	),
	home: MyHomePage(),
	debugShowCheckedModeBanner: false,
	);
}
}
 

class MyHomePage extends StatefulWidget {
@override
_MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
@override
void initState() {
	super.initState();
	Timer(Duration(seconds: 4),
		()=>Navigator.pushReplacement(context,
										MaterialPageRoute(builder:
														(context) =>
														HomeScreen()
														)
									)
		);
}
@override
Widget build(BuildContext context) {
	return Container(
	color: Colors.white,
	child: SvgPicture.asset('assets/SplashScreen.svg',
  fit: BoxFit.cover,
  height: double.infinity,
  width: double.infinity,
  )
	);
}
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key?key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}


  class Article {
    final String content;

    const Article({
      required this.content,
    });

    factory Article.fromJson(Map<String, dynamic> json){
      return Article(
        content:json['content'],
      );
    }
  }

 


class _MyStatefulWidgetState extends State<HomeScreen> {

  Future<dynamic> getHttp() async {
  try {
    var response = await http.get(Uri.parse('https://mysterious-wildwood-85842.herokuapp.com/api/airtable/'));
    // print(response);
    if(response.statusCode == 200){
    List<dynamic> dataList = [];
    print(dataList.length);
    dataList = jsonDecode(response.body)['data'];
    return dataList;

    }
  } catch (e) {
    print(e);
  }
}

  int _selectedIndex = 0;
  int cardIndex = 3;
  List <dynamic> data = [];
  
  

  late SwipeableCardSectionController _cardController = SwipeableCardSectionController();
  SwipeableCardSectionController? tardController;
  
  @override
  Widget build(BuildContext context) {

    final list  = getHttp();
    list.then((value) => {

      setState((){
        data=[];
        data = value;
      })
    });



    

  const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // ignore: prefer_final_fields
  // cardController.addItem??;
  List<Widget> _widgetOptions = <Widget>[
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SwipeableCardsSection(
          cardController: _cardController,
          context: context,
          onCardSwiped: (dir, index, widget) {
            // print(index);
            // print(data.length);
            // print(data);
            if(index <data.length ){

            _cardController.addItem(
              Container(
                child:Card(
                  color:Colors.grey[200],
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  elevation: 5,
                  child:Center(
                    child:ListView(
                    children: [
                      Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18, vertical:10),
                      child:ClipRRect(
                      borderRadius: BorderRadius.circular(10),  
                      child:Image.network(data[cardIndex]['image']
                      ),
                      ),
                      ),
                      Padding(
                        padding:EdgeInsets.symmetric(horizontal: 20, vertical:10),
                        child:Text(data[cardIndex]['head'],
                        style:TextStyle(color:Colors.black.withOpacity(0.7),height:1.3,fontSize:20)
                        ),
                      ),
                      Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical:10),
                      child:Text(data[cardIndex]['desc'],
                      style:TextStyle(color:Colors.black.withOpacity(0.7),height:1.3,fontSize:15)
                      )
                      ),
                      Container(
                      height:49,
                  
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.blue),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.share, color: Colors.white),
                          Icon(Icons.source, color: Colors.white),
                          
                        ],
                      )
                      ),
                    ],
                  )
                  )
                )
              ),
            );
            cardIndex++;
            }
          },
          enableSwipeUp: false,
          enableSwipeDown: false,
          items: [
              Container(
                child:Card(
                  color:Colors.grey[200],
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  elevation: 5,
                  child:Center(
                    child:ListView(
                    children: [
                      Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18, vertical:10),
                      child:ClipRRect(
                      borderRadius: BorderRadius.circular(10),  
                      child:Image.network(data[cardIndex]['image']
                      ),
                      ),
                      ),
                      Padding(
                        padding:EdgeInsets.symmetric(horizontal: 20, vertical:10),
                        child:Text(data[0]['head'],
                        style:TextStyle(color:Colors.black.withOpacity(0.7),height:1.3,fontSize:20)
                        ),
                      ),
                      Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical:10),
                      child: 
                      Text(data[0]['desc'],
                      style:TextStyle(color:Colors.black.withOpacity(0.7),height:1.3,fontSize:15)
                      ),
                      
                      ),
                      
                      Container(
                      height:49,
                  
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.blue),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.share, color: Colors.white),
                          Icon(Icons.source, color: Colors.white)
                          
                        ],
                      )
                 
                      ),
                    ],
                  )
                  )
                )
              ), 
              Container(
                child:Card(
                  color:Colors.grey[200],
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  elevation: 5,
                  child:Center(
                    child:ListView(
                    children: [
                      Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18, vertical:10),
                      child:ClipRRect(
                      borderRadius: BorderRadius.circular(10),  
                      child:Image.network(data[cardIndex]['image']
                      ),
                      ),
                      ),
                      Padding(
                        padding:EdgeInsets.symmetric(horizontal: 20, vertical:10),
                        child:Text(data[1]['head'],
                        style:TextStyle(color:Colors.black.withOpacity(0.7),height:1.3,fontSize:20)
                        ),
                      ),
                      Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical:10),
                      child:Text(data[1]['desc'],
                      style:TextStyle(color:Colors.black.withOpacity(0.7),height:1.3,fontSize:15)
                      )
                      ),
                      Container(
                      height:49,
                  
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.blue),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.share, color: Colors.white),
                          Icon(Icons.source, color: Colors.white)
                        ],
                      )
                      ),
                    ],
                  )
                  )
                )
              ),
        
              Container(
                child:Card(
                  color:Colors.grey[200],
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  elevation: 5,
                  child:Center(
                    child:ListView(
                    children: [
                      Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18, vertical:10),
                      child:ClipRRect(
                      borderRadius: BorderRadius.circular(10),  
                      child:Image.network(data[cardIndex]['image']
                      ),
                      ),
                      ),
                      Padding(
                        padding:EdgeInsets.symmetric(horizontal: 20, vertical:10),
                        child:Text(data[2]['head'],
                        style:TextStyle(color:Colors.black.withOpacity(0.7),height:1.3,fontSize:20)
                        ),
                      ),
                      Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical:10),
                      child:Text(data[2]['desc'],
                      style:TextStyle(color:Colors.black.withOpacity(0.7),height:1.3,fontSize:15)
                      )
                      ),
                      Container(
                      height:49,
                  
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.blue),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.share, color: Colors.white),
                          Icon(Icons.source, color: Colors.white),
                          
                        ],
                      )
                      ),
                    ],
                  )
                  )
                )
              ),
            ],
            
        )
      ],
    ),
    Text(
      'Saved',
      style: optionStyle,
    ),
    Text(
      'Notifications',
      style: optionStyle,
    ),
];
 
  void handleClick(String value) {
    switch (value) {
      case 'Categories':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder:(context)=> const Categories(),
          )
        );
        break;
      case 'Terms and Conditions':
        print("Settings");
        break;
      case 'Privacy Policy':
        print("Privacy Policy");
        break;
    }
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    print(_widgetOptions.elementAt(_selectedIndex));
  }
    return Scaffold(
      appBar: AppBar(
        title:
          SvgPicture.asset('assets/logo.svg',
          height:60,
          width:60,
          ),
          centerTitle: true,
        
        backgroundColor:Color.fromARGB(233, 192, 183, 240) ,
        toolbarHeight: 90,
        shadowColor: Colors.black,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Categories', 'Terms and Conditions', 'Privacy Policy'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      
      bottomNavigationBar: SizedBox(
        height:100,
        child:Container(
      // decoration: BoxDecoration(
      //   boxShadow: [BoxShadow(color: Colors.black38, spreadRadius: 12, blurRadius: 10),], 
      // ),
      child:ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0), ),
        child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size:35,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark,
              size:35,
            ),
            label:'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              size:35,
            ),
            label:'Notifications',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
        backgroundColor: Color.fromARGB(233, 96,76,212),
        type: BottomNavigationBarType.fixed,
      ),
      ),
      ),
       ),
    );
  }
  
  
}
