/**
 * Berkas utama untuk menulis konten lampiran.
 * Berkas ini harus diletakkan pada akhir main.typ (Backmatter).
 * Tulis setiap lampiran sebagai heading level 1 biasa ("= Judul Lampiran"),
 * persis seperti menulis BAB pada tubuh utama -- penomoran alfabetis (A, B, ...)
 * dan sub-heading (A.1, A.2, ...) diterapkan otomatis oleh setupAppendixBody.
 */
#import "../template.typ": setupAppendixBody

#align(center + horizon)[
  *LAMPIRAN*
]

#pagebreak()
#show: setupAppendixBody

= Contoh Struktur Lampiran
Bagian ini mendemonstrasikan bahwa mekanisme penomoran lampiran (A, A.1, B, ...) berlaku terpisah dari penomoran BAB I -- BAB V pada tubuh utama tesis. Sebagai contoh, tabel berikut diberi label dan akan bernomor "Tabel A.1", bukan melanjutkan nomor tabel dari BAB IV.

#figure(
  table(
    columns: (1fr, 1fr),
    stroke: (x, y) => if y == 0 { (bottom: 0.7pt + black) },
    align: left,
    table.header([*Kolom 1*], [*Kolom 2*]),
    [Contoh data], [Contoh nilai],
  ),
  caption: [Contoh tabel data pendukung pada lampiran],
)<Tabel-contoh-lampiran>

== Sub-Lampiran Pertama
Judul di atas berupa heading level 2 sehingga bernomor "A.1" secara otomatis, mengikuti judul lampiran level 1 di atasnya.

= Contoh Lampiran Kedua
Lampiran baru yang ditulis sebagai heading level 1 berikutnya akan otomatis diberi huruf "B", melanjutkan pola alfabetis dari lampiran sebelumnya.
