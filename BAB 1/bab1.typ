/*
  File: bab1.typ
  Description: Bab 1 - Pendahuluan panduan penggunaan Typst untuk
               penulisan Tesis Magister ITB.
*/

= PENDAHULUAN

== Tentang Panduan Ini
Panduan ini disusun untuk membantu mahasiswa Program Magister Institut Teknologi Bandung (ITB) menulis naskah tesis menggunakan #link("https://typst.app")[Typst], sebuah sistem penyiapan dokumen (_typesetting system_) generasi baru. Panduan ini ditulis langsung di atas templat tesis Magister ITB berbasis Typst yang sama, sehingga setiap contoh yang ditampilkan -- mulai dari sintaks dasar, penyisipan gambar dan tabel, hingga sitasi -- benar-benar berjalan dan dapat dilihat hasilnya pada naskah ini sendiri.

Dokumen ini disusun mengikuti struktur bab yang sama seperti tesis pada umumnya (BAB 1 -- BAB 5) agar Anda terbiasa dengan tata letak, penomoran, dan format yang akan digunakan pada tesis Anda yang sebenarnya. Setelah memahami panduan ini, Anda dapat mengganti seluruh isi BAB 1 -- BAB 5 dengan draf tesis Anda sendiri tanpa perlu mengubah pengaturan format apa pun.

== Apa Itu Typst
Typst adalah bahasa markah (_markup language_) sekaligus kompilator dokumen yang dirancang sebagai alternatif dari LaTeX. Berbeda dengan pengolah kata WYSIWYG (_What You See Is What You Get_) seperti Microsoft Word, naskah pada Typst ditulis sebagai teks biasa berisi kode format, kemudian dikompilasi menjadi dokumen PDF yang rapi dan konsisten. Pendekatan ini memisahkan proses penulisan konten dari pengaturan tampilan, sehingga format tesis (margin, penomoran, gaya judul, dan sebagainya) hanya perlu diatur satu kali pada berkas templat dan akan otomatis berlaku ke seluruh naskah.

