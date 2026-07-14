/*
  File: bab3.typ
  Description: Bab 3 - Menambahkan figure (gambar), tabel, dan persamaan
               beserta penomoran dan referensi silangnya.
*/

= MENAMBAHKAN FIGURE, TABEL, DAN PERSAMAAN

== Menyisipkan Gambar
Gambar disisipkan dengan fungsi `#figure()` yang membungkus fungsi `#image()`, kemudian diberi keterangan (_caption_) dan label untuk dirujuk silang:

```typ
#figure(
  image("Figure/nama-berkas.jpg", width: 80%),
  caption: [Keterangan singkat gambar],
)<Gambar-label>
```

Berkas gambar sebaiknya disimpan di dalam folder `Figure/` pada masing-masing folder bab (mis. `BAB 1/Figure/`), sehingga path pada `image()` dapat ditulis relatif terhadap berkas `.typ` yang memanggilnya. Contoh berikut menyisipkan logo ITB yang tersimpan pada folder `Figure/` di direktori utama repositori, diakses dari dalam folder `BAB 3/` menggunakan path relatif `../Figure/`:

#figure(
  image("../Figure/Logo-itb.jpg", height: 3cm),
  caption: [Contoh penyisipan gambar menggunakan `#figure()` dan `#image()`],
)<Gambar-contoh-logo>

Gambar di atas dirujuk pada teks dengan menuliskan `@Gambar-contoh-logo`, yang akan menghasilkan tautan otomatis ke nomor gambar, seperti pada @Gambar-contoh-logo.

=== Mengatur Ukuran dan Posisi
Parameter yang umum digunakan pada `#image()` dirangkum pada @Tabel-opsi-image.

#figure(
  table(
    columns: (1fr, 1.4fr, 2.6fr),
    stroke: (x, y) => if y == 0 { (bottom: 0.7pt + black) },
    align: (x, y) => left,
    table.header([*Parameter*], [*Contoh Nilai*], [*Keterangan*]),
    [`width`], [`80%`, `10cm`], [Lebar gambar, dapat relatif terhadap lebar kolom teks atau absolut.],
    [`height`], [`5cm`, `auto`], [Tinggi gambar; jika hanya salah satu dari `width`/`height` diisi, proporsi gambar dijaga otomatis.],
    [`fit`], [`"cover"`, `"contain"`, `"stretch"`], [Cara gambar disesuaikan bila `width` dan `height` diisi bersamaan.],
    [`alt`], [`"Deskripsi gambar"`], [Teks alternatif untuk aksesibilitas, tidak tampil pada PDF.],
  ),
  caption: [Parameter umum pada fungsi `#image()`],
)<Tabel-opsi-image>

Untuk gambar yang lebar (mis. peta atau diagram alir), gunakan `width: 100%` agar gambar mengisi penuh lebar kolom teks tanpa melampaui margin halaman, sebagaimana banyak dicontohkan pada BAB II tesis ini.

=== Posisi Keterangan Gambar dan Tabel
Templat ini telah mengatur posisi keterangan secara berbeda untuk gambar dan tabel melalui `template.typ`:
```typc
show figure.where(kind: table): set figure.caption(position: top)
show figure.where(kind: image): set figure.caption(position: bottom)
```
Artinya, keterangan tabel akan otomatis diletakkan di atas tabel, sedangkan keterangan gambar diletakkan di bawah gambar -- sesuai kaidah penulisan karya ilmiah yang berlaku. Anda tidak perlu mengatur posisi ini secara manual pada setiap gambar atau tabel.

== Membuat Tabel
Tabel dibuat dengan fungsi `#table()`, umumnya dibungkus `#figure()` agar bernomor dan dapat dirujuk silang seperti gambar. Berikut contoh yang langsung dikompilasi sebagai @Tabel-contoh:

```typ
#figure(
  table(
    columns: (1.6fr, 0.8fr, 0.8fr, 1.8fr),
    table.header([*Parameter*], [*Simbol*], [*Satuan*], [*Sumber*]),
    "Kohesi Efektif", "c'", "kPa", "Hasil uji laboratorium",
    "Sudut Geser Dalam", [$phi.alt$], [°], "Hasil uji laboratorium",
  ),
  caption: [Contoh kebutuhan data parameter geoteknik],
)<Tabel-contoh>
```

#figure(
  table(
    columns: (1.6fr, 0.8fr, 0.8fr, 1.8fr),
    table.header([*Parameter*], [*Simbol*], [*Satuan*], [*Sumber*]),
    "Kohesi Efektif", "c'", "kPa", "Hasil uji laboratorium",
    "Sudut Geser Dalam", [$phi.alt$], [°], "Hasil uji laboratorium",
  ),
  caption: [Contoh kebutuhan data parameter geoteknik],
)<Tabel-contoh>

