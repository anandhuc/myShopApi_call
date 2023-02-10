import 'package:api_bloc/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:counter_button/counter_button.dart';



class ScreenDetails extends StatefulWidget {
  ScreenDetails({super.key,required this.e,required this.index});
  List <Products> e;
  int index;
  
  

  @override
  State<ScreenDetails> createState() => _ScreenDetailsState();
}

class _ScreenDetailsState extends State<ScreenDetails> {
  int _counterValue = 0;
   void initState() {
   
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
   
    int P=10; 
    int price= P*_counterValue;
    final imageBaseUrl = "https://admin.maaxkart.com/";
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.e[widget.index].proName),
        centerTitle: true,
      ), 
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
         
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.grey, 
                  radius: 100 , 
                  backgroundImage: NetworkImage(imageBaseUrl+widget.e[widget.index].image), 
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.e[widget.index].proName,style: TextStyle(fontSize: 22),),
              )  ,
              Text("SHOP :${widget.e[widget.index].companyName}",style: TextStyle(fontSize: 20),) ,
               Text("Available Qty :${widget.e[widget.index].qty.toString()}",style: TextStyle(fontSize:18)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center , 
                  children: [
                    Text("Market Price: ",style: TextStyle(fontSize:18)),Text(widget.e[widget.index].price,style: TextStyle(decoration: TextDecoration.lineThrough,fontSize: 18 ),) 
                  ],
                ),
              
              ),
                Row( 
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                  children: [
                    Text("My Shop Price:${widget.e[widget.index].sellingPrice} ",style: TextStyle(fontSize:18)) ,
                 SizedBox(
                  height: 50,  
                   child: CounterButton(
                             loading: false,
                             onChange: (int val) {
                               setState(() {
                                 _counterValue = val;
                               });
                             }, 
                             count: _counterValue,
                             countColor: Color.fromARGB(255, 7, 7, 7),
                             buttonColor: Color.fromARGB(255, 154, 153, 154),
                             progressColor: Color.fromARGB(255, 247, 244, 247),
                           ),
                 ),
                  ],
                ),
                Spacer(), 
 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center ,
               
                  children: [
                Text("Total: $price",style: TextStyle(fontSize:18,fontWeight: FontWeight.w500)), 
                  Padding(
                    padding: const EdgeInsets.only(left:50.0),
                    child: SizedBox(
                      width: 70 , 
                      child: ElevatedButton(onPressed: (){
                                      
                                    }, child: Text('Buy')), 
                    ),
                  )  
                  ],
                ),
                SizedBox(height: 50, )
            ],
          ),
        ),
      ),     
    );
  }
}