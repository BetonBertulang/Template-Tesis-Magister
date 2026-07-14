# Panduan Penggunaan Typst untuk Tesis Magister ITB

Repositori ini adalah panduan (dan sekaligus contoh langsung / _working example_) penggunaan [Typst](https://typst.app) untuk menyusun tesis Magister Institut Teknologi Bandung (ITB), dikompilasi dari templat tesis Magister ITB berbasis Typst.

Naskah panduan lengkapnya ada pada BAB I -- BAB V (lihat `main.pdf` hasil kompilasi, atau baca langsung berkas `.typ` di folder `BAB 1/` -- `BAB 5/`). Topik yang dibahas:

- BAB I -- Pendahuluan: apa itu Typst, instalasi, struktur berkas templat.
- BAB II -- Penggunaan dasar Typst: heading, list, mode kode, aturan `set`/`show`, persamaan.
- BAB III -- Menambahkan figure, tabel, dan persamaan beserta penomoran otomatis.
- BAB IV -- Sitasi, daftar pustaka, dan glosarium singkatan/lambang.
- BAB V -- Menambah bab baru, menyusun lampiran, kesalahan umum, sumber belajar tambahan.

## Persyaratan

- [Typst](https://typst.app) versi 0.11.0 atau lebih baru

## Cara Mengompilasi

```
typst compile main.typ
```

## Menggunakan Repositori Ini sebagai Templat Tesis

Karena repositori ini merupakan fork dari templat tesis Magister ITB, Anda juga dapat menjadikannya titik awal penulisan tesis Anda sendiri:

1. Sesuaikan informasi tesis di `src/metadata.typ` (judul, nama, NIM, program studi, tanggal).
2. Sesuaikan nama pembimbing pada `src/lembarPengesahan.typ` dan format sitasi pada `src/pedoman.typ`.
3. Ganti isi `BAB 1/bab1.typ` -- `BAB 5/bab5.typ` dengan draf tesis Anda yang sebenarnya.
4. Simpan gambar tiap bab di dalam folder `Figure/` masing-masing bab.

## Struktur File

| File / Folder                  | Keterangan                                              |
|---------------------------------|---------------------------------------------------------|
| `main.typ`                      | File utama yang menggabungkan seluruh bagian dokumen    |
| `template.typ`                  | Definisi fungsi template dan format halaman             |
| `src/metadata.typ`              | Metadata tesis (judul, nama penulis, NIM, dll.)         |
| `src/abstrak.typ`, `src/abstract.typ` | Abstrak Bahasa Indonesia dan Inggris               |
| `src/lembarPengesahan.typ`      | Lembar pengesahan                                       |
| `src/pedoman.typ`               | Pedoman penggunaan tesis                                |
| `src/daftarIsi.typ`, `src/daftarGambar.typ`, `src/daftarTabel.typ`, `src/daftarLampiran.typ` | Daftar isi/gambar/tabel/lampiran otomatis |
| `src/singkatan-dan-lambang.typ` | Daftar singkatan dan lambang berbasis glosarium         |
| `BAB 1/` -- `BAB 5/`             | Folder tiap bab, masing-masing dengan `Figure/` sendiri |
| `Lampiran/`                     | Berkas dan gambar untuk bagian lampiran                 |
| `references.bib`, `itb.csl`     | Basis data pustaka dan gaya sitasi ITB                  |

## Menambah Bab Baru

Buat folder dan berkas baru, misalnya `BAB 6/bab6.typ`, kemudian tambahkan baris berikut di `main.typ`:

```typst
#include "BAB 6/bab6.typ"
```

## Kontributor

- [BetonBertulang](https://github.com/BetonBertulang)
