# QRIS Payment Pribadi — Flutter

Aplikasi sederhana untuk menampilkan gambar QRIS dan informasi pembayaran manual.

## Yang perlu kamu ubah

1. Ganti `assets/qris.jpg` dengan gambar QRIS milikmu sendiri. Gunakan nama file yang sama: `qris.jpg`.
2. Buka `lib/main.dart`, lalu ubah:
   - `storeName` menjadi nama toko/namamu.
   - `paymentNote` jika ingin mengganti keterangan.
   - `amount` menjadi nominal pembayaran.
3. Jangan mengubah QRIS menjadi gambar buram atau memotong bagian kode. Tes scan QRIS sebelum digunakan.

## Menjalankan dan membuat APK

Kamu memerlukan Flutter SDK dan Android SDK yang terpasang di komputer.

```bash
flutter pub get
flutter run
flutter build apk --release
```

APK hasil build biasanya berada di:

`build/app/outputs/flutter-apk/app-release.apk`

## Catatan

- Ini adalah template source code, bukan APK yang sudah dikompilasi.
- Pembayaran bersifat manual; aplikasi tidak memverifikasi transaksi atau membaca mutasi rekening.
- Jangan memasukkan PIN, kata sandi, atau OTP ke aplikasi.