Parameter `columns` menentukan jumlah dan lebar kolom -- angka diikuti `fr` (_fraction_) membagi ruang tersisa secara proporsional, sedangkan `auto` menyesuaikan lebar dengan isi kolom. Baris `table.header()` menandai baris judul kolom agar dikenali secara semantik (mis. terulang otomatis jika tabel terpotong ke halaman berikutnya).

=== Kustomisasi Tampilan Tabel
Gaya tabel baku pada templat ini -- garis horizontal tipis hanya di bawah baris judul, kolom pertama rata kiri dan kolom lain rata tengah -- sudah diatur secara global pada `template.typ` melalui:
```typc
#set table(
  stroke: (x, y) => if y == 0 { (bottom: 0.7pt + black) },
  align: (x, y) => if x > 0 { center } else { left },
)
```
Fungsi `stroke` dan `align` di atas menerima posisi kolom (`x`) dan baris (`y`) sebagai argumen, sehingga Anda dapat menulis logika kondisional untuk menentukan tampilan setiap sel. Karena pengaturan ini sudah berlaku global, sebagian besar tabel pada tesis Anda cukup ditulis seperti pada @Tabel-contoh tanpa perlu mengulang pengaturan `stroke` dan `align` setiap kali.

Untuk tabel panjang yang perlu terpotong ke halaman berikutnya (mis. rekapitulasi data lapangan), tambahkan `breakable: true` pada blok pembungkusnya -- templat ini telah mengaktifkannya secara baku untuk semua tabel melalui `show figure.where(kind: table): set block(breakable: true)`.

== Menomori dan Merujuk Persamaan
Persamaan blok yang diberi label akan otomatis diberi nomor dan dapat dirujuk silang, sama seperti gambar dan tabel. Contoh berikut ditulis dengan:

```typ
$
  a^2 + b^2 = c^2
$ <Persamaan-pythagoras>
```

dan menghasilkan persamaan bernomor berikut:
$
  a^2 + b^2 = c^2
$ <Persamaan-pythagoras>

Persamaan tersebut dapat dirujuk pada kalimat seperti "berdasarkan @Persamaan-pythagoras, panjang sisi miring segitiga siku-siku dapat dihitung." Perhatikan bahwa `@nama-label` menghasilkan tautan yang otomatis menyesuaikan diri jika nomor persamaan berubah karena penambahan atau pemindahan persamaan lain sebelumnya.

== Penomoran Otomatis Berbasis Bab
Salah satu fitur khusus templat ini adalah penomoran gambar, tabel, dan persamaan mengikuti format *Bab.Nomor* (mis. @Gambar-contoh-logo di atas bernomor "Gambar III.1" karena berada pada BAB III), bukan penomoran berurutan untuk seluruh dokumen. Mekanisme ini diatur pada `setupMainBody()` di `template.typ`:

```typc
#set figure(numbering: figureNumber => {
  let chapterNumber = counter(heading).get().first()
  numbering("I.1", chapterNumber, figureNumber)
})

#set math.equation(
  numbering: (..nums) => {
    let chapterNumber = counter(heading).get().first()
    numbering("(I.1)", chapterNumber, nums.pos().first())
  },
  block: true,
)
```

Penghitung nomor gambar, tabel, dan persamaan juga direset ke nol setiap kali memasuki judul BAB baru, sehingga setiap bab selalu mulai dari nomor 1 -- itulah sebabnya @Persamaan-pythagoras di atas bernomor (III.1), bukan melanjutkan nomor dari bab sebelumnya. Karena logika ini sudah tertanam pada templat, Anda tidak perlu -- dan sebaiknya tidak -- menuliskan nomor gambar, tabel, atau persamaan secara manual; cukup gunakan label dan referensi silang seperti dicontohkan di atas.

== Daftar Gambar dan Daftar Tabel Otomatis
Daftar Gambar dan Daftar Tabel pada bagian awal (_frontmatter_) tesis dihasilkan otomatis dari seluruh gambar dan tabel berlabel di sepanjang naskah, tanpa perlu disusun manual. Mekanismenya memanfaatkan fungsi `#outline()` yang menyaring figure berdasarkan jenisnya (`kind: image` atau `kind: table`):

```typc
// src/daftarGambar.typ
#outline(title: none, target: figure.where(kind: image))

// src/daftarTabel.typ
#outline(title: none, target: figure.where(kind: table))
```

Konsekuensinya, setiap kali Anda menambah gambar atau tabel baru menggunakan `#figure()` beserta keterangannya, entri tersebut akan otomatis muncul pada Daftar Gambar atau Daftar Tabel setelah dokumen dikompilasi ulang -- termasuk @Gambar-contoh-logo dan @Tabel-contoh pada bab ini.
