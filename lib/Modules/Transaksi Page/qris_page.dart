import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart'; // Mengimpor package qr_flutter

class QRISPage extends StatelessWidget {
  final double subtotal;
  final String transactionCode;

  QRISPage({required this.subtotal, required this.transactionCode});

  @override
  Widget build(BuildContext context) {
    // Format jumlah subtotal dengan format rupiah
    final formattedSubtotal = "Rp ${subtotal.toStringAsFixed(2)}";

    return Scaffold(
      appBar: AppBar(
        title: Text("QRIS Payment"),
        backgroundColor: Colors.greenAccent[400],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Scan QRIS To Pay",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              // Generate QR code berdasarkan transactionCode

              QrImageView(
                data: transactionCode,
                version: QrVersions.auto,
                size: 200.0,
                gapless: false,
              ),

              const SizedBox(height: 20),
              // Menampilkan jumlah yang harus dibayar dalam format rupiah
              Text(
                formattedSubtotal,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              // Tombol untuk kembali ke halaman sebelumnya
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Kembali',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
