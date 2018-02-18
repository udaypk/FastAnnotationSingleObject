function annotationToolSingleObjectShowImage()
global imgcnt;
global folderName;
global fileName;
global imageObjectList;
global xmlFile;
global objectNameList;

global folderPath;
global fileList;


fileName=fileList{imgcnt};
[pathstr,fileNameWoExtn,ext] = fileparts(fileName);
imageFile=sprintf('%s\\JPEGImages\\%s',folderPath,fileName);
xmlFile=sprintf('%s\\Annotations\\%s.xml',folderPath,fileNameWoExtn);
myImg=imread(imageFile);
imshow(myImg)
set(gcf,'numbertitle','off','name',strcat('Image::',fileName,"   ObjectTag::",objectNameList{1}))
try
    imrect_handle=imrect();
    rect=imrect_handle.getPosition();
    delete(imrect_handle);
catch
    disp('Extied in imrect try catch block')
    return;
end
bbxmin=floor(rect(1));
bbymin=floor(rect(2));
bbwidth=floor(rect(3));
bbheight=floor(rect(4));
hold on
rectangle('Position', [bbxmin, bbymin, bbwidth, bbheight],'EdgeColor','g', 'LineWidth', 2)
hold off
pause(.02);
width=(size(myImg,2));
height=(size(myImg,1));
depth=(size(myImg,3));
imageObjectList(1).xmin=(max(20,bbxmin));
imageObjectList(1).ymin=(max(20,bbymin));
imageObjectList(1).xmax=(min(width-20,bbxmin+bbwidth));
imageObjectList(1).ymax=(min(height-20,bbymin+bbheight));
imageObjectList(1).name=objectNameList{1};
annotationToolMultipleObjectsXMLWriter(folderName,fileName,width,height,depth,imageObjectList,xmlFile)
imgcnt=imgcnt+1;
annotationToolSingleObjectShowImage()
end