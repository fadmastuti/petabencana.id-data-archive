Arsip Data PetaBencana.id
=========================

Ekstrak dari database Cognicity https://petabencana.id .

## Data
### 1 Floods
Area poligon banjir, merepresentasikan wilayah RW yang ditandain tergenang oleh BPBD DKI Jakarta menggunakan Risk Evaluation Matrix dari PetaBencana.id.

Data laporan ini tersimpan dalam format GeoJSON. Masing-masing karakter GeoJSON merepresentasikan area tergenang.

**Atribut Laporan**

|Nama Atribut |Deskripsi |Tipe |
|--------------|-----------|----|
|geom_id|Mengidentifikasi kode unik wilayah (RW, lihat di bawah)|Integer|
|changed|Waktu ketika area tersebut ditandai sebagai area genangan|String|
|state|Level genangan banjir (lihat di bawah)|Integer|

**Besaran Atribut**

|Kelas|Klasifikasi|Deskripsi|
|-----|--------|-----------|
|1|Tidak Diketahui|Level banjir tidak diketahui - hati-hati|
|2|Kecil|Kebanjiran 10-70 cm|
|3|Sedang|Kebanjiran 71-150 cm|
|4|Besar|Kebanjiran lebih dari 150 cm|

**Waktu**
Seluruh informasi waktu yang tertera telah disesuaikan dalam GMT+7 untuk Wilayah Indonesia Barat.

**Sistem Referensi Koordinat**
Data ini mengikuti spesifikasi GeoJSON dan koordinat dalam sistem koordinat geografis WGS84.

**Geometry ID**
Kode unik wilayah untuk RW yang dibuat oleh Humanitarian Open Street Map Team.

### 2 Reports
Laporan genangan pada PetaBencana.id di area Jabodetabek, Indonesia pada Februari 2017.

Laporan genangan dibuat oleh warga Jabodetabek (Jakarta, Bogor, Depok, Tangerang, Bekasi) menggunakan platform PetaBencana.id aplikasi lokal lainnya.

Laporan ini tersimpan dalam format GeoJSON. Masing-masing karakter GeoJSON merepresentasikan masing-masing laporan.

**Atribut Laporan**

|Nama Atribut |Deskripsi |Tipe |
|--------------|-----------|----|
|created_at|Waktu ketika laporan tersebut dibuat sesuai dengan yang tertera pada alat (handphone) pengguna |String|
|source|Sumber asli dari laporan (lihat di bawah) |String|
|image_url|Link untuk foto/gambar, bila ada |String|
|title|Judul dari laporan, bila ada |String|
|report_data|Ketinggian genangan, bila ada |JSON|
|tags|Wilayah kejadian dan RW yang terdapat laporan, bila ada |JSON|
|text|Deskripsi laporan |String|

**Sumber Atribut**
Sumber dari laporan yang diterima bisa diperoleh dari 'qlue' (http://qlue.co.id/site/), 'detik' (https://pasangmata.detik.com/), 'grasp' (petabencana.id chatbot).

**Waktu**
Seluruh informasi waktu yang tertera telah disesuaikan dalam GMT+7 untuk Wilayah Indonesia Barat.

**Sistem referensi Koordinat**
Data ini mengikuti spesifikasi GeoJSON dan koordinat dalam sistem koordinat geografis WGS84.

## Metadata
Metadata menyimpan dalam standar ISO 19115-2 yang telah dibuat menggunakan https://data.gulfresearchinitiative.org/metadata-editor/. Representasi XML dari data dapat diperoleh dalam folder floods/ dan reports/ yang saling terhubung.

## Scripts
#### $ export-reports.sh

Mengeksport laporan dalam database PetaBencana.id diantara waktu mulai dan akhir ditulis sesuai informasi waktu ISO 8601 menggunakan GMT+7. Contoh:

```sh
$ bash scripts/export-reports.sh 2017-02-21T00:00+0700 2017-02-21T23:59+0700 > 2017/floods/reports/petabencana.id_jbd_reports_2017-02-21.geojson
```

build-reports-data-february-2017.sh merupakan bungkusan dari script ini untuk spesifik kejadian banjir.

#### $ export-floods.sh

Mengeksport banjir dalam database PetaBencana.id dalam kurun waktu tertentu ditulis sesuai informasi waktu ISO 8601 menggunakan GMT+7. Contoh:

```sh
$ bash scripts/export-floods.sh 2017-02-21T00:00+0700
```

build-floods-data-february-2017.sh merupakan bungkusan dari script ini untuk spesifik kejadian banjir.
