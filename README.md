# Gnome Chemistry Utils — modernized fork

A fork of **Gnome Chemistry Utils 0.15.1** by Jean Bréfort
(<https://savannah.nongnu.org/projects/gchemutils/>) that builds against
current libraries and ships a **Georgian (ქართული, `ka`) translation**.

Included programs: GChemPaint (2D structure editor), GChem3D (molecule viewer),
GCrystal (crystal structures), GChemCalc (formula calculator), GChemTable
(periodic table), GSpectrum (spectrum viewer).

The upstream project has not been maintained for years; this fork only makes it
build and run on a modern system. It is not affiliated with upstream.

## What changed from 0.15.1

* Builds with a modern C++ compiler (GCC 14, C++17): removed the dynamic
  exception specifications (`throw(...)`) that C++17 forbids, plus a few strict
  type errors (`const char*`, ambiguous `abs`, a wrong variable in an error path).
* **OpenBabel 3** (`openbabel-3`) instead of `openbabel-2.0`.
* **lasem 0.6** is found and linked correctly (`lasem_CFLAGS`/`lasem_LIBS`).
* Dropped `gnome-doc-utils` and `gnome-common` macros (both obsolete); the
  `docs/help` Mallard/DocBook sources are no longer built, man pages still are.
* Dropped the dead Mozilla/NPAPI browser plugin.
* `make install DESTDIR=...` now works (MIME/desktop database updates are
  skipped for staged installs).
* **Georgian translation** (`po/ka.po`): 1224 of 1299 strings; the remainder are
  untranslatable (symbols, numbers, program names).

GTK is still 3.x; no GTK4 port was attempted.

## Building

Tested on Debian 13 (trixie), aarch64. Dependencies: GTK 3, libxml2, libgsf,
goffice 0.10, **lasem 0.6** (not packaged in Debian; build from
<https://download.gnome.org/sources/lasem/0.5/>), OpenBabel 3, bodr,
chemical-mime-data, cairo, GLU/GL, intltool, autotools, libtool.

    ./autogen.sh
    ./configure
    make -j"$(nproc)"
    sudo make install

`docker/Dockerfile` reproduces a working build environment:

    docker build -t gchem-build -f docker/Dockerfile .
    docker run --rm -v "$PWD":/src -w /src gchem-build \
        sh -c './autogen.sh && ./configure && make -j8'

Run with the Georgian UI: `LANGUAGE=ka gchemtable-0.16`
(requires a `ka_GE.UTF-8` locale and a font with Georgian glyphs).

## Status / known limitations

* Everything compiles and links; GChemTable and GChemPaint start and show the
  Georgian UI under Xvfb. Beyond that there has been **no functional testing**
  (editing, file loading, 3D view, printing). The `make check` tests were not run.
* The Gnumeric plugin is built only if `libspreadsheet` is found; it was not
  available in the test environment and is untested.
* Translation was written without review by other native speakers; corrections
  to `po/ka.po` are welcome.

## License

GPL-3.0-or-later, as upstream (see `COPYING`; documentation under `COPYING-DOCS`).
Copyright © 2001–2012 Jean Bréfort and contributors.
