function annotationToolMultipleObjectsXMLWriter(folderName,fileName,width,height,depth,imageObjectList,xmlFile)
docNode = com.mathworks.xml.XMLUtils.createDocument('annotation');
docRootNode=docNode.getDocumentElement;

folderElement = docNode.createElement('folder'); 
folderElement.appendChild(docNode.createTextNode(folderName));
docRootNode.appendChild(folderElement);

fileNameElement = docNode.createElement('filename'); 
fileNameElement.appendChild(docNode.createTextNode(fileName));
docRootNode.appendChild(fileNameElement);

sizeElement = docNode.createElement('size'); 
sizeWidthElement = docNode.createElement('width');
sizeWidthElement.appendChild(docNode.createTextNode(num2str(width)));
sizeElement.appendChild(sizeWidthElement);
sizeHeightElement = docNode.createElement('height');
sizeHeightElement.appendChild(docNode.createTextNode(num2str(height)));
sizeElement.appendChild(sizeHeightElement);
sizeDepthElement = docNode.createElement('depth');
sizeDepthElement.appendChild(docNode.createTextNode(num2str(depth)));
sizeElement.appendChild(sizeDepthElement);
docRootNode.appendChild(sizeElement);

segmentedElement = docNode.createElement('segmented'); 
segmentedElement.appendChild(docNode.createTextNode('0'));
docRootNode.appendChild(segmentedElement);
for i=1:length(imageObjectList)
    objectElement = docNode.createElement('object');
    
    objectNameElement = docNode.createElement('name');
    objectNameElement.appendChild(docNode.createTextNode(imageObjectList(i).name));
    objectElement.appendChild(objectNameElement);
    
    objectPoseElement = docNode.createElement('pose');
    objectPoseElement.appendChild(docNode.createTextNode('Unspecified'));
    objectElement.appendChild(objectPoseElement);
    
    objectTruncatedElement = docNode.createElement('truncated');
    objectTruncatedElement.appendChild(docNode.createTextNode('0'));
    objectElement.appendChild(objectTruncatedElement);
    
    objectDifficultElement = docNode.createElement('difficult');
    objectDifficultElement.appendChild(docNode.createTextNode('0'));
    objectElement.appendChild(objectDifficultElement);
    
    objectBndbxElement = docNode.createElement('bndbox');
    objectElement.appendChild(objectBndbxElement);
    
    objectBndbxXminElement = docNode.createElement('xmin');
    objectBndbxXminElement.appendChild(docNode.createTextNode(num2str(imageObjectList(i).xmin)));
    objectBndbxElement.appendChild(objectBndbxXminElement);
    
    objectBndbxYminElement = docNode.createElement('ymin');
    objectBndbxYminElement.appendChild(docNode.createTextNode(num2str(imageObjectList(i).ymin)));
    objectBndbxElement.appendChild(objectBndbxYminElement);
    
    objectBndbxXmaxElement = docNode.createElement('xmax');
    objectBndbxXmaxElement.appendChild(docNode.createTextNode(num2str(imageObjectList(i).xmax)));
    objectBndbxElement.appendChild(objectBndbxXmaxElement);
    
    objectBndbxYmaxElement = docNode.createElement('ymax');
    objectBndbxYmaxElement.appendChild(docNode.createTextNode(num2str(imageObjectList(i).ymax)));
    objectBndbxElement.appendChild(objectBndbxYmaxElement);
    
    docRootNode.appendChild(objectElement);
end
    
xmlwrite(xmlFile,docNode);
%type(xmlFileName);
end