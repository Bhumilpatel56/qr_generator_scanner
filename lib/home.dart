import 'package:flutter/material.dart';
import 'package:qr_generator/generate_qr_code.dart';
import 'package:qr_generator/scan_qr_code.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar:AppBar(title: const Text("QR Code generator"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              setState(() {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ScanQrCode()));
              });
            }, child: const Text("Scan qr code "),),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              setState(() {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> GenerateQrCode()));

              });
            }, child: const Text("Generate  qr code "),),
          ],
        ),
      ),
    )
    );
  }
}
