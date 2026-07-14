/*
  File: abstrak.typ
  Description: Contains the Indonesian abstract of the thesis.
               The first line is styled as a level 1 heading without numbering.
*/
#import "metadata.typ": *

#set par(justify: true)
#set text(style: "italic")


= ABSTRACT

#align(center)[

  #title(englishTitle)\
  #set text(style: "normal")
  By\
  #text(size: 14pt, weight: "bold", top-edge: "baseline")[
    #studentName\
    NIM: #studentId\
    (Master's Program in Civil Engineering)
  ]
]\
#set text(style: "italic")
Typst is a next-generation document typesetting system designed as an alternative to LaTeX, offering more concise syntax, more understandable error messages, and substantially faster compilation times. As the need grows among Institut Teknologi Bandung (ITB) Master's students to prepare theses that comply with the applicable formatting guidelines, while prior experience with markup-based typesetting tools remains limited, a practical guide is needed to walk students through the process of writing a thesis in Typst from start to finish.
\
This guide is written using the same Typst-based ITB Master's thesis template as its own writing medium, so that the document itself serves as a working example of every feature it explains. The material is organized progressively, starting with an introduction to Typst's basic syntax -- covering headings, text emphasis, lists, code mode, and the `set` and `show` rules -- followed by how to insert images, tables, and mathematical equations as numbered, cross-referenceable objects.
\
Next, this guide explains the citation mechanism and bibliography management using a bibliography database file (`references.bib`) together with the ITB citation style (`itb.csl`), including the various citation forms available. Template-specific features, such as automatic per-chapter object numbering and the glossary-based list of abbreviations and symbols, are also covered so they can be used effectively.
\
The final part of the guide addresses advanced topics needed in practice, including how to add new chapters, structure appendices, common pitfalls and how to resolve them, and additional learning resources for deepening one's mastery of Typst. By following this guide sequentially, readers are expected to be able to independently produce a well-organized, consistent ITB Master's thesis manuscript in Typst that conforms to the required formatting guidelines.

*Keywords*: Typst, ITB Master's thesis, writing guide, citations, figures and tables.


