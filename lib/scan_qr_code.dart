import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQrCode extends StatefulWidget {
  const ScanQrCode({super.key});

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  String qrResult = "Scanned Data will appear here";

  bool isScanning = false;

  final MobileScannerController controller = MobileScannerController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void scanQR() {
    setState(() {
      isScanning = true;
      qrResult = "Scanning...";
    });
  }

  void onDetect(BarcodeCapture capture) {
    if (!isScanning) return;

    for (final barcode in capture.barcodes) {
      final String? value = barcode.rawValue;

      if (value != null && value.isNotEmpty) {
        setState(() {
          qrResult = value;
          isScanning = false;
        });

        controller.stop();
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan QR Code"),
        centerTitle: true,
      ),

      body: Column(
        children: [
          if (isScanning)
            Expanded(
              flex: 4,
              child: MobileScanner(
                controller: controller,
                onDetect: onDetect,
              ),
            )
          else
            const Expanded(
              flex: 4,
              child: Center(
                child: Icon(
                  Icons.qr_code_scanner,
                  size: 120,
                  color: Colors.blue,
                ),
              ),
            ),

          Expanded(
            flex: 2,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Scanned Data:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      qrResult,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          isScanning = true;
                          qrResult = "Scanning...";
                        });

                        await controller.start();
                      },
                      child: const Text("Scan Code"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}