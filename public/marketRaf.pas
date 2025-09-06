program SupermarketAdvanceAutoHarga;
uses crt;

var
   i, n : integer;
   nama : array[1..100] of string;
   harga, qty, total : array[1..100] of longint;
   grand_total, diskon, total_bayar, bayar, kembalian : longint;

function getHarga(nm: string): longint;
begin
   if (nm = 'Susu') or (nm = 'susu') then
      getHarga := 15000
   else if (nm = 'Roti') or (nm = 'roti') then
      getHarga := 10000
   else if (nm = 'Beras') or (nm = 'beras') then
      getHarga := 20000
   else if (nm = 'Minyak') or (nm = 'minyak') then
      getHarga := 25000
   else if (nm = 'Gula') or (nm = 'gula') then
      getHarga := 12000
   else if (nm = 'Kopi') or (nm = 'kopi') then
      getHarga := 18000
   else
      getHarga := 0;  { Barang tidak tersedia }
end;

begin
   clrscr;
   writeln('======================================');
   writeln('      PROGRAM SUPERMARKET ADVANCE     ');
   writeln('======================================');
   writeln('Daftar Barang yang Tersedia:');
   writeln('Susu=15000 | Roti=10000 | Beras=20000');
   writeln('Minyak=25000 | Gula=12000 | Kopi=18000');
   writeln('======================================');
   write('Masukkan jumlah jenis barang: '); readln(n);

   grand_total := 0;

   for i := 1 to n do
   begin
      writeln;
      writeln('Barang ke-', i);
      
      repeat
         write('Nama barang : '); readln(nama[i]);
         harga[i] := getHarga(nama[i]);
         if (harga[i] = 0) then
            writeln('Barang tidak tersedia, coba lagi!');
      until (harga[i] > 0);

      repeat
         write('Jumlah      : '); readln(qty[i]);
         if (qty[i] <= 0) then
            writeln('Jumlah harus lebih dari 0!');
      until (qty[i] > 0);

      total[i] := harga[i] * qty[i];
      grand_total := grand_total + total[i];
   end;

   { Hitung diskon otomatis }
   if (grand_total >= 200000) then
      diskon := grand_total * 20 div 100
   else if (grand_total >= 100000) then
      diskon := grand_total * 10 div 100
   else
      diskon := 0;

   total_bayar := grand_total - diskon;

   { Cetak struk belanja }
   writeln;
   writeln('======================================');
   writeln('             STRUK BELANJA             ');
   writeln('======================================');
   writeln('No  Nama Barang     Qty   Harga   Total');
   writeln('--------------------------------------');
   for i := 1 to n do
   begin
      writeln(i:2, '  ', nama[i]:12, '  ', qty[i]:3, 
              '  Rp', harga[i]:6, '  Rp', total[i]:7);
   end;
   writeln('--------------------------------------');
   writeln('Subtotal       : Rp', grand_total);
   writeln('Diskon         : Rp', diskon);
   writeln('Total Bayar    : Rp', total_bayar);

   { Input pembayaran }
   repeat
      write('Bayar          : Rp'); readln(bayar);
      if (bayar < total_bayar) then
         writeln('Uang tidak cukup! Masukkan lagi.');
   until (bayar >= total_bayar);

   kembalian := bayar - total_bayar;
   writeln('Kembalian      : Rp', kembalian);
   writeln('======================================');
   writeln('  Terima kasih sudah berbelanja! :)   ');
   writeln('======================================');
   readln;
end.
