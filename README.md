# Flutter Shop Demo

Demo aplikasi toko sederhana dibuat untuk tugas PAB. Aplikasi ini menampilkan daftar produk dengan pencarian dan filter kategori (horizontal chip slider), keranjang belanja, dan halaman checkout dengan ringkasan pesanan serta form pengiriman.

## Fitur

- Pencarian produk berdasarkan nama (kotak pencarian di halaman produk).
- Filter kategori menggunakan slider-like horizontal chips (ketuk chip untuk memfilter).
- Tambah produk ke keranjang, ubah jumlah, atau hapus item di halaman cart.
- Halaman checkout menampilkan ringkasan pesanan dan form pengiriman (nama, alamat, telepon).

## Cara menjalankan

Pastikan Flutter terinstal dan toolchain platform telah disiapkan.

Install dependensi:

```bash
flutter pub get
```

Jalankan aplikasi (pilih device/emulator):

```bash
flutter run
```

Untuk menjalankan di Windows:

```bash
flutter run -d windows
```

## Cara menggunakan

1. Buka aplikasi — halaman produk muncul.
2. Gunakan kotak pencarian untuk menemukan produk berdasarkan nama.
3. Ketuk chip kategori pada bar horizontal untuk memfilter produk.
4. Ketuk "Add" pada produk untuk menambahkannya ke keranjang.
5. Buka keranjang dari ikon di kanan atas untuk mengubah kuantitas atau menghapus item.
6. Tekan "Checkout" untuk membuka halaman checkout, isi form, lalu tekan "Place Order" (demo ini hanya membersihkan keranjang dan menampilkan konfirmasi).

---

## Screenshots

Produk (search + chips):

<img width="166" height="351" alt="image" src="https://github.com/user-attachments/assets/7ba6298b-f08d-4b67-9013-b09cc72186e2" />

Cart (review & checkout):

<img width="166" height="351" alt="image" src="https://github.com/user-attachments/assets/e28ef03c-5a37-4735-819a-54bd0d559744" />

Checkout (order summary + form):

<img width="166" height="351" alt="image" src="https://github.com/user-attachments/assets/cab58cdf-a297-44d5-b65f-46788a0be257" />
