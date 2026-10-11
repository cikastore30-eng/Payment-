import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

void main() => runApp(const QrisPaymentApp());

class QrisPaymentApp extends StatelessWidget {
  const QrisPaymentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Payment QRIS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF176B57)),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4F7F6),
      ),
      home: const PaymentPage(),
    );
  }
}

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  // Ubah informasi di bawah sesuai kebutuhan.
  static const String storeName = 'TOKO KAMU';
  static const String paymentNote = 'Pembayaran QRIS';
  static const String amount = 'Rp 25.000';

  Future<void> _shareQris(BuildContext context) async {
    try {
      await Share.share(
        'QRIS $storeName\\nNominal: $amount\\n'
        'Silakan scan gambar QRIS di aplikasi Payment QRIS.',
        subject: 'Pembayaran QRIS - $storeName',
      );
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Belum bisa membagikan QRIS.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment QRIS'),
        centerTitle: true,
        backgroundColor: const Color(0xFF176B57),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF176B57), Color(0xFF239879)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.verified_user_outlined,
                      color: Colors.white, size: 30),
                  SizedBox(height: 14),
                  Text('Pembayaran mudah & praktis',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 6),
                  Text('Scan QRIS menggunakan aplikasi pembayaran kamu.',
                      style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
            const SizedBox(height: 22),
            Card(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 28,
                      backgroundColor: Color(0xFFE3F3ED),
                      child: Icon(Icons.storefront,
                          color: Color(0xFF176B57), size: 30),
                    ),
                    const SizedBox(height: 10),
                    const Text(storeName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    const Text(paymentNote,
                        style: TextStyle(color: Colors.black54)),
                    const SizedBox(height: 18),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFE3E8E6)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Image.asset(
                        'assets/qris.jpg',
                        height: 250,
                        width: 250,
                        fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) => const SizedBox(
                          height: 250,
                          child: Center(
                            child: Text('Tambahkan gambar QRIS ke assets/qris.jpg'),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    const Text('Nominal pembayaran',
                        style: TextStyle(color: Colors.black54)),
                    const SizedBox(height: 4),
                    const Text(amount,
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF176B57))),
                    const SizedBox(height: 18),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: () => _shareQris(context),
                        icon: const Icon(Icons.share_outlined),
                        label: const Text('Bagikan info pembayaran'),
                        style: FilledButton.styleFrom(
                          backgroundColor: const Color(0xFF176B57),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'Setelah membayar, konfirmasikan pembayaran kepada penjual. '
              'Pembayaran pada aplikasi ini belum diverifikasi otomatis.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
