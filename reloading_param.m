function varargout = reloading_param(varargin)
% RELOADING_PARAM M-file for reloading_param.fig
%      RELOADING_PARAM, by itself, creates a new RELOADING_PARAM or raises the existing
%      singleton*.
%
%      H = RELOADING_PARAM returns the handle to a new RELOADING_PARAM or the handle to
%      the existing singleton*.
%
%      RELOADING_PARAM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RELOADING_PARAM.M with the given input arguments.
%
%      RELOADING_PARAM('Property','Value',...) creates a new RELOADING_PARAM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before reloading_param_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to reloading_param_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help reloading_param

% Last Modified by GUIDE v2.5 21-Jul-2009 14:07:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @reloading_param_OpeningFcn, ...
                   'gui_OutputFcn',  @reloading_param_OutputFcn, ...
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


% --- Executes just before reloading_param is made visible.
function reloading_param_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to reloading_param (see VARARGIN)

% Choose default command line output for reloading_param
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes reloading_param wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = reloading_param_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% SAVE BUTTON EXECUTION

data = handles.mystructdata;
save('testmatfile.mat','data');



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% RELOAD Button
% uses the fieldnames of the structure that were saved earlier to reassign
% the properties of the GUI components using SET. 

temp = load('testmatfile.mat');
data=temp.data;
uictagnames = fieldnames(data);
for i =1:numel(uictagnames)
    str=sprintf('uicparams = fieldnames(data.%s)',uictagnames{i});
    evalc(str);
    for j = 1:numel(uicparams)
       evalstr = sprintf('tempval = data.%s.%s',uictagnames{i},uicparams{j});
       evalc(evalstr);
        if ~isnumeric(tempval)
        evalstr = sprintf('set(handles.%s,''%s'',''%s'')',uictagnames{i}, uicparams{j},tempval);
        else 
        evalstr = sprintf('set(handles.%s,''%s'',%d)',uictagnames{i}, uicparams{j}, tempval);
        end
        evalc(evalstr);
    end
    
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double



% Data preparation
str=get(hObject,'String');
tagname=get(hObject,'tag');
% USE TAGNAME AND PROPERTY NAME AS FIELDNAMES FOR THE STRUCTURE to save
% data. 
evalstring = sprintf('handles.mystructdata.%s.string = ''%s''',tagname,str{1});
evalc(evalstring);
guidata(hObject,handles)



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% Data preparation
str=get(hObject,'String');
tagname=get(hObject,'tag');
% USE TAGNAME AND VALUE OF THE PROPERTY AS FIELDNAMES FOR THE STRUCTURE
evalstring = sprintf('handles.mystructdata.%s.string = ''%s''',tagname,str{1});
evalc(evalstring);
guidata(hObject,handles)



% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% Data preparation
value=get(hObject,'Value');
tagname=get(hObject,'tag');
% USE TAGNAME AND VALUE OF THE PROPERTY AS FIELDNAMES FOR THE STRUCTURE
evalstring = sprintf('handles.mystructdata.%s.value = %d',tagname,value);
evalc(evalstring);
guidata(hObject,handles)

