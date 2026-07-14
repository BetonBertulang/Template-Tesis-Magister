/*
  Function: thesisTemplate
  Description: Initializes the document with the ITB Master's thesis formatting guidelines.
               This sets up the mirror margins, base typography, paragraph spacing, and
               generates the standard cover page.
  Parameters:
    - thesisTitle (string): The title of the thesis in Indonesian.
    - englishTitle (string): The title of the thesis in English.
    - studentName (string): The full name of the author.
    - studentId (string): The Student Identification Number (NIM).
    - studyProgram (string): The master's study program (e.g., Magister Teknik Sipil).
    - submissionDate (string): The month and year of submission.
    - bodyContent (content): The entire body of the document to be formatted.
  Returns:
    - Content: The fully formatted Typst document including the cover page and frontmatter.
*/
#import "@preview/numbly:0.1.0": numbly

#let thesisTemplate(
  thesisTitle: "",
  englishTitle: "",
  studentName: "",
  studentId: "",
  studyProgram: "",
  submissionDate: "",
  bodyContent,
  appendixPage: none,
) = {
  // 1. Pengaturan Halaman (Page Setup)
  // Menerapkan mirror margins untuk pencetakan dua sisi (bolak-balik).
  set page(
    paper: "a4",
    margin: (left: 4cm, right: 3cm, top: 3cm, bottom: 3cm),
    numbering: "i",
    number-align: center,
  )
  show title: set text(14pt)
  show title: set par(leading: 12pt)
  // show title: set (12pt)

  // 2. Pengaturan Teks (Text Setup)
  // Menggunakan Times New Roman ukuran 12pt sebagai standar naskah.
  set text(font: "Times New Roman", size: 12pt, lang: "id")

  // 3. Pengaturan Paragraf (Paragraph Setup)
  // Paragraf tidak menjorok ke dalam (tanpa indentasi) dan dipisahkan oleh satu baris kosong (1.5 spasi).
  set par(justify: true, leading: 1.3em)
  // show par: set block(spacing: 1.3em)

  // 4. Pengaturan Judul (Heading Setup)
  // Judul Bab (Level 1): Ukuran 14pt, cetak tebal, simetris di tengah.
  show heading.where(level: 1): chapterHeading => {
    pagebreak(weak: true)
    set text(size: 14pt, weight: "bold")
    set align(center)
    v(1em)
    chapterHeading
    v(1.5em)
  }
  // 5. Pembuatan Halaman Sampul (Cover Page Generation)
  set page(numbering: none)
  align(center)[
    #title(thesisTitle) \
    \ \
    #text(size: 14pt, weight: "bold")[TESIS] \
    \
    #text(weight: "bold", top-edge: "baseline")[
      Karya tulis sebagai salah satu syarat\
      untuk memperoleh gelar Magister dari\
      Institut Teknologi Bandung
    ]

    \ \
    Oleh \
    #text(size: 14pt, weight: "bold", upper(studentName)) \
    #text(size: 14pt, weight: "bold", top-edge: "baseline")[NIM: #studentId]\
    #text(size: 14pt, weight: "bold", top-edge: "baseline")[Program Studi Magister Teknik Sipil]\
    \
    // Placeholder untuk Logo ITB (Ganesha)
    #image(width: 2.35cm, height: 3.5cm, "Figure/Logo-itb.jpg")\ \ \ \

    #text(size: 14pt, weight: "bold")[INSTITUT TEKNOLOGI BANDUNG] \
    #text(size: 14pt, weight: "bold")[#submissionDate]
  ]

  pagebreak()
  set page(numbering: "i", number-align: center)
  counter(page).update(1)

  bodyContent

  if appendixPage != none {
    pagebreak()
    appendixPage
  }
}



