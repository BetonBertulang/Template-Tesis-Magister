/*
  File: bab2.typ
  Description: Bab 2 - Penggunaan dasar sintaks Typst.
*/

= PENGGUNAAN DASAR TYPST

== Mode Markah, Mode Kode, dan Mode Matematika
Typst memiliki tiga mode penulisan yang dapat dicampur bebas dalam satu naskah:
+ *Mode markah* (_markup mode_), digunakan untuk menulis teks biasa beserta pemformatan ringan seperti judul, penekanan, dan daftar. Ini adalah mode aktif secara baku pada awal berkas.
+ *Mode kode* (_code mode_), diaktifkan dengan awalan tanda pagar (`#`), digunakan untuk memanggil fungsi, mendefinisikan variabel, atau menulis logika pemrograman seperti perulangan dan kondisi.
+ *Mode matematika* (_math mode_), diapit tanda dolar (`$...$`), digunakan untuk menulis persamaan matematis.

Ketiga mode ini dapat saling disisipkan. Misalnya, `#if kondisi [teks]` menyisipkan mode markah di dalam mode kode, sedangkan `$x^2$` menyisipkan mode matematika di dalam mode markah.

== Sintaks Markup Dasar

=== Judul (Heading)
Judul ditulis dengan tanda sama dengan (`=`) di awal baris; jumlah tanda menentukan tingkatannya.

```typ
= Judul Bab (Level 1)
== Judul Subbab (Level 2)
=== Judul Anak Subbab (Level 3)
```

Pada templat ini, judul level 1 secara otomatis diberi awalan "BAB" beserta nomor romawi dan diberi jeda halaman baru (lihat pengaturan pada `template.typ`), sehingga Anda tidak perlu mengetik "BAB II" secara manual -- cukup tulis `= TINJAUAN PUSTAKA` seperti pada judul bab ini.

=== Penekanan Teks
```typ
*Teks tebal* ditulis di antara tanda bintang.
_Teks miring_ ditulis di antara garis bawah.
```
menghasilkan *teks tebal* dan _teks miring_.

=== Daftar (List)
Daftar tak berurut menggunakan tanda hubung (`-`), sedangkan daftar berurut menggunakan tanda tambah (`+`):

```typ
- Poin pertama
- Poin kedua

+ Langkah pertama
+ Langkah kedua
```

Kedua bentuk daftar ini banyak digunakan pada bagian Rumusan Masalah, Tujuan, atau Kesimpulan tesis, sebagaimana dapat dilihat pada dokumen ini sendiri.

=== Tautan
Tautan ditulis dengan fungsi `#link()`:
```typ
#link("https://typst.app")[Situs resmi Typst]
```
menghasilkan #link("https://typst.app")[Situs resmi Typst].

=== Komentar
Baris yang tidak ingin ikut dikompilasi dapat ditulis sebagai komentar, baik satu baris (`//`) maupun banyak baris (`/* ... */`) seperti pada bagian atas setiap berkas `.typ` dalam templat ini.

== Mode Kode dan Variabel
Mode kode diawali tanda pagar. Variabel didefinisikan dengan `#let` dan dapat dipanggil ulang di bagian lain naskah -- inilah mekanisme yang digunakan `src/metadata.typ` untuk menyimpan judul, nama, dan NIM secara terpusat.

```typc
#let namaPenulis = "Nama Mahasiswa"
#let tahun = 2026

Naskah ini ditulis oleh #namaPenulis pada tahun #tahun.
```

Untuk memakai fungsi atau variabel dari berkas lain, gunakan `#import`:
```typc
#import "metadata.typ": studentName, studentId
// atau mengimpor seluruh isi berkas sekaligus:
#import "metadata.typ": *
```

Paket eksternal (_package_) dari repositori Typst Universe diimpor dengan awalan `@preview`, seperti glosarium yang dipakai templat ini untuk Daftar Singkatan dan Lambang:
```typc
#import "@preview/glossarium:0.5.10": gls, make-glossary, register-glossary
```

== Aturan `set` dan `show`
Alih-alih memformat setiap elemen satu per satu, Typst menyediakan aturan `set` dan `show` untuk mengatur format secara terpusat.

`#set` mengubah nilai baku (_default_) suatu elemen untuk sisa naskah setelah baris tersebut:
```typc
#set text(font: "Times New Roman", size: 12pt, lang: "id")
#set par(justify: true, leading: 1.3em)
```
Kedua baris di atas persis seperti yang digunakan pada `template.typ` untuk menetapkan jenis huruf, ukuran teks, dan perataan paragraf ke seluruh naskah tesis.

`#show` mendefinisikan ulang cara suatu elemen ditampilkan, dan dapat dibatasi hanya untuk elemen dengan kriteria tertentu menggunakan `.where()`:
```typc
#show heading.where(level: 1): chapterHeading => {
  pagebreak(weak: true)
  set text(size: 14pt, weight: "bold")
  set align(center)
  chapterHeading
}
```
Potongan ini -- yang disederhanakan dari `template.typ` -- menjelaskan mengapa setiap judul level 1 (`= ...`) pada tesis Anda otomatis dimulai di halaman baru, dicetak tebal, dan rata tengah, tanpa perlu Anda mengatur ulang setiap bab.

== Menulis Persamaan Matematika
Persamaan sisipan (_inline_) ditulis di antara tanda dolar tunggal, misalnya faktor keamanan $F_s$. Persamaan blok (_display equation_) ditulis dengan baris tersendiri:

```typ
$
  F_s = (c' + sigma_n tan phi')/tau
$
```

Pangkat menggunakan tanda sisip (`^`), indeks bawah menggunakan garis bawah (`_`), dan pecahan cukup ditulis dengan tanda bagi (`/`) -- Typst secara otomatis menyusunnya sebagai pecahan vertikal pada mode matematika. Sebagai contoh, ekspresi persamaan kestabilan lereng tak hingga (_infinite slope_) dapat dituliskan sebagai berikut:
$
  F_s = (c' + sigma_n tan phi')/tau
$
Penjelasan lebih lengkap mengenai penomoran otomatis dan referensi silang persamaan dibahas pada BAB III.

== Label dan Referensi Silang
Objek seperti judul, gambar, tabel, dan persamaan dapat diberi label unik dengan menuliskan `<nama-label>` tepat setelah objek tersebut, kemudian dirujuk di bagian lain naskah dengan `@nama-label`.

```typ
== Metodologi Analisis <Bab-Metodologi>
...
Tahapan ini mengacu pada kerangka kerja yang dijelaskan pada @Bab-Metodologi.
```

Mekanisme yang sama berlaku untuk gambar, tabel, dan persamaan -- dibahas lebih rinci pada BAB III -- sehingga nomor bab, gambar, tabel, atau persamaan yang dirujuk akan selalu konsisten meskipun Anda menambah atau memindahkan bagian naskah di kemudian hari.
