//This macro combines all tests used from CT QA  for GE phantom for BMH 112
// User is asked for filenames of all images.
MonthNames = newArray("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");
getDateAndTime(year, month, dayOfWeek, dayOfMonth, hour, minute, second, msec);
Y=toString(year);
M=toString(MonthNames[month]);
D=toString(dayOfMonth);
DT = Y + M + D;
//print(DT);


	  
												//High resolution QA more information

										//High resolution QA

open("C:\\temp\\ect116\\view01.dcm");  					//open text file to write data



setAutoThreshold();											//Thresholds the image


//setTool(8);

doWand(245, 118);											//Calls ImageJ's autoselection tool to select phantom


getSelectionCoordinates(x,y);										//Gets coordinates of selection

var xsum, ysum, xavg, yavg;										//Defines parameters for least squares circle fit
var SUU, SUV, SVV, SUUU, SVVV, SUVV,SVUU;
var C, F;




SUU=0;													//Parameters initialized for least squares circle fit
SUV=0;
SVV=0;
SUUU=0;
SVVV=0;
SUVV=0;
SVUU=0;

xsum=0;
ysum=0;

for(n=0; n<x.length; n++){
	xsum=xsum+x[n];
	ysum=ysum+y[n];
	}

xavg=xsum/x.length;
yavg=ysum/y.length;

for(i=0; i<x.length; i++){

	SUU=(x[i]-xavg)*(x[i]-xavg)+SUU;								//Least squares circle fit regression
	SUV=(x[i]-xavg)*(y[i]-yavg)+SUV;
	SVV=(y[i]-yavg)*(y[i]-yavg)+SVV;
	SUUU=(x[i]-xavg)*(x[i]-xavg)*(x[i]-xavg)+SUUU;
	SVVV=(y[i]-yavg)*(y[i]-yavg)*(y[i]-yavg)+SVVV;
	SUVV=(x[i]-xavg)*(y[i]-yavg)*(y[i]-yavg)+SUVV;
	SVUU=(y[i]-yavg)*(x[i]-xavg)*(x[i]-xavg)+SVUU;
}

C=0.5*(SUUU+SUVV);
F=0.5*(SVVV+SVUU);

var uc, vc;

vc=((F*SUU)-(SUV*C))/((SVV*SUU)-(SUV*SUV));

uc=(C-(SUV*vc))/SUU;

var xc, yc;

xc=uc+xavg;												//Center of phantom calculated
yc=vc+yavg;


//print(xc+" "+yc);



xa=260.2856-xc;											//Shift from center of phantom to pre-defined center calculated
ya=260.3505-yc;


//print(xa+" "+ya);



run("Revert");												//Resets image to previous state, removes thresholding

//setTool(2);

run("ROI Manager...");

makeRectangle(187-xa, 178-ya, 20, 20);								//Creates ROIs at coordinates with shift and adds to ROI manager
roiManager("Add");

makeRectangle(227-xa, 101-ya, 20, 20);
roiManager("Add");

makePolygon(310-xa,172-ya,292-xa,193-ya,308-xa,209-ya,327-xa,187-ya);
roiManager("Add");
makePolygon(278-xa,208-ya,263-xa,223-ya,278-xa,238-ya,293-xa,223-ya);
roiManager("Add");
makePolygon(252-xa,241-ya,240-xa,254-ya,252-xa,265-ya,265-xa,252-ya);
roiManager("Add");
makePolygon(230-xa,270-ya,220-xa,280-ya,229-xa,290-ya,239-xa,279-ya);
roiManager("Add");
makePolygon(208-xa,296-ya,202-xa,304-ya,208-xa,310-ya,216-xa,302-ya);
roiManager("Add");
makePolygon(190-xa,319-ya,184-xa,325-ya,189-xa,331-ya,195-xa,325-ya);
roiManager("Add");

// Save images as Jpegs
roiManager("Show All");
run("From ROI Manager");
saveAs("Jpeg", "C:\\xampp\\htdocs\\CTQA\\ROIs\\ect116\\view01.jpg");


roiManager("Measure")
HRrect1mean = getResult("Mean", 0);			// QA Data for Plexiglass
HRrect1SD= getResult("StdDev", 0);

HRrect2mean = getResult("Mean", 1);			// QA Data for Water
HRrect2SD = getResult("StdDev", 1);

HRrect3mean = getResult("Mean", 2);
HRrect3SD = getResult("StdDev", 2);

HRrect4mean = getResult("Mean", 3);
HRrect4SD = getResult("StdDev", 3);

HRrect5mean = getResult("Mean", 4);
HRrect5SD = getResult("StdDev", 4);

HRrect6mean = getResult("Mean", 5);
HRrect6SD = getResult("StdDev", 5);

HRrect7mean = getResult("Mean", 6);
HRrect7SD = getResult("StdDev", 6);

HRrect8mean = getResult("Mean", 7);
HRrect8SD = getResult("StdDev", 7);

Diff = (HRrect1mean - HRrect2mean);

//print(Diff);


