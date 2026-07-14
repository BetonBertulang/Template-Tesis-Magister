/*
  File: bab4.typ
  Description: Bab 4 - Sitasi dan daftar pustaka, termasuk daftar
               singkatan dan lambang berbasis glosarium.
*/
#import "@preview/glossarium:0.5.10": gls

= SITASI DAN DAFTAR PUSTAKA

== Menyiapkan Basis Data Pustaka (references.bib)
Seluruh pustaka yang akan disitasi didaftarkan terlebih dahulu pada berkas `references.bib` menggunakan format BibTeX. Setiap entri terdiri atas jenis pustaka (`@article`, `@book`, `@mastersthesis`, `@report`, `@web_page`, dan sebagainya), kunci sitasi unik (_citation key_), serta bidang data seperti pengarang, judul, dan tahun. Contoh:

```typc
@book{triatmodjo2010hidrologie,
  title={Hidrologi Terapan},
  author={Triatmodjo, Bambang},
  year={2010},
  publisher={Beta Offset}
}

@mastersthesis{sugianti2021,
  author  = {Sugianti, K.},
  title   = {Pengaruh kenaikan curah hujan terhadap kestabilan lereng ...},
  school  = {Institut Teknologi Bandung},
  year    = {2021},
  type    = {Tesis Program Magister}
}
```

Kunci sitasi (mis. `triatmodjo2010hidrologie`, `sugianti2021`) inilah yang dipanggil di dalam naskah untuk menyisipkan sitasi.

== Menyisipkan Sitasi

=== Bentuk Singkat: `@key`
Cara tercepat menyisipkan sitasi adalah menuliskan tanda `@` diikuti kunci sitasi, yang akan otomatis menghasilkan kutipan dalam kurung sesuai gaya sitasi yang aktif. Misalnya, `@triatmodjo2010hidrologie` menghasilkan @triatmodjo2010hidrologie, dan biasanya diletakkan di akhir kalimat sebagai rujukan pendukung.

=== Bentuk `#cite()` dan Variasi `form`
Untuk kebutuhan yang lebih fleksibel -- misalnya menjadikan nama pengarang sebagai subjek kalimat -- gunakan fungsi `#cite()` dengan parameter `form`:

```typ
#cite(<sugianti2021>, form: "prose")
#cite(<sugianti2021>, form: "author")
#cite(<sugianti2021>, form: "year")
```

Ketiganya menghasilkan gaya kutipan yang berbeda:
+ `form: "prose"` menghasilkan #cite(<sugianti2021>, form: "prose") -- cocok digunakan sebagai subjek atau awal kalimat, sebagaimana banyak dicontohkan pada bab tinjauan pustaka tesis.
+ `form: "author"` menghasilkan #cite(<sugianti2021>, form: "author") -- hanya menampilkan nama pengarang, cocok saat tahun sudah disebutkan sebelumnya dalam paragraf yang sama.
+ `form: "year"` menghasilkan #cite(<sugianti2021>, form: "year") -- hanya menampilkan tahun, digunakan saat nama pengarang sudah disebutkan sebagai subjek kalimat secara eksplisit.

Sebagai perbandingan, bentuk singkat @triatmodjo2010hidrologie yang diletakkan di akhir kalimat setara dengan menuliskan `#cite(<triatmodjo2010hidrologie>)` tanpa parameter `form`.

== Mensitasi Banyak Sumber Sekaligus
Beberapa sumber dapat disitasi bersamaan dengan menuliskan beberapa tanda `@key` secara berurutan tanpa spasi, dipisahkan tanda `@`:

```typ
Beberapa studi terdahulu @sugianti2021@Hamzah2025@triatmodjo2010hidrologie
telah membahas topik terkait.
```

menghasilkan: Beberapa studi terdahulu @sugianti2021@Hamzah2025@triatmodjo2010hidrologie telah membahas topik terkait.

== Gaya Sitasi ITB dan Daftar Pustaka
Format tampilan sitasi dan daftar pustaka diatur oleh berkas gaya CSL (_Citation Style Language_), `itb.csl`, yang mengikuti kaidah penulisan Sekolah Pascasarjana ITB (gaya pengarang-tahun / _author-date_). Berkas ini dipanggil satu kali pada `main.typ`:

```typc
#bibliography("references.bib", style: "itb.csl", title: "DAFTAR PUSTAKA")
```

Daftar Pustaka pada halaman terakhir tesis akan tersusun otomatis -- terurut abjad dan diformat sesuai `itb.csl` -- dari seluruh pustaka yang benar-benar disitasi di sepanjang naskah (bukan seluruh entri pada `references.bib`). Artinya, Anda dapat menyimpan lebih banyak pustaka pada `references.bib` daripada yang akhirnya digunakan, tanpa mengotori Daftar Pustaka dengan entri yang tidak disitasi.

Jika suatu saat gaya sitasi perlu diganti (mis. mengikuti gaya jurnal tertentu), cukup ganti nama berkas pada parameter `style:` dengan berkas CSL lain -- ribuan gaya CSL untuk berbagai jurnal dan institusi tersedia secara bebas di #link("https://www.zotero.org/styles")[Zotero Style Repository].

== Daftar Singkatan dan Lambang dengan Glosarium
Selain sitasi pustaka, templat ini juga menyediakan mekanisme untuk menyusun Daftar Singkatan dan Lambang secara otomatis menggunakan paket `glossarium`. Setiap istilah didaftarkan satu kali pada `src/singkatan-dan-lambang.typ`:

```typc
#let listSingkatan = (
  (key: "PDF", short: "PDF", long: "Portable Document Format", group: "Singkatan"),
  (key: "CSL", short: "CSL", long: "Citation Style Language", group: "Singkatan"),
)
```

Selanjutnya, setiap kali istilah tersebut muncul dalam naskah, panggil dengan fungsi `#gls("key")`, misalnya `#gls("CSL")` akan menampilkan istilah #gls("CSL") apabila kunci `"CSL"` telah didaftarkan. Keuntungan menggunakan `#gls()` dibandingkan menuliskan singkatan secara manual adalah nomor halaman kemunculan pertama istilah tersebut akan otomatis terisi pada tabel Daftar Singkatan dan Lambang, tanpa perlu ditelusuri dan diperbarui secara manual setiap kali naskah disunting.

Perlu diperhatikan bahwa `#gls("key")` hanya dapat dipanggil untuk kunci yang sudah terdaftar pada `listSingkatan` atau `listLambang`; memanggil kunci yang belum didaftarkan akan menyebabkan galat saat kompilasi. Oleh karena itu, setiap kali Anda memperkenalkan singkatan atau lambang baru pada naskah tesis, pastikan menambahkan entrinya terlebih dahulu pada `src/singkatan-dan-lambang.typ` sebelum memanggilnya dengan `#gls()`.
