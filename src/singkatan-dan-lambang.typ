/**
 * Berkas pemanggil untuk mencetak Daftar Singkatan dan Lambang pada Frontmatter.
 * Isi daftarnya sendiri (listSingkatan, listLambang) didefinisikan di bawah ini.
 * key   -> pengenal unik, dipakai pada pemanggilan #gls("key") di naskah
 * short -> bentuk singkat yang ditampilkan
 * long  -> kepanjangan/nama yang ditampilkan pada Daftar Singkatan dan Lambang
 * Nomor "pemakaian pertama kali pada halaman" terisi otomatis begitu key
 * tersebut dirujuk dengan #gls("key") pada badan naskah.
 */
#import "../template.typ": generateDaftarSingkatanTable

#let listSingkatan = (
  (key: "PDF", short: "PDF", long: "Portable Document Format", group: "Singkatan"),
  (key: "CSL", short: "CSL", long: "Citation Style Language", group: "Singkatan"),
)

#let listLambang = (
  (key: "lambang-Fs", short: [$F_s$], long: "Faktor keamanan lereng (contoh lambang)", group: "Lambang"),
)

#generateDaftarSingkatanTable(listSingkatan, listLambang)
