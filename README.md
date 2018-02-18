# FastAnnotationSingleObject  https://youtu.be/R-rfiF2laEE
This tool can be used to annotate large number of images (draw bounding boxes and assign label) in PASCAL VOC format very fast if the user has collected the image corpus in an organized manner and each image has only one object of interest.
For example a car manufacturer wants to detect two models of his brand model1 and model2. All the images of model1 can be collected in one folder and model2 in another folder and thsi tool can be used on each folder sequentially to annotate the iamges. 

Our main goal was to reduce manual annotation time and because of our customization/restriction to label only one object per image, our tool can be 10x faster than LabelImg (https://github.com/tzutalin/labelImg). We were able to annotate around 6000 images per day (8 hours) using this tool.
 

1. Description: 
	AnnotationToolSingleObject.exe should be used if your image set has only one object per image. 
	The tool automates many steps comapred to LableImg and other such tools. 
	Number of clicks, assigning a tag and saving xml are all done automatically without any user intervention. 
	All the images of each object class should be grouped into separate directories. If that can't be done, use our other tool AnnotationToolMultipleObjects.exe   
	If your image set has more than one object per image, use AnnotationToolMultipleObjects.exe. 

2. Prerequisites and requirements:
	a. Install MATLAB 2017a MCRInstaller.exe 
	   Windows http://ssd.mathworks.com/supportfiles/downloads/R2017a/deployment_files/R2017a/installers/win64/MCR_R2017a_win64_installer.exe
	   Linux   http://ssd.mathworks.com/supportfiles/downloads/R2017a/deployment_files/R2017a/installers/glnxa64/MCR_R2017a_glnxa64_installer.zip
	   MacOS   http://ssd.mathworks.com/supportfiles/downloads/R2017a/deployment_files/R2017a/installers/maci64/MCR_R2017a_maci64_installer.dmg.zip

3. Usage:
	a. Make sure AnnotationToolSingleObject.exe and AnnotationToolSingleObjectConfig.xml are in the same folder.
	b. It is mandatory to follow Pascal VOC directory structure for stroing the images you want to annotate. 
	   All images should be in VOC2012\JPEGImages
	   All annotation xmls will be generated in VOC2012\Annotations
	b. Update AnnotationToolSingleObjectConfig.xml as per your requirement before running AnnotationToolSingleObject.exe. See below for details of xml configuration.
	c. Double click on AnnotationToolSingleObject.exe to start annotation. 
	d. You will see a pop up asking for confirmation of the image folder path and object tag. 
	e. On pressing "Proceed" the tool loads first image
	f. Draw the bounding box on that image. The tool automatically creates an annotation file in Annotations folder and loads next image without any manual intervention.
	g. Proceed annotationg all images
	h. If you have drawn a wrong bounding box, you can simply press "a" to load previous image
	i. Press "d" to skip annotating current image and go to next image

4. Updating AnnotationToolSingleObjectConfig.xml
	Modify the parameters in config tag before starting the exe.

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

5. Usage Example:
        Usage video: https://youtu.be/R-rfiF2laEE
	This tool should be used if and only if your image set contains one desired object per image.
	Your goal is build an annotated corpus for object classification for cat and dog. 
	You have images that contain one cat or one dog per image.
	Create two folders CatImages and DogImages 
	Copy all your cat images into Cats\VOC2012\JPEGImages directory.
	Copy all your dog images into Dogs\VOC2012\JPEGImages directory. 
	First you annotate all cat images.
	For this update the AnnotationToolSingleObjectConfig.xml file as shown:
	<folderPath>C:\Data\Corpus\Cats\VOC2012\</folderPath>
	<firstImage>Cat001.jpg</firstImage>
	<objectName>cat</objectName>
	Run AnnotationToolSingleObject.exe.
	Draw bounding boxes for each image.
	All the annotation files will be created in D:\MyData\2017\CatImages\VOC2012\Annotations folder
	After all the cat images are completed, exit the too.
	Change the AnnotationToolSingleObjectConfig.xml file again to start annotating dog images as below:
	folderPath>C:\Data\Corpus\Dogs\VOC2012\</folderPath>
	<firstImage>Dog001.jpg</firstImage>
	<objectName>dog</objectName>