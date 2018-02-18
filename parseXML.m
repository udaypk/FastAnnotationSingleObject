function theStruct = parseXML(filename)
try
   tree = xmlread(filename);
catch
   error('Failed to read XML file %s.',filename);
end
try
   theStruct = parseChildNodes(tree);
catch
   error('Unable to parse XML file %s.',filename);
end

function children = parseChildNodes(theNode)
children = [];
if theNode.hasChildNodes
   childNodes = theNode.getChildNodes;
   numChildNodes = childNodes.getLength;
   allocCell = cell(1, numChildNodes);
   children = struct('Name',allocCell,'Attributes',allocCell,'Data',allocCell,'Children',allocCell);
    for count = 1:numChildNodes
        theChild = childNodes.item(count-1);
        children(count) = makeStructFromNode(theChild);
    end
end
function nodeStruct = makeStructFromNode(theNode)
nodeStruct = struct('Name', char(theNode.getNodeName),'Attributes', parseAttributes(theNode),'Data', '','Children', parseChildNodes(theNode));
if any(strcmp(methods(theNode), 'getData'))
   nodeStruct.Data = char(theNode.getData); 
else
   nodeStruct.Data = '';
end
function attributes = parseAttributes(theNode)
attributes = [];
if theNode.hasAttributes
   theAttributes = theNode.getAttributes;
   numAttributes = theAttributes.getLength;
   allocCell = cell(1, numAttributes);
   attributes = struct('Name', allocCell, 'Value',allocCell);
   for count = 1:numAttributes
      attrib = theAttributes.item(count-1);
      attributes(count).Name = char(attrib.getName);
      attributes(count).Value = char(attrib.getValue);
   end
end