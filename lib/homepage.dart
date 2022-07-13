import 'package:flutter/material.dart';
import 'package:flutter_application_1/secondscreen.dart';

class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('QR CODE SCANNER'),
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/QR.jpg"))),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Welcome to QR Code Scanner',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(7.0)),
              Icon(Icons.qr_code,size: 50,),
              Padding(padding: EdgeInsets.all(230.0)),
              Center(child: ElevatedButton(
                
                child: Text('Scan your QR Code here'),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => QrScanner())


              );},))
            ],
          )),
    );
  }
}
