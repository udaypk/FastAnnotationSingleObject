clear all;
close all;
global imgcnt;
global objectNameList;
global fileList;
global folderName;
global mydebug;
global hFigure;


global folderPath;
global firstImage;
mydebug=1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cfgFile=parseXML('AnnotationToolSingleObjectConfig.xml');
tagNames={cfgFile.Children.Name};
fpidx=find(strcmp(tagNames,'folderPath'));
if (~isempty(fpidx))
    folderPath=cfgFile.Children(fpidx).Children.Data;
    if (folderPath(end)=='\')
        folderPath(end)='';
    end
    folderName= strsplit(folderPath,'\');
    folderName=folderName{end};
else
    err=errordlg('folderPath tag is not present in AnnotationToolSingleObjectConfig.xml. Refer to Readme.txt');
    waitfor(err)
    exit;
end
objidx=find(strcmp(tagNames,'objectName'));
if (~isempty(objidx))
    for i=1:length(objidx)
        objectNameList{i}=cfgFile.Children(objidx(i)).Children.Data;
    end
else
    err=errordlg('objectName tag is not presnt in AnnotationToolSingleObjectConfig.xml. Refer to Readme.txt');
    waitfor(err)
    exit;
end
if (length(objectNameList)>1)
    err=errordlg('Multiple objectName tags in AnnotationToolSingleObjectConfig.xml. Refer to Readme.txt. If you want to tag multiple objects, use AnnotationToolMultipleObjects.exe');
    waitfor(err)
    exit;
end
    
fimgidx=find(strcmp(tagNames,'firstImage'));
if (~isempty(fimgidx))
    firstImage=cfgFile.Children(fimgidx).Children.Data;
else
    err=errordlg('firstImage tag in AnnotationToolSingleObjectConfig.xml is incorrect. Refer to Readme.txt');
    waitfor(err)
    exit;
end
fileList=dir(strcat(folderPath,'\JPEGImages\'));
fileList=fileList(~cellfun('isempty', {fileList.date}));%Eliminate invalid entries
fileList=fileList(~[fileList.isdir]);
fileList={fileList.name};
fimgidx=find(strcmp(fileList,firstImage));
if (~isempty(fimgidx))
    imgcnt=fimgidx;
else
    err=errordlg(strcat(firstImage, ' is not present in directory', folderPath));
    waitfor(err)
    exit;
end
configParams = questdlg(strcat('FolderPath: ',folderPath,'        ObjectTag: ',objectNameList{1}, '        FirstImage: ',firstImage), ...
	'Confirm your configuration parameters', ...
	'Proceed','Quit','Proceed');
% Handle response
switch configParams
    case 'Proceed'        
    case 'Quit'
        exit;
end

hFigure=figure('MenuBar', 'none','ToolBar', 'none','CloseRequestFcn',@annotationToolSingleObjectCloseWindowCallback,'KeyPressFcn',@annotationToolSingleObjectKeyPressCallback);
set(hFigure, 'WindowKeyPressFcn', []);
%hbuttonBack=uicontrol(gcf,'style','pushbutton','string','Back','Position', [260 20 1000 100],'callback','annotationToolSingleObjectBackButtonCallback');
%hbuttonReload=uicontrol(gcf,'style','pushbutton','string','Reload','Position', [20 20 100 100],'callback','annotationToolSingleObjectReloadButtonCallback');
%hbuttonNext=uicontrol(gcf,'style','pushbutton','string','Next','Position', [140 20 100 100],'callback','annotationToolSingleObjectNextButtonCallback');
annotationToolSingleObjectShowImage()
