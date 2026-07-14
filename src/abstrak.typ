/*
  File: abstrak.typ
  Description: Contains the Indonesian abstract of the thesis.
               The first line is styled as a level 1 heading without numbering.
*/
#import "metadata.typ": *

#set par(justify: true)


= ABSTRAK

#align(center)[
  #title(thesisTitle)\
  Oleh\
  #text(size: 14pt, weight: "bold", top-edge: "baseline")[
    #studentName\
    NIM: #studentId\
    (Program Studi #studyProgram)
  ]
]\

Typst merupakan sistem penyiapan dokumen (_typesetting system_) generasi baru yang dirancang sebagai alternatif dari LaTeX, dengan sintaks yang lebih ringkas, pesan galat yang lebih mudah dipahami, dan waktu kompilasi yang jauh lebih cepat. Meningkatnya kebutuhan mahasiswa Program Magister Institut Teknologi Bandung (ITB) untuk menyusun tesis sesuai pedoman format yang berlaku, sementara pengalaman dengan perkakas penyiapan dokumen berbasis markah (_markup_) masih terbatas, memunculkan kebutuhan akan sebuah panduan praktis yang memandu proses penulisan tesis menggunakan Typst dari awal hingga akhir.
\
Panduan ini disusun dengan memanfaatkan templat tesis Magister ITB berbasis Typst yang sama sebagai wahana penulisannya sekaligus sebagai contoh langsung (_working example_) dari setiap fitur yang dijelaskan. Materi disusun secara bertahap, dimulai dari pengenalan sintaks dasar Typst -- meliputi penulisan judul, penekanan teks, daftar, mode kode, serta aturan `set` dan `show` -- dilanjutkan dengan cara menyisipkan gambar, tabel, dan persamaan matematis sebagai objek bernomor yang dapat dirujuk silang.
\
Selanjutnya, panduan ini menjelaskan mekanisme sitasi dan penyusunan daftar pustaka menggunakan berkas basis data bibliografi (`references.bib`) beserta gaya sitasi ITB (`itb.csl`), termasuk berbagai bentuk kutipan yang tersedia. Fitur khusus templat ini, seperti penomoran objek otomatis berbasis bab dan daftar singkatan/lambang berbasis glosarium, turut dijelaskan agar dapat dimanfaatkan secara optimal.
\
Bagian akhir panduan membahas topik lanjutan yang diperlukan dalam praktik penulisan tesis, meliputi cara menambah bab baru, menyusun lampiran, kesalahan umum yang sering dijumpai beserta cara mengatasinya, serta sumber belajar tambahan untuk memperdalam penguasaan Typst. Dengan mengikuti panduan ini secara berurutan, pembaca diharapkan mampu menyusun naskah tesis Magister ITB yang rapi, konsisten, dan sesuai pedoman format menggunakan Typst secara mandiri.

*Kata kunci*: Typst, tesis Magister ITB, panduan penulisan, sitasi, figure dan tabel.
