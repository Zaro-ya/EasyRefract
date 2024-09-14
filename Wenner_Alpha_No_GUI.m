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
    
    % 5. Pemodelan Eksponensial
    % Model 1: y = 55.2837 * exp(-0.001 * x)
    % Model 2: y = 319.97012767 * exp(-0.00002574 * x)
    % Model 3: y = 336.89782709 * exp(-0.00003101 * x)
    
    % Buat vektor x sebagai domain (misalnya dari 0 hingga 5000)
    x = linspace(0, 5000, 500);
    
    % Hitung nilai y berdasarkan model
    y_model1 = 55.2837 * exp(-0.001 * x);
    y_model2 = 319.97012767 * exp(-0.00002574 * x);
    y_model3 = 336.89782709 * exp(-0.00003101 * x);
    
    % 6. Plot Hasil Pemodelan
    figure;
    plot(x, y_model1, '-r', 'LineWidth', 2); hold on;
    plot(x, y_model2, '-b', 'LineWidth', 2); hold on;
    plot(x, y_model3, '-g', 'LineWidth', 2); hold on;
    xlabel('x');
    ylabel('y');
    title('Pemodelan Eksponensial');
    legend({'Model 1: y = 55.2837 * exp(-0.001 * x)', ...
            'Model 2: y = 319.97012767 * exp(-0.00002574 * x)', ...
            'Model 3: y = 336.89782709 * exp(-0.00003101 * x)'});
    grid on;
    
    % 7. Simpan Hasil Pemodelan ke File (Opsional)
    saveas(gcf, 'Pemodelan_Eksponensial.png');
    disp('Hasil pemodelan disimpan sebagai Pemodelan_Eksponensial.png');
end