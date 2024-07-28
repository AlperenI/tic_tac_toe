
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors



import 'package:flutter/material.dart';




class HomePage extends StatefulWidget {
   const HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
     List<String> xo=["","","","","","","","",""];
     final List<String> originalXo=["","","","","","","","",""];
     String playerTurn="1.Player";
     int score1=0;
     int score2=0;
     int filledBox=0;
     
     

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade300,
      appBar: AppBar(
  elevation: 0,
  centerTitle: true,
  title: Text(
    "Tic Tac Toe Game",
    style: TextStyle(
      fontSize: 27,
      fontWeight: FontWeight.w500,
      foreground: Paint()..color = Colors.pink.shade900,
    ),
  ),
  actions: [
    IconButton(
      onPressed: () {
        setState(() {
        score1=0;
        score2=0;
        filledBox=0;
        xo=List.from(originalXo);
        });

      },
      icon: Icon(
        Icons.restart_alt,
        size: 35,
        color: Colors.pink.shade900,
      ),
    ),
  ],
  backgroundColor: Colors.pink.shade400,
),
body: SafeArea(
  child: Column(
    children: [
      _playerScores(),
      _grids(),
      _turns(),
    ],
  ),
),
);
  }

  Widget _playerScores(){
    return Expanded(
      child: Column(
        children: [Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Text("Player 1",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,foreground: Paint()..color=Colors.pink.shade800),),
          Text("Player 2",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,foreground: Paint()..color=Colors.pink.shade800),),
        ],
        ),
        
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Text("$score1",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,foreground: Paint()..color=Colors.pink.shade800),),
          Text("$score2",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,foreground: Paint()..color=Colors.pink.shade800),),
          ],
        ),
        ],
        ),
    );
}

  Widget _grids(){
 return Expanded(flex: 4,
      child: GridView.builder(padding: EdgeInsets.all(1),
        itemCount: 9,
        primary: false,
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3) , 
        itemBuilder:(BuildContext context, index) {
        return GestureDetector(
          onTap: (){
            updateGrid(index);
            updateScore(index);
          },
          child: Container(
            decoration: BoxDecoration(border:Border.all(color: Colors.white)),
            child: Center(child: Text(xo[index],style: TextStyle(fontSize: 40,fontWeight: FontWeight.w500,foreground: Paint()..color=Colors.pink.shade800),))
          ),
        );
      },),
    );
}
  

    void updateGrid(index){
      setState(() {
              if (playerTurn=="1.Player"&& xo[index].isEmpty) {
        
          playerTurn="2.Player";
            xo[index]="X";
            filledBox+=1;
         
      }else if(playerTurn=="2.Player"&& xo[index].isEmpty){
        
          playerTurn="1.Player";
            xo[index]="O";
            filledBox+=1;
        
      }
      });

    }
    void updateScore(index){setState(() {
            if (xo[6]=="X"&&xo[7]=="X"&&xo[8]=="X"||xo[3]=="X"&&xo[4]=="X"&&xo[5]=="X"||xo[0]=="X"&&xo[1]=="X"&&xo[2]=="X"||xo[0]=="X"&&xo[3]=="X"&&xo[6]=="X"||xo[0]=="X"&&xo[4]=="X"&&xo[8]=="X"||xo[2]=="X"&&xo[4]=="X"&&xo[6]=="X"||xo[1]=="X"&&xo[4]=="X"&&xo[7]=="X"||xo[2]=="X"&&xo[5]=="X"&&xo[8]=="X") {
        score1+=1;
        xo=List.from(originalXo);
        filledBox=0;
        playerTurn="1.Player";
       
      }else if(filledBox==9){
        setState(() {
          xo=List.from(originalXo);
          filledBox=0;
          playerTurn="1.Player";
          
        });
      }else if(xo[6]=="O"&&xo[7]=="O"&&xo[8]=="O"||xo[3]=="O"&&xo[4]=="O"&&xo[5]=="O"||xo[0]=="O"&&xo[1]=="O"&&xo[2]=="O"||xo[0]=="O"&&xo[3]=="O"&&xo[6]=="O"||xo[0]=="O"&&xo[4]=="O"&&xo[8]=="O"||xo[2]=="O"&&xo[4]=="O"&&xo[6]=="O"||xo[1]=="O"&&xo[4]=="O"&&xo[7]=="O"||xo[2]=="O"&&xo[5]=="O"&&xo[8]=="O"){
        score2+=1;
        xo=List.from(originalXo);
        filledBox=0;
        playerTurn="1.Player";
      }
    });

    }

Widget _turns(){
  return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(playerTurn,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,foreground: Paint()..color=Colors.pink.shade800),),
        Padding(padding: EdgeInsets.only(bottom: 70)),
      ],
    );
}


}





