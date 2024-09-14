function varargout = G_Run(varargin)
% G_RUN MATLAB code for G_Run.fig
%      G_RUN, by itself, creates a new G_RUN or raises the existing
%      singleton*.
%
%      H = G_RUN returns the handle to a new G_RUN or the handle to
%      the existing singleton*.
%
%      G_RUN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in G_RUN.M with the given input arguments.
%
%      G_RUN('Property','Value',...) creates a new G_RUN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before G_Run_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to G_Run_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help G_Run

% Last Modified by GUIDE v2.5 26-Nov-2023 23:21:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @G_Run_OpeningFcn, ...
                   'gui_OutputFcn',  @G_Run_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before G_Run is made visible.
function G_Run_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = G_Run_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

% INPUT DATA RESIST--------------------------------------------------------
function Input_pushbutton_Callback(hObject, eventdata, handles)
global n C1 C2 P1 P2 A V
% Mengambil data
[filename,patchname]=uigetfile({'.txt';'.data'},'inputdata');
data=strcat(patchname,filename);
read = fileread(data)
in= str2num (read);
% Menampilkan data dalam tabel
set(handles.Table_Dipole_Dipole,'data',in)
% Menjadikan kolom sebagai variabel data baru
n=in(:,1);
C1=in(:,2);
C2=in(:,3);
P1=in(:,4);
P2=in(:,5);
A=in(:,6);
V=in(:,7);

% TABEL DIPOLE-------------------------------------------------------------
function Table_Dipole_Dipole_CellEditCallback(hObject, eventdata, handles)

% INPUT SPASI--------------------------------------------------------------
function spasi_Callback(hObject, eventdata, handles)
function spasi_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% INPUT JUMLAH TITIK-------------------------------------------------------
function Jumlah_Titik_Callback(hObject, eventdata, handles)
global T
% Mengambil nilai dari edit box
T = num2str(get(handles.Jumlah_Titik,'String'));
function Jumlah_Titik_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% INPUT NAMA DATA----------------------------------------------------------
function kode_konfigurasi_Callback(hObject, eventdata, handles)
function kode_konfigurasi_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% INPUT NAMA DATA----------------------------------------------------------
function Nama_Callback(hObject, eventdata, handles)
function Nama_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% MENGHITUNG DATA RESISTIVITAS---------------------------------------------
function Hitung_pushbutton_Callback(hObject, eventdata, handles)
global n C1 C2 P1 P2 A V sp D R K rho
s = str2num(get(handles.spasi,'String'));
I = length (n);

% Menghitung Nilai Spasi
sp = zeros(I,1);
for i=1:I
    for j=1:1
        sp(i,j)= s;
    end
end

% Menghitung nilai Resistansi
R = zeros(I,1);
for i=1:I
    for j=1:1
        R(i,j)= V(i,j)/A(i,j);
    end
end

% Menghitung Faktor Geometri
K=zeros(I,1);
for i=1:I
    for j=1:1
        K(i,j)= 3.14*n(i,j)*sp(i,j)*(n(i,j)+1)*(n(i,j)+2);
    end
end

% Menghitung Datum
D=zeros(I,1);
for i=1:I
    for j=1:1
        D(i,j)= ((P1(i,j)-C2(i,j))/ 2)+C2(i,j);
    end
end

% Menghitung Rho
rho = zeros(I,1);
for i=1:I
    for j=1:1
        rho(i,j)=R(i,j)*K(i,j);
    end
end
% Menjadikan hasil menjadi 1 Array
hasil=[n C1 C2 P1 P2 A V sp R rho K D];
set(handles.Table_Dipole_Dipole,'data',hasil)

% INPUT DATA LOKASI--------------------------------------------------------
function Input_Lokasi_Callback(hObject, eventdata, handles)
global Meter Z_1
[filename,patchname]=uigetfile({'.txt';'.data'},'inputdata');
data=strcat(patchname,filename);
read = fileread(data);
lok= str2num (read);
set(handles.uitable4,'data',lok)
Meter=lok(:,1);
Z_1=lok(:,2);

