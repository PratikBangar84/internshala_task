import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({Key? key}) : super(key: key);

  @override
  _QrScannerState createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;
  

  addDate() async {
    

      controller!.dispose();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Attendance marked!',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ));

    

  }

  

  @override
  void initState() {
    super.initState();
    
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          buildQrView(context),
          Positioned(
            bottom: MediaQuery.of(context).size.height*0.15,
            child: buildResult(),
          )
        ],
      )
    ) ;
  }

  Widget buildResult() {
    return Container(
        decoration: BoxDecoration(color: Colors.white24),
        child: Text('Scan QR code',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        )
    );
  }

  Widget buildQrView(BuildContext context) => QRView(
    key: qrKey,
    onQRViewCreated: onQRViewCreated,
    overlay: QrScannerOverlayShape(
      cutOutSize: MediaQuery.of(context).size.width * 0.8,
      borderRadius: 10,
    ),
  );
  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((barcode) async {
      setState(() {
        this.barcode = barcode;
      });

      if(barcode.code == 'Welcome to Five Star Fitness!!') {
        addDate();
      }
    });
  }
}