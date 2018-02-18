function annotationToolSingleObjectKeyPressCallback(src,event)
global curr_rect;
global fileList;
global fileName;
global folderName;
global folderPath;
global imageData;
global imageObjectList;
global imgcnt;
global mydebug;
global objectCount;
global xmlFile;

if (strcmp(event.Key,'z')||strcmp(event.Key,'d'))
    imgcnt=imgcnt+1;
    if(mydebug==1)
        disp(strcat('In keypress next (z or d) CB:',num2str(imgcnt)))
    end
    annotationToolSingleObjectShowImage();    
end
if(strcmp(event.Key,'a'))
    imgcnt=imgcnt-1;
    if(mydebug==1)
        disp(strcat('In keypress back (a) CB:',num2str(imgcnt)))
    end
    annotationToolSingleObjectShowImage();
    
end
if (strcmp(event.Key,'s')||strcmp(event.Key,'x'))
    if(mydebug==1)
        disp(strcat('In keypress reload (s) CB:',num2str(imgcnt)))
    end
    annotationToolSingleObjectShowImage();
end

