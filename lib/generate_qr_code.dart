import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQrCode extends StatefulWidget {
  const GenerateQrCode({super.key});

  @override
  State<GenerateQrCode> createState() => _GenerateQrCodeState();
}

class _GenerateQrCodeState extends State<GenerateQrCode> {
  TextEditingController urlController = TextEditingController();

  String qrData = "";

  @override
  void dispose() {
    urlController.dispose();
    super.dispose();
  }

  void generateQRCode() {
    setState(() {
      qrData = urlController.text.trim();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Generate QR Code"),
        centerTitle: true,
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // QR Code
              if (qrData.isNotEmpty)
                QrImageView(
                  data: qrData,
                  size: 200,
                ),

              const SizedBox(height: 20),

              // Text Field
              Container(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: TextField(
                  controller: urlController,
                  decoration: InputDecoration(
                    hintText: "Enter your data",
                    labelText: "Enter your data",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Generate Button
              ElevatedButton(
                onPressed: generateQRCode,
                child: const Text("Generate"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}