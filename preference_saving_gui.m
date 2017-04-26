function varargout = preference_saving_gui(varargin)
% PREFERENCE_SAVING_GUI M-file for preference_saving_gui.fig
%      PREFERENCE_SAVING_GUI, by itself, creates a new PREFERENCE_SAVING_GUI or raises the existing
%      singleton*.
%
%      H = PREFERENCE_SAVING_GUI returns the handle to a new PREFERENCE_SAVING_GUI or the handle to
%      the existing singleton*.
%
%      PREFERENCE_SAVING_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PREFERENCE_SAVING_GUI.M with the given input arguments.
%
%      PREFERENCE_SAVING_GUI('Property','Value',...) creates a new PREFERENCE_SAVING_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before preference_saving_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to preference_saving_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help preference_saving_gui

% Last Modified by GUIDE v2.5 01-May-2009 14:52:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @preference_saving_gui_OpeningFcn, ...
    'gui_OutputFcn',  @preference_saving_gui_OutputFcn, ...
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


% --- Executes just before preference_saving_gui is made visible.
function preference_saving_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to preference_saving_gui (see VARARGIN)

% Choose default command line output for preference_saving_gui
handles.output = hObject;

if(exist('gui_session_data.mat')==2)
    load('gui_session_data.mat')
    disp('LOADING OLD SESSION DATA FROM MAT-FILE')
    handles.mydata=session_data;
    
    set(handles.slider1,'value', handles.mydata.slider_value);
    set(handles.edit1,'string', handles.mydata.edit_box_str);
    
else
    disp('Default GUI LOADED-No MAT file found')
    handles.mydata.slider_value=0;
    handles.mydata.edit_box_str ='Default GUI Loaded';
    
    set(handles.slider1,'value', handles.mydata.slider_value);
    set(handles.edit1,'string', handles.mydata.edit_box_str);
    
end


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes preference_saving_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = preference_saving_gui_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double




% Do something here


% save it to mydata in handles.
str = get(hObject,'String');
handles.mydata.edit_box_str=str;

guidata(hObject,handles);



% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% Do something here

% save required values into mydata in handles.
val = get(hObject,'Value');
handles.mydata.slider_value=val;
guidata(hObject,handles);


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%BEFORE CLOSING FIGURE WRITE ALL REQUIRED MYDATA TO MAT-FILE.

session_data=handles.mydata;
disp('SAVING SESSION DATA TO MAT-FILE')
save gui_session_data.mat session_data


% Hint: delete(hObject) closes the figure
delete(hObject);