== Mengapa Menggunakan Typst untuk Tesis
Dibandingkan dengan LaTeX yang selama ini umum digunakan untuk naskah ilmiah, Typst menawarkan beberapa keunggulan praktis:
+ *Sintaks lebih ringkas.* Perintah pemformatan umum seperti judul, penekanan teks, dan daftar bernomor ditulis lebih singkat dibandingkan LaTeX.
+ *Kompilasi jauh lebih cepat.* Typst mengompilasi ulang naskah dalam hitungan milidetik, sehingga dapat digunakan dalam mode pratinjau langsung (_live preview_).
+ *Pesan galat lebih mudah dipahami.* Ketika terjadi kesalahan penulisan, Typst menunjukkan lokasi dan penyebab galat secara jelas, tidak seperti galat LaTeX yang seringkali sulit ditelusuri.
+ *Tidak memerlukan instalasi distribusi yang besar.* Typst berupa satu berkas biner tunggal (atau dapat dijalankan langsung di peramban melalui #link("https://typst.app")[typst.app]), tanpa perlu memasang distribusi TeX yang berukuran gigabita.
+ *Sistem *`set`* dan *`show`* rule yang deklaratif* memudahkan pengaturan format tesis secara terpusat, seperti yang diterapkan pada berkas `template.typ` dalam repositori ini.

== Instalasi dan Perkakas
Untuk mulai menulis, Anda memerlukan:
+ *Typst versi 0.11.0 atau lebih baru.* Instalasi dapat dilakukan melalui pengelola paket (`winget install --id Typst.Typst`, `brew install typst`, `cargo install typst-cli`), atau digunakan langsung tanpa instalasi melalui #link("https://typst.app")[typst.app].
+ *Editor kode* seperti Visual Studio Code dengan ekstensi _Tinymist Typst_ yang menyediakan pratinjau langsung, pemeriksaan galat, dan pelengkapan otomatis (_autocomplete_).
+ *Git* (opsional) untuk mengelola versi naskah tesis, terutama jika bekerja sama dengan pembimbing atau mengunggah cadangan berkas.

== Struktur Berkas Templat
Templat ini disusun secara modular. Tabel berikut merangkum berkas dan folder utama beserta fungsinya.

#figure(
  table(
    columns: (1.2fr, 2.2fr),
    stroke: (x, y) => if y == 0 { (bottom: 0.7pt + black) },
    align: (x, y) => if x == 0 { left } else { left },
    table.header([*Berkas / Folder*], [*Keterangan*]),
    [`main.typ`], [Berkas utama yang memuat seluruh bagian dokumen secara berurutan.],
    [`template.typ`], [Definisi fungsi format: halaman sampul, margin, gaya judul, penomoran objek.],
    [`src/metadata.typ`], [Data tesis: judul, nama, NIM, program studi, tanggal.],
    [`src/abstrak.typ`, `src/abstract.typ`], [Abstrak dalam Bahasa Indonesia dan Bahasa Inggris.],
    [`src/pedoman.typ`], [Halaman pedoman penggunaan tesis (hak cipta dan format sitasi karya).],
    [`src/daftarIsi.typ`, `src/daftarGambar.typ`, `src/daftarTabel.typ`, `src/daftarLampiran.typ`], [Daftar isi, gambar, tabel, dan lampiran yang dihasilkan otomatis.],
    [`src/singkatan-dan-lambang.typ`], [Daftar singkatan dan lambang berbasis glosarium.],
    [`BAB 1/` -- `BAB 5/`], [Folder tiap bab, masing-masing berisi berkas `.typ` dan folder `Figure/` sendiri.],
    [`Lampiran/`], [Berkas dan gambar untuk bagian lampiran.],
    [`references.bib`], [Basis data pustaka untuk sitasi.],
    [`itb.csl`], [Berkas gaya sitasi (_Citation Style Language_) ITB.],
  ),
  caption: [Struktur berkas utama templat tesis Magister ITB],
)<Tabel-struktur-berkas>

== Cara Mengompilasi Dokumen
Kompilasi dilakukan melalui baris perintah (_command line_) dari folder repositori:

```bash
typst compile main.typ
```

Perintah di atas akan menghasilkan berkas `main.pdf`. Untuk mode pratinjau langsung yang otomatis mengompilasi ulang setiap kali berkas disimpan, gunakan:

```bash
typst watch main.typ
```

Jika menggunakan editor dengan ekstensi Tinymist, pratinjau dapat langsung dibuka dari dalam editor tanpa perlu menjalankan perintah di atas secara manual.

== Sistematika Panduan
Panduan ini disusun dengan sistematika sebagai berikut:

*BAB I PENDAHULUAN*

Bab ini menjelaskan tujuan panduan, gambaran umum Typst, serta struktur berkas templat dan cara mengompilasinya.

*BAB II PENGGUNAAN DASAR TYPST*

Bab ini membahas sintaks dasar Typst: heading, penekanan teks, daftar, mode kode, variabel, serta aturan `set` dan `show` untuk mengatur format teks dan halaman.

*BAB III MENAMBAHKAN FIGURE, TABEL, DAN PERSAMAAN*

Bab ini menjelaskan cara menyisipkan gambar, tabel, dan persamaan matematis sebagai objek bernomor yang dapat dirujuk silang, termasuk fitur penomoran otomatis berbasis bab pada templat ini.

*BAB IV SITASI DAN DAFTAR PUSTAKA*

Bab ini memaparkan cara menyiapkan basis data pustaka, menyisipkan sitasi dalam berbagai bentuk, serta menyusun daftar singkatan dan lambang menggunakan glosarium.

*BAB V PANDUAN LANJUTAN DAN PENUTUP*

Bab penutup membahas topik lanjutan seperti menambah bab baru, menyusun lampiran, kesalahan umum dan cara mengatasinya, serta sumber belajar tambahan.