/*
  Function: setupMainBody
  Description: Resets the page numbering system from Roman numerals (used in frontmatter)
               to Arabic numerals (used in the main chapters) starting at page 1.
  Parameters:
    - bodyContent (content): The structural content of the main thesis chapters.
  Returns:
    - Content: The document section equipped with Arabic page numbering.
*/
#let setupMainBody(bodyContent) = {
  // Pengaturan Penomoran Halaman ke Angka Arab
  set page(numbering: "1")
  counter(page).update(1)

  set par(spacing: 2.0em)

  // Pengaturan Penomoran Heading (Menggunakan Angka Arab: 1, 1.1, 1.1.1)
  set heading(numbering: "I.1.1")

  // Pengaturan Keterangan (Caption) Tabel dan Gambar
  show figure.where(kind: table): set figure.caption(position: top)
  show figure.where(kind: image): set figure.caption(position: bottom)
  show figure.caption: set text(size: 12pt)
  show figure.where(kind: table): set block(breakable: true)

  // set figure(kind: image, supplement: "Gambar")
  // set figure(kind: table, supplement: "Tabel")
  //
  // Pengaturan format tabel
  set table(
    stroke: (x, y) => if y == 0 {
      (bottom: 0.7pt + black)
    },
    align: (x, y) => (
      if x > 0 { center } else { left }
    ),
  )
  // Format penomoran objek (Bab.NomorObjek) menggunakan angka Arab
  set figure(numbering: figureNumber => {
    let chapterNumber = counter(heading).get().first()
    numbering("I.1", chapterNumber, figureNumber)
  })
  set figure.caption(separator: [ ])

  // Format penomoran Persamaan (Equation)
  set math.equation(
    numbering: (..nums) => {
      let chapterNumber = counter(heading).get().first()
      numbering("(I.1)", chapterNumber, nums.pos().first())
    },
    block: true,
  )
  //
  // Kustomisasi Heading Level 1 (Bab)
  show heading.where(level: 1): chapterHeading => {
    pagebreak(weak: true)
    let isAppendix = chapterHeading.supplement == [Lampiran]
    set text(size: 14pt, weight: "bold")
    // Judul BAB rata tengah, judul Lampiran rata kiri.
    set align(if isAppendix { left } else { center })
    v(1em)

    // Mengevaluasi apakah heading saat ini diatur untuk memiliki nomor
    if chapterHeading.numbering != none {
      // Mereset penghitung objek hanya saat memasuki bab bernomor baru
      counter(figure.where(kind: image)).update(0)
      counter(figure.where(kind: table)).update(0)
      counter(math.equation).update(0)

      // Mengambil dan merender nomor bab/lampiran
      let currentChapterNumber = counter(heading).display(chapterHeading.numbering)
      if isAppendix {
        [Lampiran #currentChapterNumber #chapterHeading.body]
      } else {
        [BAB #currentChapterNumber #chapterHeading.body]
      }
    } else {
      // Jika numbering adalah 'none' (misal: Daftar Pustaka), cetak teks apa adanya
      chapterHeading.body
    }

    v(1.5em)
  }

  // Kustomisasi Heading Level 2 (Anak Bab)
  show heading.where(level: 2): subHeading => {
    set text(size: 12pt, weight: "bold")
    v(0.5em)
    subHeading
    v(0.5em)
  }

  // Kustomisasi Heading Level 2 (Anak Bab)
  show heading.where(level: 3): subHeading => {
    set text(size: 12pt, weight: "regular")
    // v(0.5em)
    subHeading
    v(0.5em)
  }

  bodyContent
}


#import "@preview/glossarium:0.5.10": get-entry-back-references

/**
 * Mengambil nomor halaman kemunculan pertama sebuah entri glosarium
 * (dirujuk melalui #gls(key) pada badan naskah). Mengembalikan tanda hubung
 * apabila entri tersebut belum pernah dirujuk.
 */
#let firstUsePage(entry) = context {
  let refs = get-entry-back-references(entry, deduplicate: true)
  if refs.len() > 0 {
    refs.first()
  } else {
    [--]
  }
}

/**
 * Membuat satu tabel Singkatan/Lambang (3 kolom: simbol, nama, halaman
 * pemakaian pertama). Setiap simbol diberi label agar #gls(key) yang
 * dirujuk pada badan naskah dapat ditautkan balik ke baris ini.
 */
#let singkatanLambangTable(title, entries) = table(
  columns: (auto, 1fr, auto),
  stroke: none,
  align: (left, left, center),
  table.hline(stroke: 0.7pt),
  table.header(
    [*#title*], [*Nama*], [*Pemakaian pertama kali \ pada halaman*],
    table.hline(stroke: 0.7pt),
  ),
  ..entries.map(entry => (
    [#entry.short#label(entry.key)], entry.long, firstUsePage(entry),
  )).flatten(),
  table.hline(stroke: 0.7pt),
)

/**
 * Menghasilkan halaman Daftar Singkatan dan Lambang sebagai dua tabel
 * terpisah (Singkatan, Lambang). Nomor halaman pemakaian pertama terisi
 * otomatis begitu istilah dirujuk dengan #gls("key") pada badan naskah.
 */
#let generateDaftarSingkatanTable(listSingkatan, listLambang) = {
  heading(level: 1, numbering: none)[DAFTAR SINGKATAN DAN LAMBANG]

  singkatanLambangTable("Singkatan", listSingkatan)
  v(1.5em)
  singkatanLambangTable("Lambang", listLambang)
}

/**
 * Menghasilkan Daftar Lampiran secara otomatis berdasarkan indeks heading.
 * Fungsi ini memfilter heading yang memiliki supplement "Lampiran".
 */
#let generateDaftarLampiran() = {
  heading(level: 1, numbering: none)[DAFTAR LAMPIRAN]
  outline(
    title: none,
    target: heading.where(level: 1, supplement: [Lampiran]),
  )
}

/**
 * Membungkus konten lampiran (Lampiran.typ) agar heading level 1/2 yang ditulis
 * langsung (misal: "= Judul Lampiran") otomatis diberi penomoran alfabetis
 * (A, A.1, B, B.1, dst.) dan dikenali sebagai "Lampiran" oleh Daftar Lampiran,
 * persis seperti cara BAB 1-4 ditulis pada tubuh utama.
 * @param bodyContent Seluruh isi berkas Lampiran.typ (heading + konten lampiran).
 */
#let setupAppendixBody(bodyContent) = {
  set heading(numbering: "A.1", supplement: [Lampiran])
  // Penghitung heading direset agar penomoran lampiran dimulai dari A,
  // terlepas dari berapa banyak BAB yang mendahuluinya.
  counter(heading).update(0)
  set figure(numbering: figureNumber => {
    let chapterNumber = counter(heading).get().first()
    numbering("A.1", chapterNumber, figureNumber)
  })
  set figure.caption(separator: [ ])
  show figure.where(kind: table): set block(breakable: true)
  bodyContent
}
