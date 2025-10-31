# nexnews - news app

ini project flutter buat nampilin berita terbaru dari newsapi.org. tampilannya simple, bisa pilih kategori,ada loading, error, empty state, dan search.  

## widget & fungsinya  

### bottom_navbar.dart  
widget ini buat navbar di bawah aplikasi, bisa navigasi ke home, trending, sama profile. kalo tab aktif ada animasi sama warna beda biar keliatan kalo lagi di page itu.  

### category_chip.dart  
widget ini buat tombol kategori, tiap kategori ada gambar kecil di kiri sama teks. pas dipilih bakal ada animasi dan warnanya berubah. pakai cached_network_image biar gambar lebih efision.  

### category_section.dart  
widget ini nge-handle daftar kategori horizontal. tiap chip bakal connect ke controller buat nge-update kategori yang lagi dipilih. basically ini container buat scroll kategori.  

### discover_header.dart  
widget ini header paling atas halaman utama. ada judul “discover the news with nexnews!”, search bar buat nyari berita.  

### empty_state.dart  
widget ini muncul kalo gak ada berita sama sekali. ada animasi lottie biar gak kosong gitu.

### error_state.dart  
widget ini muncul kalo koneksi error atau gagal load data. ada animasi lottie dan teks saran cek koneksi.  

### loading_shimmer.dart  
widget ini buat efek shimmer loading pas data berita belum muncul. ada animasi gradient jalan terus..  

### news_card.dart  
widget ini buat nampilin satu berita. ada gambar, source, title, deskripsi, sama waktu. bisa di-tap buat buka detail berita, dan ada fallback gambar kalo url kosong.  

### news_list_section.dart  
widget ini nge-handle list berita secara vertical. reactive pake getx (obx), tris otomatis nampilin loading shimmer, empty state, atau error state sesuai kondisi. support refresh swipe juga.  

### search_bar_widget.dart  
widget ini search bar simple. ada icon search di kiri, underline border berubah pas fokus.