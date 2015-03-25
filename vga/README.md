Interfața VGA
Funcționarea interfeței VGA este explicată în detaliu în manualul plăcii Nexys 2, paginile 10-12, cu
exemplificare pentru rezoluția 640x480. În acest proiect se va realiza un modul de sincronizare VGA ce
va implementa o rezoluție de 800x600 pixeli, la rata de refresh de 72 Hz.

+-------------------------------------------------------------------------+
|                        VGA Syncro Generator                             |
|>CLKt                                                        PX_index_x  |
| RST                                                         PX_index_y  |
|                                                             Disp_active |
|                                                                         |
|                                                             HSYNC       |
|                                                             VSYNC       |
|                                                                         |
+-------------------------------------------------------------------------+

• Modulul de numărătoare generează două valori, HCOUNT și VCOUNT
• HCOUNT se incrementează la fiecare perioadă de ceas, resetându-se la valoarea maximă
• VCOUNT se incrementează de fiecare dată când HCOUNT a ajuns la valoarea maximă
• valorile maxime pentru HCOUNT/VCOUNT sunt date de specificația VESA pentru
rezoluția VGA implementată
• Modulul generator de HSYNC/VSYNC procesează valorile HCOUNT/VCOUNT și
produce semnalele de sincronizae, cu polaritățile și formele de undă indicate de specificația
VESA
