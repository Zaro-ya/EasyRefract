function varargout = Wenner_Alpha(varargin)
% WENNER_ALPHA MATLAB code for Wenner_Alpha.fig
%      WENNER_ALPHA, by itself, creates a new WENNER_ALPHA or raises the existing
%      singleton*.
%
%      H = WENNER_ALPHA returns the handle to a new WENNER_ALPHA or the handle to
%      the existing singleton*.
%
%      WENNER_ALPHA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WENNER_ALPHA.M with the given input arguments.
%
%      WENNER_ALPHA('Property','Value',...) creates a new WENNER_ALPHA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Wenner_Alpha_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Wenner_Alpha_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Wenner_Alpha

% Last Modified by GUIDE v2.5 24-Nov-2023 23:28:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Wenner_Alpha_OpeningFcn, ...
                   'gui_OutputFcn',  @Wenner_Alpha_OutputFcn, ...
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


% --- Executes just before Wenner_Alpha is made visible.
function Wenner_Alpha_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Wenner_Alpha (see VARARGIN)

% Choose default command line output for Wenner_Alpha
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Wenner_Alpha wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Wenner_Alpha_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Input_Wenner.
function Input_Wenner_Callback(hObject, eventdata, handles)
global n C1 C2 P1 P2 A V
[filename,patchname]=uigetfile({'.txt';'.data'},'inputdata');
data=strcat(patchname,filename);
read = fileread(data)
in= str2num (read);
set(handles.Table_Dipole_Dipole,'data',in)
n=in(:,1);
C1=in(:,2);
C2=in(:,3);
P1=in(:,4);
P2=in(:,5);
A=in(:,6);
V=in(:,7);

function Spasi_Callback(hObject, eventdata, handles)
% hObject    handle to Spasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Spasi as text
%        str2double(get(hObject,'String')) returns contents of Spasi as a double


% --- Executes during object creation, after setting all properties.
function Spasi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Spasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Hitung_Pushbutton.
function Hitung_Pushbutton_Callback(hObject, eventdata, handles)
global n C1 C2 P1 P2 A V sp 
s = str2num(get(handles.Spasi,'String'))
I = length (n)
sp=zeros(I,1)
for i=1:I
    for j=1:1
        sp(i,j)= s
    end
end
R=zeros(I,1)
for i=1:I
    for j=1:1
        R(i,j)= V(i,j)/A(i,j)
    end
end
K=zeros(I,1)
for i=1:I
    for j=1:1
        K(i,j)= 3.14*n(i,j)*sp(i,j)*(n(i,j)+1)*(n(i,j)+2)
    end
end
D=zeros(I,1)
for i=1:I
    for j=1:1
        D(i,j)= (P1(i,j)-C1(i,j))/ 2+C1(i,j)
    end
end
hasil=[n C1 C2 P1 P2 A V sp R K D]
set(handles.Table_Dipole_Dipole,'data',hasil)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
