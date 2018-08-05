function varargout = GuessIt(varargin)
% GUESSIT MATLAB code for GuessIt.fig
%      GUESSIT, by itself, creates a new GUESSIT or raises the existing
%      singleton*.
%
%      H = GUESSIT returns the handle to a new GUESSIT or the handle to
%      the existing singleton*.
%
%      GUESSIT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUESSIT.M with the given input arguments.
%
%      GUESSIT('Property','Value',...) creates a new GUESSIT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GuessIt_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GuessIt_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GuessIt

% Last Modified by GUIDE v2.5 27-Jul-2018 19:41:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GuessIt_OpeningFcn, ...
                   'gui_OutputFcn',  @GuessIt_OutputFcn, ...
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


% --- Executes just before GuessIt is made visible.
function GuessIt_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GuessIt (see VARARGIN)

% Choose default command line output for GuessIt
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GuessIt wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GuessIt_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function guess_Callback(hObject, eventdata, handles)
% hObject    handle to guess (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of guess as text
%        str2double(get(hObject,'String')) returns contents of guess as a double


% --- Executes during object creation, after setting all properties.
function guess_CreateFcn(hObject, eventdata, handles)
% hObject    handle to guess (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function result_Callback(hObject, eventdata, handles)
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result as text
%        str2double(get(hObject,'String')) returns contents of result as a double


% --- Executes during object creation, after setting all properties.
function result_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tries_Callback(hObject, eventdata, handles)
% hObject    handle to tries (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tries as text
%        str2double(get(hObject,'String')) returns contents of tries as a double


% --- Executes during object creation, after setting all properties.
function tries_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tries (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

global x;
% --- Executes on button press in startgame.
function startgame_Callback(hObject, eventdata, handles)
% hObject    handle to startgame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;
y = randi([1 100],1,1);
tries = 6;
flag=0;
while(tries>0)
    w = waitforbuttonpress;
    if w==0
        w1 = waitforbuttonpress;
        if w1==0
    pause(2)
    tries = tries - 1;
    disp(x)
    disp(y)
    set(handles.tries,'String',tries);
    if( x > y)
        set(handles.result,'String','Decrease your guess');
    elseif( x < y)
        set(handles.result,'String','Increase your guess');
    else
        set(handles.result,'String','Congratulations!!');
        flag=1;
        break;
    end
        end
    end
end




% --- Executes on button press in checkit.
function checkit_Callback(hObject, eventdata, handles)
% hObject    handle to checkit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;
x = str2num(get(handles.guess,'string'));



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