roiManager("Delete");
run("Clear Results");
//print(f, "CT High Contrast Analysis for Standard reconstruction complete");


close();

//print(f, HRrect1mean + "\n" + HRrect1SD + "\n" + HRrect2mean + "\n");


open("C:\\temp\\ect116\\view02.dcm");



setAutoThreshold();

setThreshold(-1598, 15);



//setTool(8);

doWand(245, 118);

getSelectionCoordinates(x, y);


var xsum, ysum, xavg, yavg;
var SUU, SUV, SVV, SUUU, SVVV, SUVV,SVUU;
var C, F;




SUU=0;
SUV=0;
SVV=0;
SUUU=0;
SVVV=0;
SUVV=0;
SVUU=0;

xsum=0;
ysum=0;

for(n=0; n<x.length; n++){
	xsum=xsum+x[n];
	ysum=ysum+y[n];
	}

xavg=xsum/x.length;
yavg=ysum/y.length;

for(i=0; i<x.length; i++){

	SUU=(x[i]-xavg)*(x[i]-xavg)+SUU;
	SUV=(x[i]-xavg)*(y[i]-yavg)+SUV;
	SVV=(y[i]-yavg)*(y[i]-yavg)+SVV;
	SUUU=(x[i]-xavg)*(x[i]-xavg)*(x[i]-xavg)+SUUU;
	SVVV=(y[i]-yavg)*(y[i]-yavg)*(y[i]-yavg)+SVVV;
	SUVV=(x[i]-xavg)*(y[i]-yavg)*(y[i]-yavg)+SUVV;
	SVUU=(y[i]-yavg)*(x[i]-xavg)*(x[i]-xavg)+SVUU;
}

C=0.5*(SUUU+SUVV);
F=0.5*(SVVV+SVUU);

var uc, vc;

vc=((F*SUU)-(SUV*C))/((SVV*SUU)-(SUV*SUV));

uc=(C-(SUV*vc))/SUU;

var xc, yc;

xc=uc+xavg;
yc=vc+yavg;

//print(xc +" "+ yc);


xa=261.0183-xc;											//Shift from center of phantom to pre-defined center calculated
ya=257.7632-yc;

//print(f, xa +" "+ ya);


run("Revert");

makeRectangle(218-xa, 180-ya, 100, 10);
run("ROI Manager...");
roiManager("Add");

makeRectangle(218-xa, 230-ya, 100, 10);
roiManager("Add");

makeRectangle(218-xa, 275-ya, 100, 10);
roiManager("Add");

makeRectangle(218-xa, 330-ya, 100, 10);
roiManager("Add");

// Save images as Jpegs
roiManager("Show All");
run("From ROI Manager");
saveAs("Jpeg", "C:\\xampp\\htdocs\\CTQA\\ROIs\\ect116\\view02.jpg");

//break			// stop
roiManager("Measure");

LCrect1mean = getResult("Mean", 0);
LCrect1SD = getResult("StdDev", 0);

LCrect2mean = getResult("Mean", 1);
LCrect2SD = getResult("StdDev", 1);

LCrect3mean = getResult("Mean", 2);
LCrect3SD = getResult("StdDev", 2);

LCrect4mean = getResult("Mean", 3);
LCrect4SD = getResult("StdDev", 3);

LCSub1 = (LCrect2mean - LCrect1mean);
LCSub2 = (LCrect3mean - LCrect4mean);

roiManager("Delete");
run("Clear Results");
//print(f, "CT Low Contrast Analysis complete");

close();

//print(f, LCrect1mean + "\n");



open("C:\\temp\\ect116\\view03.dcm");



setThreshold(-3024, -700);
setAutoThreshold();


doWand(57, 85);


getSelectionCoordinates(x, y);


var xsum, ysum, xavg, yavg;
var SUU, SUV, SVV, SUUU, SVVV, SUVV,SVUU;
var C, F;




SUU=0;
SUV=0;
SVV=0;
SUUU=0;
SVVV=0;
SUVV=0;
SVUU=0;

xsum=0;
ysum=0;

for(n=0; n<x.length; n++){
	xsum=xsum+x[n];
	ysum=ysum+y[n];
	}

xavg=xsum/x.length;
yavg=ysum/y.length;

for(i=0; i<x.length; i++){

	SUU=(x[i]-xavg)*(x[i]-xavg)+SUU;
	SUV=(x[i]-xavg)*(y[i]-yavg)+SUV;
	SVV=(y[i]-yavg)*(y[i]-yavg)+SVV;
	SUUU=(x[i]-xavg)*(x[i]-xavg)*(x[i]-xavg)+SUUU;
	SVVV=(y[i]-yavg)*(y[i]-yavg)*(y[i]-yavg)+SVVV;
	SUVV=(x[i]-xavg)*(y[i]-yavg)*(y[i]-yavg)+SUVV;
	SVUU=(y[i]-yavg)*(x[i]-xavg)*(x[i]-xavg)+SVUU;
}

C=0.5*(SUUU+SUVV);
F=0.5*(SVVV+SVUU);

