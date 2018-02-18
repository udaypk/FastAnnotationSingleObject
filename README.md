# FastAnnotationSingleObject  https://youtu.be/R-rfiF2laEE
This tool can be used to annotate large number of images (draw bounding boxes and assign label) in PASCAL VOC format very fast if the user has collected the image corpus in an organized manner and each image has only one object of interest.
For example a car manufacturer wants to detect two models of his brand model1 and model2. All the images of model1 can be collected in one folder and model2 in another folder and thsi tool can be used on each folder sequentially to annotate the images. 

Our main goal was to reduce manual annotation time and because of our customization/restriction to label only one object per image, our tool can be 10x faster than LabelImg (https://github.com/tzutalin/labelImg). We were able to annotate around 6000 images per day (8 hours) using this tool.
 

1. Description: <br>
	AnnotationToolSingleObject.exe should be used if your image set has only one object per image. <br>
	The tool automates many steps comapred to LableImg and other such tools. <br>
	Number of clicks, assigning a tag and saving xml are all done automatically without any user intervention. <br>
	All the images of each object class should be grouped into separate directories. If that can't be done, use our other tool AnnotationToolMultipleObjects.exe  <br> 
	If your image set has more than one object per image, use AnnotationToolMultipleObjects.exe. https://github.com/udaypk/FastAnnotationMultipleObjects <br>

2. Prerequisites and requirements:<br>
	a. Install MATLAB 2017a MCRInstaller.exe <br>
	   Windows http://ssd.mathworks.com/supportfiles/downloads/R2017a/deployment_files/R2017a/installers/win64/MCR_R2017a_win64_installer.exe <br>
	   Linux   http://ssd.mathworks.com/supportfiles/downloads/R2017a/deployment_files/R2017a/installers/glnxa64/MCR_R2017a_glnxa64_installer.zip <br>
	   MacOS   http://ssd.mathworks.com/supportfiles/downloads/R2017a/deployment_files/R2017a/installers/maci64/MCR_R2017a_maci64_installer.dmg.zip <br>

3. Usage:<br>
	a. Download AnnotationToolSingleObject.exe and AnnotationToolSingleObjectConfig.xml fron Executables folder. <br>
	b. It is mandatory to follow Pascal VOC directory structure for stroing the images you want to annotate. <br>
	      All images should be in VOC2012\JPEGImages <br>
	      All annotation xmls will be generated in VOC2012\Annotations <br>
	c. Update AnnotationToolSingleObjectConfig.xml as per your requirement before running AnnotationToolSingleObject.exe. See below for details of xml configuration. <br>
	d. Double click on AnnotationToolSingleObject.exe to start annotation. <br> 
	e. You will see a pop up asking for confirmation of the image folder path and object tag.<br> 
	f. On pressing "Proceed" the tool loads first image.<br>
	g. Draw the bounding box on that image. The tool automatically creates an annotation file in Annotations folder and loads next image without any manual intervention.<br>
	h. Proceed annotationg all images. <br>
	i. If you have drawn a wrong bounding box, you can simply press "a" to load previous image.<br>
	j. Press "d" to skip annotating current image and go to next image. <br>

4. Updating AnnotationToolSingleObjectConfig.xml<br>
        Modify the parameters in config tag before starting the exe.<br>

        folderPath::is absolute path to basefolder. 
        Example: If you want to annotate cat images and all your images are located in C:\Data\Corpus\Cats\VOC2012\JPEGImages
        <folderPath>C:\Data\Corpus\Cats\VOC2012\</folderPath> 

        firstImage::Tool starts loading images in alphabetical order. This tag indicates the first image you want to load.
        Example: If you have images Cat001.jpg, Cat002.jpg ...Cat999.jpg.
        You have annotated upto Cat245.jpg yesterday, you can modify the firstImage tag to: 
        <firstImage>Cat246.jpg</firstImage> 
        and the tool will load images Cat246.jpg. 
        
        objectName::defines the class tag. This tool allows you to tag only one class per folder. 
        If you have mixed set of images, you should use AnnotationToolMultipleObjects.exe 
        Example: <objectName>cat</objectName>

5. Usage Example: <br>
        Usage video: https://youtu.be/R-rfiF2laEE  <br>
	This tool should be used if and only if your image set contains one desired object per image. <br>
	Your goal is build an annotated corpus for object classification for cat and dog. <br>
	You have images that contain one cat or one dog per image. <br>
	Create two folders Cats and Dogs <br>
	Copy all your cat images into Cats\VOC2012\JPEGImages directory.<br>
	Copy all your dog images into Dogs\VOC2012\JPEGImages directory. <br>
	First you annotate all cat images.<br>
	For this update the AnnotationToolSingleObjectConfig.xml file as shown: <br>
	\<folderPath\>C:\Data\Corpus\Cats\VOC2012\\<\/folderPath\> <br>
	\<firstImage\>Cat001.jpg\<\/firstImage\> <br>
	\<objectName\>cat\<\/objectName\> <br>
	Run AnnotationToolSingleObject.exe. <br>
	Draw bounding boxes for each image. <br>
	All the annotation files will be created in C:\Data\Corpus\Cats\VOC2012\Annotations folder <br>
	After all the cat images are completed, exit the too. <br>
	Change the AnnotationToolSingleObjectConfig.xml file again to start annotating dog images as below: <br>
	\<folderPath\>C:\Data\Corpus\Dogs\VOC2012\\<\/folderPath\> <br>
	\<firstImage\>Dog001.jpg\<\/firstImage\> <br>
	\<objectName\>dog\<\/objectName\> <br>
