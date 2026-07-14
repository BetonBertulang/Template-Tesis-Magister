/*
  File: daftarIsi.typ
  Description: Generates the Table of Contents dynamically. It targets all heading levels
               up to depth 3 and applies indentation for hierarchical clarity.
*/

// Menampilkan judul daftar isi dengan format heading level 1
= DAFTAR ISI

// Fungsi bawaan outline untuk mengekstraksi struktur dokumen
#outline(
  title: none, // Title diset 'none' karena sudah direpresentasikan oleh heading di atas
  depth: 3,
)
