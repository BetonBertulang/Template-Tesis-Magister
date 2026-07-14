#import "template.typ": setupMainBody, thesisTemplate
#import "src/metadata.typ": *
#import "@preview/fancy-units:0.1.1": unit
#import "@preview/glossarium:0.5.10": gls, make-glossary, register-glossary
#import "src/singkatan-dan-lambang.typ": *

// #import "Lampiran.typ": *


// Inisialisasi Templat


#show: thesisTemplate.with(
  thesisTitle: thesisTitle,
  englishTitle: englishTitle,
  studentName: studentName,
  studentId: studentId,
  studyProgram: studyProgram,
  submissionDate: submissionDate,
)

// Menyiapkan glosarium (Singkatan & Lambang). Auto-first-use di heading/figure
// dimatikan karena heading & figure sudah dikustomisasi sendiri oleh template ini.
#show: make-glossary.with(heading-always-first: false, figure-caption-always-first: false)
#register-glossary(listSingkatan + listLambang)

// --- BAGIAN PERSIAPAN (FRONTMATTER)
//Memuat ABSTRAK BAHASA INDONESIA
// #include "src/abstrak.typ"
// #pagebreak(weak: true)

// // // Memuat Abstract Bahasa Inggris
#include "src/abstract.typ"
#pagebreak(weak: true)

#include "src/lembarPengesahan.typ"
// #pagebreak(weak: true)

//Memuat Pedoman Penggunaan
#include "src/pedoman.typ"
#pagebreak(weak: true)

// #include "Acknowledge.typ"
// #pagebreak(weak: true)

// Memuat Daftar Isi
#include "src/daftarIsi.typ"
#pagebreak(weak: true)

// Memuat Daftar Gambar
#include "src/daftarGambar.typ"
#pagebreak(weak: true)

//Memuat Daftar Tabel
#include "src/daftarTabel.typ"
#pagebreak(weak: true)

// Memuat Daftar Lampiran (DITAMBAHKAN SETELAH DAFTAR TABEL)
#include "src/daftarLampiran.typ"
#pagebreak(weak: true)

// Memuat Daftar Singkatan dan Lambang (DITAMBAHKAN SETELAH DAFTAR LAMPIRAN)
#include "src/singkatan-dan-lambang.typ"
#pagebreak(weak: true)

// --- TUBUH UTAMA (MAIN BODY) ---
#show: setupMainBody

#include "BAB 1/bab1.typ"

#include "BAB 2/bab2.typ"

#include "BAB 3/bab3.typ"

#include "BAB 4/bab4.typ"

#include "BAB 5/bab5.typ"


#bibliography("references.bib", style: "itb.csl", title: "DAFTAR PUSTAKA")
#pagebreak(weak: true)


#include "Lampiran/Lampiran.typ"

