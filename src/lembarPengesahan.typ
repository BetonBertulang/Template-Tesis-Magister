/*
  File: halamanPengesahan.typ
  Description: Membangkitkan halaman lembar pengesahan tesis yang merujuk pada
               format standar ITB untuk dua pembimbing (Lampiran A). Modul ini
               menyusun tata letak simetris untuk judul, identitas mahasiswa,
               serta menyediakan ruang tanda tangan yang sejajar untuk Ketua dan Anggota.
*/

#import "metadata.typ": *


= LEMBAR PENGESAHAN
// Memastikan seluruh konten berada di tengah halaman
#align(center)[

  // Judul Tesis: Huruf kapital, ukuran 14pt, dan cetak tebal
  #text(size: 14pt, weight: "bold")[
    #thesisTitle
  ]
  \ \
  #text(size: 14pt, weight: "bold")[

    Oleh \
    #studentName \
    NIM: #studentId \
    (Program Studi #studyProgram) \
    Institut Teknologi Bandung \
    \
  ]
  Menyetujui \
  Dosen Pembimbing \
  Tanggal #signDate \


  // Menggunakan grid untuk tata letak tanda tangan yang rapi dan sejajar
  #grid(
    columns: (1fr, 1fr),
    row-gutter: 6em,
    // Jarak vertikal yang dialokasikan untuk membubuhkan tanda tangan

    // Baris penunjuk status pembimbing
    [], [],

    // Baris nama pembimbing, NIP, beserta garis tanda tangan
    // Ganti dengan nama dan NIP pembimbing Anda yang sebenarnya.
    [
      #line(length: 70%, stroke: 0.8pt)
      Nama Pembimbing 1, Gelar
      NIP. -
    ],
    [
      #line(length: 70%, stroke: 0.8pt)
      Nama Pembimbing 2, Gelar \
      NIP. -
    ],
  )
]
