function Wenner_Alpha_Model_SubSurface()
    % Fungsi utama untuk menjalankan perhitungan dan pemodelan bawah permukaan
    
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
    
    % Resistivity apparent
    rho_apparent = R .* K;
    
    % 4. Pemodelan Bawah Permukaan
    % Dalam contoh ini, kita asumsikan bahwa kedalaman (depth) adalah fungsi dari n dan spasi.
    depth = n .* sp;  % Asumsi sederhana
    
    % Membuat matriks untuk pemodelan 2D
    [X, Z] = meshgrid(n, depth);
    
    % Pemodelan sederhana resistivitas
    rho_matrix = repmat(rho_apparent, 1, length(n)); % Matriks resistivitas
    
    % 5. Plot Pemodelan Bawah Permukaan
    figure;
    imagesc(n, depth, rho_matrix);
    colorbar;
    set(gca, 'YDir', 'reverse'); % Kedalaman biasanya meningkat ke bawah
    xlabel('Posisi Elektroda (n)');
    ylabel('Kedalaman (m)');
    title('Model Bawah Permukaan Berdasarkan Resistivitas');
    
    % Menyimpan hasil pemodelan bawah permukaan ke file (Opsional)
    saveas(gcf, 'Subsurface_Model.png');
    disp('Model bawah permukaan disimpan sebagai Subsurface_Model.png');
end