var uc, vc;

vc=((F*SUU)-(SUV*C))/((SVV*SUU)-(SUV*SUV));

uc=(C-(SUV*vc))/SUU;

var xc, yc;

xc=uc+xavg;
yc=vc+yavg;



print(xc +" "+ yc);



xa=261.1904-xc;											//Shift from center of phantom to pre-defined center calculated
ya=256.5046-yc;

//print(xa+" "+ya);


run("Revert");

//setTool(0);


makeRectangle(242-xa, 226-ya, 20, 20);
run("ROI Manager...");
roiManager("Add");

makeRectangle(242-xa, 76-ya, 20, 20); 
roiManager("Add");

makeRectangle(92-xa, 226-ya, 20, 20); 
roiManager("Add");

makeRectangle(242-xa, 376-ya, 20, 20); 
roiManager("Add");

makeRectangle(392-xa, 226-ya, 20, 20); 
roiManager("Add");

// Save images as Jpegs
roiManager("Show All");
run("From ROI Manager");
saveAs("Jpeg", "C:\\xampp\\htdocs\\CTQA\\ROIs\\ect116\\view03.jpg");

roiManager("Measure");


UNrect1mean = getResult("Mean", 0);
UNrect1SD = getResult("StdDev", 0);

UNrect2mean = getResult("Mean", 1);
UNrect2SD = getResult("StdDev", 1);

UNrect3mean = getResult("Mean", 2);
UNrect3SD = getResult("StdDev", 2);

UNrect4mean = getResult("Mean", 3);
UNrect4SD = getResult("StdDev", 3);

UNrect5mean = getResult("Mean", 4);
UNrect5SD = getResult("StdDev", 4);

UNDiff = (UNrect1mean - UNrect2mean);

roiManager("Delete");

run("Clear Results");
close();
nf = "C:/images/logs/ect116/ect116_" + DT + ".txt";
f=File.open(nf); 

// High Contrast Data
print(f, "ContrastDiff " + Diff);
print(f, "\n");
print(f, "HRrect1mean " + HRrect1mean);
print(f, "\n");
print(f, "HRrect1SD " + HRrect1SD);
print(f, "\n");
print(f, "HRrect2mean " + HRrect2mean);
print(f, "\n");
print(f, "HRrect2SD " + HRrect2SD);
print(f, "\n");
print(f, "HRrect3mean " + HRrect3mean);
print(f, "\n");
print(f, "HRrect3SD " + HRrect3SD);
print(f, "\n");
print(f, "HRrect4mean " + HRrect4mean);
print(f, "\n");
print(f, "HRrect4SD " + HRrect4SD);
print(f, "\n");
print(f, "HRrect5mean " + HRrect5mean);
print(f, "\n");
print(f, "HRrect5SD " + HRrect5SD);
print(f, "\n");
print(f, "HRrect6mean " + HRrect6mean);
print(f, "\n");
print(f, "HRrect6SD " + HRrect6SD);
print(f, "\n");
print(f, "HRrect7mean " + HRrect7mean);
print(f, "\n");
print(f, "HRrect7SD " + HRrect7SD);
print(f, "\n");
print(f, "HRrect8mean " + HRrect8mean);
print(f, "\n");
print(f, "HRrect8SD " + HRrect8SD);
print(f, "\n");
// Low Contrast Data
print(f, "LCSub1 " + LCSub1);
print(f, "\n");
print(f, "LCSub2 " + LCSub2);
print(f, "\n");
print(f, "LCrect1mean " + LCrect1mean);
print(f, "\n");
print(f, "LCrect1SD " + LCrect1SD);
print(f, "\n");
print(f, "LCrect2mean " + LCrect2mean);
print(f, "\n");
print(f, "LCrect2SD " + LCrect2SD);
print(f, "\n");
print(f, "LCrect3mean " + LCrect3mean);
print(f, "\n");
print(f, "LCrect3SD " + LCrect3SD);
print(f, "\n");
print(f, "LCrect4mean " + LCrect4mean);
print(f, "\n");
print(f, "LCrect4SD " + LCrect4SD);
print(f, "\n");
// Uniformity Data
print(f, "UNrect1mean " + UNrect1mean);
print(f, "\n");
print(f, "UNrect1SD " + UNrect1SD);
print(f, "\n");
print(f, "UNrect2mean " + UNrect2mean);
print(f, "\n");
print(f, "UNrect2SD " + UNrect2SD);
print(f, "\n");
print(f, "UNrect3mean " + UNrect3mean);
print(f, "\n");
print(f, "UNrect3SD " + UNrect3SD);
print(f, "\n");
print(f, "UNrect4mean " + UNrect4mean);
print(f, "\n");
print(f, "UNrect4SD " + UNrect4SD);
print(f, "\n");
print(f, "UNrect5mean " + UNrect5mean);
print(f, "\n");
print(f, "UNrect5SD " + UNrect5SD);
print(f, "\n");
print(f, "UNDiff " + UNDiff);
print(f, "\n");

run("Quit");
