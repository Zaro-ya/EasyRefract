function Wenner_Alpha_No_GUI()
    % Fungsi utama untuk menjalankan perhitungan Wenner Alpha tanpa GUI
    
    % 1. Input Data
    global n C1 C2 P1 P2 A V sp
    [filename, patchname] = uigetfile({'.txt'; '.data'}, 'Input data');
    if isequal(filename, 0)
        disp('User selected Cancel');
        return;
    else
        data = strcat(patchname, filename);
        disp(['User selected ', data]);
    end
    
    % Membaca data dari file
    read = fileread(data);
    in = str2num(read);
    
    % Menginisialisasi variabel dari input
    n = in(:, 1);
    C1 = in(:, 2);
    C2 = in(:, 3);
    P1 = in(:, 4);
    P2 = in(:, 5);
    A = in(:, 6);
    V = in(:, 7);
    
    % 2. Input Spasi (Jarak antar elektroda)
    spasi_str = input('Masukkan nilai spasi (misal 5): ', 's');
    s = str2double(spasi_str);
    
    % 3. Melakukan Perhitungan
    I = length(n);
    sp = s * ones(I, 1);
    
    % Resistivity (R)
    R = V ./ A;
    
    % Geometrical factor (K)
    K = pi * n .* sp .* (n + 1) .* (n + 2);
    
    % D (misalignment factor)
    D = (P1 - C1) / 2 + C1;
    
    % 4. Menampilkan hasil dalam bentuk tabel
    hasil = [n, C1, C2, P1, P2, A, V, sp, R, K, D];
    
    % Menampilkan hasil ke dalam console
    disp('Hasil Perhitungan:');
    disp('n  C1  C2  P1  P2  A  V  sp  R  K  D');
    disp(hasil);
end