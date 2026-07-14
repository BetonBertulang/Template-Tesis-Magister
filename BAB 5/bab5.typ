/*
  File: bab5.typ
  Description: Bab 5 - Panduan lanjutan (menambah bab, lampiran,
               kesalahan umum) dan penutup.
*/

= PANDUAN LANJUTAN DAN PENUTUP

== Menambah Bab Baru
Setiap bab pada templat ini disimpan sebagai berkas `.typ` terpisah di dalam folder tersendiri (mis. `BAB 3/bab3.typ`), lengkap dengan folder `Figure/` masing-masing agar gambar tiap bab mudah dikelola. Untuk menambah bab baru, misalnya BAB VI:

+ Buat folder baru `BAB 6/` beserta subfolder `BAB 6/Figure/`.
+ Buat berkas `BAB 6/bab6.typ` yang diawali dengan judul level 1, misalnya `= PEMBAHASAN LANJUTAN`.
+ Tambahkan baris pemanggilan pada `main.typ`, tepat setelah bab sebelumnya:
```typc
#include "BAB 5/bab5.typ"
#include "BAB 6/bab6.typ"
```

Karena penomoran bab, gambar, tabel, dan persamaan pada templat ini seluruhnya otomatis (lihat BAB III), bab baru akan langsung mendapat nomor "BAB VI" dan penghitung objeknya dimulai dari 1 tanpa pengaturan tambahan.

== Menyusun Lampiran
Lampiran ditulis pada berkas terpisah, `Lampiran/Lampiran.typ`, dan dipanggil pada `main.typ` setelah Daftar Pustaka:
```typc
#include "Lampiran/Lampiran.typ"
```

Isi `Lampiran.typ` ditulis dengan heading biasa (`= Judul Lampiran A`, `= Judul Lampiran B`, dst.), tetapi dibungkus oleh fungsi `setupAppendixBody()` pada `template.typ` sehingga secara otomatis:
+ Diberi penomoran alfabetis (A, A.1, B, B.1, dst.) alih-alih angka romawi seperti BAB utama.
+ Diberi label "Lampiran" alih-alih "BAB" pada judulnya.
+ Memiliki penghitung gambar dan tabel tersendiri yang terpisah dari BAB I -- BAB V.
+ Terdaftar otomatis pada Daftar Lampiran (`src/daftarLampiran.typ`), yang menyaring heading level 1 dengan `supplement: [Lampiran]` menggunakan `#outline()` -- mekanisme yang serupa dengan Daftar Gambar dan Daftar Tabel yang telah dibahas pada BAB III.

Dengan mekanisme ini, seluruh data pendukung yang terlalu rinci untuk dimuat di badan utama tesis -- seperti tabel data mentah, kode program, atau peta tambahan -- dapat disusun secara konsisten sebagai lampiran tanpa mengganggu format penomoran bab utama.

== Kesalahan Umum dan Cara Mengatasinya
Tabel berikut merangkum beberapa pesan galat (_error_) yang paling sering dijumpai saat menulis tesis dengan templat ini, beserta penyebab dan cara mengatasinya.

#figure(
  table(
    columns: (1.6fr, 1.6fr, 2.4fr),
    stroke: (x, y) => if y == 0 { (bottom: 0.7pt + black) },
    align: left,
    table.header([*Pesan Galat*], [*Penyebab Umum*], [*Cara Mengatasi*]),
    [`unknown label`], [Merujuk `@nama-label` yang belum pernah didefinisikan, atau salah ketik nama label.], [Pastikan label `<nama-label>` benar-benar ditulis tepat setelah objek (gambar/tabel/persamaan/heading) yang dituju, dan ejaannya sama persis (peka huruf besar/kecil).],
    [`label occurs multiple times`], [Dua objek berbeda diberi label dengan nama yang sama.], [Gunakan nama label yang unik untuk setiap objek, mis. beri awalan `Gambar-`, `Tabel-`, atau `Persamaan-` yang deskriptif.],
    [Galat pada pemanggilan `#gls()`], [Kunci yang dipanggil belum didaftarkan pada `listSingkatan` atau `listLambang` di `src/singkatan-dan-lambang.typ`.], [Tambahkan entri baru pada `listSingkatan`/`listLambang` sebelum memanggil `#gls("key")` tersebut, lihat BAB IV.],
    [Gambar tidak muncul / _file not found_], [Path pada `image()` salah, atau berkas gambar belum disalin ke folder `Figure/` yang sesuai.], [Periksa kembali path relatif terhadap lokasi berkas `.typ` yang memanggilnya, serta peka terhadap huruf besar/kecil pada nama berkas.],
    [Sitasi tidak muncul di Daftar Pustaka], [Kunci sitasi pada naskah tidak sama dengan kunci pada `references.bib`, atau entri belum ditambahkan ke `references.bib`.], [Samakan kunci sitasi (_case-sensitive_) dan pastikan entri sudah tersimpan di `references.bib`.],
    [Rumus matematika tidak terbaca sesuai harapan], [Huruf-huruf yang berdekatan pada mode matematika (mis. `kPa`) ditafsirkan sebagai perkalian variabel `k`, `P`, dan `a` yang terpisah.], [Gunakan tanda kutip untuk teks biasa (mis. `"kPa"`) di luar mode matematika, atau beri spasi eksplisit jika memang dimaksudkan sebagai perkalian.],
  ),
  caption: [Kesalahan umum saat menulis naskah dengan Typst dan cara mengatasinya],
)<Tabel-kesalahan-umum>

== Sumber Belajar Tambahan
Untuk memperdalam penguasaan Typst di luar cakupan panduan ini, beberapa sumber berikut dapat dijadikan rujukan:
- #link("https://typst.app/docs")[Dokumentasi resmi Typst] -- referensi lengkap seluruh fungsi dan sintaks bawaan.
- #link("https://typst.app/universe")[Typst Universe] -- direktori paket komunitas (mis. `glossarium`, `numbly`, dan `fancy-units` yang digunakan pada templat ini).
- #link("https://forum.typst.app")[Forum Typst] dan komunitas Discord resmi -- tempat bertanya dan berdiskusi seputar penggunaan Typst.
- Repositori templat ini sendiri, khususnya berkas `template.typ`, sebagai referensi langsung bagaimana setiap fitur pemformatan tesis Magister ITB diimplementasikan.

== Penutup
Panduan ini telah membahas seluruh hal mendasar yang diperlukan untuk menulis tesis Magister ITB menggunakan Typst: sintaks dasar penulisan (BAB II), penyisipan gambar, tabel, dan persamaan beserta penomoran otomatisnya (BAB III), mekanisme sitasi dan daftar pustaka (BAB IV), serta topik lanjutan seputar penambahan bab, penyusunan lampiran, dan penanganan kesalahan umum (BAB V).

Langkah selanjutnya adalah mengganti isi BAB I -- BAB V pada repositori ini dengan draf tesis Anda yang sebenarnya, dimulai dari memperbarui `src/metadata.typ` dengan judul dan data tesis Anda. Karena seluruh pengaturan format telah tertanam pada `template.typ`, Anda dapat berfokus sepenuhnya pada penulisan konten ilmiah tanpa perlu mengkhawatirkan kembali detail format penomoran, tata letak, maupun daftar referensi.