% INPUT KOORDINAT X--------------------------------------------------------
function Koordinat_X_Callback(hObject, eventdata, handles)
function Koordinat_X_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% INPUT KOORDINAT Y--------------------------------------------------------
function Koordinat_Y_Callback(hObject, eventdata, handles)
function Koordinat_Y_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% INPUT AZIMUTH------------------------------------------------------------
function Azimuth_Callback(hObject, eventdata, handles)
function Azimuth_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% INPUT SPASI KOORDINAT----------------------------------------------------
function Spasi_Coor_Callback(hObject, eventdata, handles)
function Spasi_Coor_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% INPUT SPASI JUMLAH TITIK-------------------------------------------------
function jumlah_titik_coor_Callback(hObject, eventdata, handles)
function jumlah_titik_coor_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% HITUNG KOORDINAT---------------------------------------------------------
function Hitung_Koordinat_Callback(hObject, eventdata, handles)
global x y t2
% Mengambil Data dari edit box
X = str2num(get(handles.Koordinat_X,'String'));
Y = str2num(get(handles.Koordinat_Y,'String'));
A = str2num(get(handles.Azimuth,'String'));
T = str2num(get(handles.jumlah_titik_coor,'String'));
s = str2num(get(handles.Spasi_Coor,'String'));

% Menghitung Banyak Data
t=(10:s:(T*s)-s);
t2=t';

% Menghitung Koordinat X
x=zeros((T-1),1);
for i=1:(T-1)
    for j=1:1
        x(i,j)= X+sin(A)*t2(i,j);
    end
end

% Menghitung Koordinat Y
y=zeros((T-1),1);
for i=1:(T-1)
    for j=1:1
        y(i,j)= Y+cos(A)*t2(i,j);
    end
end

% Menampilkan data dalam 1 Array
Lokasi_1=[0 X Y];
Lokasi_2=[t2 x y];
Lokasi_3=[Lokasi_1; Lokasi_2];

% Menampilkan data dalam tabel
set(handles.Koordinat_Table,'data',Lokasi_3)

% TABEL KOORDINAT----------------------------------------------------------
function Koordinat_Table_CellEditCallback(hObject, eventdata, handles)

% TABEL KALKULASI KOORDINAT------------------------------------------------
function uitable4_CellEditCallback(hObject, eventdata, handles)

% MENAMPILKAN GRAFIK V-----------------------------------------------------
function show_curve_A_Callback(hObject, eventdata, handles)
global n A V
axes(handles.axes1);
x=(1:1:length(n));
y=A'
z=V'

plot(x,z,'-r',x,z,'sk','linewidth',3)
title('Grafik Arus')
xlabel('Data')
ylabel('Arus(I)')

% MENAMPILKAN GRAFIK A-----------------------------------------------------
function Show_Curve_V_Callback(hObject, eventdata, handles)
global n A V
axes(handles.axes1);
x=(1:1:length(n));
y=A'
z=V'

plot(x,y,'r-',x,y,'sk','linewidth',3)
title('Grafik Beda Potensial')
xlabel('Data')
ylabel('Beda Potensial(V)')

% MENAMPILKAN DATUM DATA---------------------------------------------------
function pushbutton10_Callback(hObject, eventdata, handles)
global D n
axes(handles.axes1)
dt=D';
n_1=n';

plot(dt,n_1,'sk','linewidth',5)
set(handles.axes1,'ydir','reverse')
title('Datum Point')
xlabel('Datum')
ylabel('n')
ylim([min(n-5) max(n+5)]);


% --------------------------------------------------------------------
function blue_background_Callback(hObject, eventdata, handles)
% --------------------------------------------------------------------
function Context_Menu_Callback(hObject, eventdata, handles)
% --------------------------------------------------------------------
function Save_Data_Callback(hObject, eventdata, handles)
% --------------------------------------------------------------------

% SAVE DATA RESISTIVITAS
function Save_resist_Callback(hObject, eventdata, handles)
global n C1 C2 P1 P2 A V sp D R Meter Z_1 rho K
s = str2num(get(handles.spasi,'String'));
I = length (n);

% Menghitung Rho
rho = zeros(I,1);
for i=1:I
    for j=1:1
        rho(i,j)=R(i,j)*K(i,j);
    end
end

D=zeros(I,1)
for i=1:I
    for j=1:1
        D(i,j)= ((P1(i,j)-C2(i,j))/ 2)+C2(i,j);
    end
end

% Mengatur file penyimpanan
[filename, patchname] = uiputfile('.txt');
F = get(handles.Table_Dipole_Dipole);
nama1 = fullfile(filename);

% Membuat Data Set untuk txt
fileID = fopen(nama1, 'w');
aa = get(handles.Nama, 'String');
ab= ''
bb = str2num(get(handles.spasi, 'String'));
cc = 3;
dd = length(n);
ee = 1;
ff = 0;
gg = [D sp n rho];
gg_1=gg';
hh = 1;
ii = str2num(get(handles.Jumlah_Titik, 'String'));

% Mengambil Data Koordinat
kk = [Meter Z_1];
kk_1=kk'
ll = [1; 0; 0; 0];

% Menampilkan Dalam txt
fprintf(fileID, '%c',aa);
fprintf(fileID, '%c\n',ab);
fprintf(fileID, '%d\n', bb);
fprintf(fileID, '%d\n', cc);
fprintf(fileID, '%d\n', dd);
fprintf(fileID, '%d\n', ee);
fprintf(fileID, '%d\n', ff);
fprintf(fileID, '%d\t%d\t%d\t%f\n', gg_1);
fprintf(fileID, '%d\n', hh);
fprintf(fileID, '%d\n', ii);
fprintf(fileID, '%d\t%d\n', kk_1);
fprintf(fileID, '%d\n', ll);

% Close the file
fclose(fileID);
% --------------------------------------------------------------------
% SAVE KOORDINAT
function Save_Coordinate_Callback(hObject, eventdata, handles)
global x y t2
[filename, patchname] = uiputfile('.txt');
F = get(handles.Table_Dipole_Dipole);
nama1 = fullfile(filename);
xxx=[t2 x y];
xx_1=xxx';
fileID = fopen(nama1, 'w');
fprintf(fileID,'%f\t%f\t%f\n', xx_1);

% Close the file
fclose(fileID);
% --------------------------------------------------------------------
% SAVE CURVE/GRAPHIC
function save_graphic_Callback(hObject, eventdata, handles)
[filename,patchname]=uiputfile ({'.bmp','Bitmap';'.jpg',...
    'Join Photographic Group';'.png',...
    'Portable Network Graphics'},...
    'Simpan Gambar','Peta');
F=getframe(handles.axes1);
image1=frame2im(F);
nama1=fullfile(filename);
imwrite(image1,nama1)

% HEADER LIST--------------------------------------------------------------
% --------------------------------------------------------------------
function Configuration_List_Callback(hObject, eventdata, handles)
% --------------------------------------------------------------------
function Dipole_Calculation_Callback(hObject, eventdata, handles)
% --------------------------------------------------------------------
function Schlumberger_Calculation_Callback(hObject, eventdata, handles)
% --------------------------------------------------------------------
function Wenner_Alpha_Calculation_Callback(hObject, eventdata, handles)
Wenner_Alpha
% --------------------------------------------------------------------

% LOGO n PICTURE
% --- Executes during object creation, after setting all properties.
function axes9_CreateFcn(hObject, eventdata, handles)
aaa=imread('file.enc');
imshow(aaa);
% --- Executes during object creation, after setting all properties.
function axes8_CreateFcn(hObject, eventdata, handles)
bbb=imread('LOGO.png');
imshow(bbb);
% --- Executes during object creation, after setting all properties.
function axes10_CreateFcn(hObject, eventdata, handles)
ccc=imread('UPN LOGO.png');
imshow(ccc)

% INPUT INTERPOLATE CODE---------------------------------------------------
function interpolasi_Callback(hObject, eventdata, handles)
function interpolasi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to interpolasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% SHOW CONTOUR DATA--------------------------------------------------------
function kontur_data_Callback(hObject, eventdata, handles)
global D n rho
f_1=str2num(get(handles.interpolasi,'String'));
axes(handles.axes1)
dt=D';
n_1=n';



axes(handles.axes1)
dt=D;
n_1=n;
r=rho;

[x, y] = meshgrid(min(D):0.1:max(D),min(n):0.1:max(n));
if f_1==1
    v = griddata(D,n,rho,x,y,'linear');
elseif f_1==2
     v = griddata(D,n,rho,x,y,'nearest');
elseif f_1==3
     v = griddata(D,n,rho,x,y,'natural');
elseif f_1==4
     v = griddata(D,n,rho,x,y,'cubic');
else
     v = griddata(D,n,rho,x,y,'v4');
end


contourf(x, y, v)
title('Kontur rho');
xlabel('Lintasan');
ylabel('n');
set(handles.axes1,'ydir','reverse')
ylim([min(n-3) max(n+3)]);
xlim([min(D-3) max(D+3)]);
m=colorbar('westoutside')




