%include "C:\Users\parag\SAS_Project\Final_Project\replace_missing.sas";
%include "C:\Users\parag\SAS_Project\Final_Project\runquit.sas";
%include "C:\Users\parag\SAS_Project\Final_Project\char2fmt.sas";

proc import datafile="C:\Users\parag\SAS_Project\Final_Project\test\census-income.test.csv"
	 replace
     out=census_test
     dbms=csv;
     getnames=yes;
	 guessingrows=32767;
run;

PROC FORMAT;

   VALUE $ACLSWKR '1' = 'Not in universe'
                 '2' = 'Federal government'
				 '3' = 'Local government'
				 '4' = 'Never worked' 
				 '5' = 'Private'
				 '6' = 'Self-employed-incorporated'
				 '7' = 'Self-employed-not incorporated'
				 '8' = 'State government'
				 '9' = 'Without pay';

   VALUE $AHGA 	 '1' = 'Children'
                 '2' = '7th and 8th grade'
                 '3' = '9th grade'
                 '4' = '10th grade'
				 '5' = 'High school graduate'
				 '6' = '11th grade'
				 '7'  = '12th grade no diploma'
				 '8' = '5th or 6th grade'
				 '9' = 'Less than 1st grade'
				 '10' = 'Bachelors degree(BA AB BS)'
				 '11' = '1st 2nd 3rd or 4th grade'
				 '12' = 'Some college but no degree'
				 '13' = 'Masters degree(MA MS MEng MEd MSW MBA)'
				 '14' = 'Associates degree-occup /vocational'
				 '15' = 'Associates degree-academic program'
				 '16' = 'Doctorate degree(PhD EdD)'
				 '17' = 'Prof school degree (MD DDS DVM LLB JD)';

   VALUE $AHSCOL  '1' = 'Not in universe'
                 '2' = 'High school'
                 '3' = 'College or university';

   VALUE $AMARITL '1' = 'Never married'
                  '2' = 'Married-civilian spouse present'
                  '3' = 'Married-spouse absent'
                  '4' = 'Separated'
				  '5' = 'Divorced'
				  '6' = 'Widowed'
				  '7' = 'Married-A F spouse present';

   VALUE $AMJIND 	 '1' = 'Not in universe or children'
                 '2' = 'Entertainment'
                 '3' = 'Social services'
                 '4' = 'Agriculture'
				 '5' = 'Education'
				 '6' = 'Public administration'
				 '7' = 'Manufacturing-durable goods'
				 '8' = 'Manufacturing-nondurable goods'
				 '9' = 'Wholesale trade'
				 '10' = 'Retail trade'
				 '11' = 'Finance insurance and real estate'
				 '12' = 'Private household services'
				 '13' = 'Business and repair services'
				 '14' = 'Personal services except private HH'
				 '16' = 'Construction'
				 '17' = 'Medical except hospital'
				 '18' = 'Other professional services'
				 '19' = 'Transportation'
				 '20' = 'Utilities and sanitary services'
				 '21' = 'Mining'
				 '22' = 'Communications'
				 '23' = 'Hospital services'
				 '24' = 'Forestry and fisheries'
				 '25' = 'Armed Forces';

VALUE $AMJOCC 	 '1' = 'Not in universe'
                 '2' = 'Professional specialty'
                 '3' = 'Other service'
                 '4' = 'Farming forestry and fishing'
				 '5' = 'Sales'
				 '6' = 'Adm support including clerical'
				 '7' = 'Protective services'
				 '8' = 'Handlers equip cleaners etc'
				 '9' = 'Precision production craft & repair'
				 '10' = 'Technicians and related support'
				 '11' = 'Machine operators assmblrs & inspctrs'
				 '12' = 'Transportation and material moving'
				 '13' = 'Executive admin and managerial'
				 '14' = 'Private household services'
				 '16' = 'Armed Forces';

VALUE $ARACE 	 '1' = 'White'
                 '2' = 'Black'
                 '3' = 'Other'
                 '4' = 'Amer Indian Aleut or Eskimo'
				 '5' = 'Asian or Pacific Islander';
				 
VALUE $AREORGN 	 '1' = 'Mexican (Mexicano)'
                 '2' = 'Mexican-American'
                 '3' = 'Puerto Rican'
                 '4' = 'Central or South American'
				 '5' = 'All other'
				 '6' = 'Other Spanish'
				 '7' = 'Chicano'
				 '8' = 'Cuban'
				 '9' = 'Do not know'
				 '10' = 'NA';

VALUE $ASEX 	 '1' = 'Female'
                 '2' = 'Male';

VALUE $AUNMEM 	 '1' = 'Not in universe'
                 '2' = 'No'
                 '3' = 'Yes';

VALUE $AUNTYPE 	 '1' = 'Not in universe'
                 '2' = 'Re-entrant'
                 '3' = 'Job loser - on layoff'
                 '4' = 'New entrant'
				 '5' = 'Job leaver'
				 '6' = 'Other job loser';

VALUE $AWKSTAT 	 '1' = 'Children or Armed Forces'
                 '2' = 'Full-time schedules'
                 '3' = 'Unemployed part- time'
                 '4' = 'Not in labor force'
				 '5' = 'Unemployed full-time'
				 '6' = 'PT for non-econ reasons usually FT'
				 '7' = 'PT for econ reasons usually PT'
				 '8' = 'PT for econ reasons usually FT';

VALUE $FILESTAT  '1' = 'Nonfiler'
                 '2' = 'Joint one under 65 & one 65+'
                 '3' = 'Joint both under 65'
                 '4' = 'Single'
				 '5' = 'Head of household'
				 '6' = 'Joint both 65+';

VALUE $GRINREG 	 '1' = 'Not in universe'
                 '2' = 'South'
                 '3' = 'Northeast'
                 '4' = 'West'
				 '5' = 'Midwest'
				 '6' = 'Abroad';

VALUE $GRINST  	'1'  = 'Not in universe'
				'2'  = 'Utah'
				'3'  = 'Michigan'
				'4'  = 'North Carolina'
				'5'  = 'North Dakota'
				'6'  = 'Virginia'
				'7'  = 'Vermont'
				'8'  = 'Wyoming'
				'9'  = 'West Virginia'
				'10'  = 'Pennsylvania'
				'11'  = 'Abroad'
				'12'  = 'Oregon'
				'13'  = 'California'
				'14'  = 'Iowa'
				'15'  = 'Florida'
				'16'  = 'Arkansas'
				'17'  = 'Texas'
				'18'  = 'South Carolina'
				'19'  = 'Arizona'
				'20'  = 'Indiana'
				'21'  = 'Tennessee'
				'22'  = 'Maine'
				'23'  = 'Alaska'
				'24'  = 'Ohio'
				'25'  = 'Montana'
				'26'  = 'Nebraska'
				'27'  = 'Mississippi'
				'28'  = 'District of Columbia'
				'29'  = 'Minnesota'
				'30'  = 'Illinois'
				'31'  = 'Kentucky'
				'32'  = 'Delaware'
				'33'  = 'Colorado'
				'34'  = 'Maryland'
				'35'  = 'Wisconsin'
				'36'  = 'New Hampshire'
				'37'  = 'Nevada'
				'38'  = 'New York'
				'39'  = 'Georgia'
				'40'  = 'Oklahoma'
				'41'  = 'New Mexico'
				'42'  = 'South Dakota'
				'43'  = 'Missouri'
				'44'  = 'Kansas'
				'45'  = 'Connecticut'
				'46'  = 'Louisiana'
				'47'  = 'Alabama'
				'48'  = 'Massachusetts'
				'49'  = 'Idaho'
				'50'  = 'New Jersey';

VALUE $HHDFMX 	'1' = 'Child <18 never marr not in subfamily' 
			  	'2' = 'Other Rel <18 never marr child of subfamily RP' 
				'3' = 'Other Rel <18 never marr not in subfamily' 
				'4' = 'Grandchild <18 never marr child of subfamily RP' 
				'5' = 'Grandchild <18 never marr not in subfamily' 
				'6' = 'Secondary individual'
				'7' = 'Child under 18 of RP of unrel subfamily' 
				'8' = 'RP of unrelated subfamily' 
				'9' = 'Spouse of householder' 
				'10' = 'Householder' 
				'11' = 'Other Rel <18 never married RP of subfamily' 
				'12' = 'Grandchild <18 never marr RP of subfamily' 
				'13' = 'Child <18 never marr RP of subfamily' 
				'14' = 'Child <18 ever marr not in subfamily' 
				'15' = 'Other Rel <18 ever marr RP of subfamily' 
				'16' = 'Child <18 ever marr RP of subfamily' 
				'17' = 'Nonfamily householder' 
				'18' = 'Child <18 spouse of subfamily RP' 
				'19' = 'Other Rel <18 spouse of subfamily RP' 
				'20' = 'Other Rel <18 ever marr not in subfamily' 
				'21' = 'Grandchild <18 ever marr not in subfamily' 
				'22' = 'Child 18+ never marr Not in a subfamily' 
				'23' = 'Grandchild 18+ never marr not in subfamily' 
				'24' = 'Child 18+ ever marr RP of subfamily' 
				'25' = 'Other Rel 18+ never marr not in subfamily' 
				'26' = 'Child 18+ never marr RP of subfamily' 
				'27' = 'Other Rel 18+ ever marr RP of subfamily' 
				'28' = 'Other Rel 18+ never marr RP of subfamily' 
				'29' = 'Other Rel 18+ spouse of subfamily RP'
				'30' = 'Other Rel 18+ ever marr not in subfamily' 
				'31' = 'Child 18+ ever marr Not in a subfamily' 
				'32' = 'Grandchild 18+ ever marr not in subfamily' 
				'33' = 'Child 18+ spouse of subfamily RP' 
				'34' = 'Spouse of RP of unrelated subfamily' 
				'35' = 'Grandchild 18+ ever marr RP of subfamily' 
				'36' = 'Grandchild 18+ never marr RP of subfamily' 
				'37' = 'Grandchild 18+ spouse of subfamily RP'
				'38' = 'In group quarters' ;

VALUE $HHDREL 	 '1' = 'Child under 18 never married'
                 '2' = 'Other relative of householder'
                 '3' = 'Nonrelative of householder'
				 '4' = 'Spouse of householder'
                 '5' = 'Householder'
				 '7' = 'Child under 18 ever married'
				 '8' = 'Group Quarters- Secondary individual'
				 '9' = 'Child 18 or older';

VALUE $MIGMTRa 	 '1' = 'Not in universe'
                 '2' = 'Nonmover'
                 '3' = 'MSA to MSA'
				 '4' = 'NonMSA to nonMSA'
				 '5' = 'MSA to nonMSA'
				 '6' = 'NonMSA to MSA'
				 '7' = 'Abroad to MSA'
				 '8' = 'Not identifiable'
				 '9' = 'Abroad to nonMSA';

VALUE $MIGMTRb 	 '1' = 'Not in universe'
                 '2' = 'Nonmover'
                 '3' = 'Same county'
                 '4' = 'Different county same state'
				 '5' = 'Different state same division'
				 '6' = 'Abroad'
				 '7' = 'Different region'
				 '8' = 'Different division same region';

VALUE $MIGMTRc 	 '1' = 'Not in universe'
                 '2' = 'Nonmover'
                 '3' = 'Same county'
                 '4' = 'Different county same state'
				 '5' = 'Different state in West'
				 '6' = 'Abroad'
				 '7' = 'Different state in Midwest'
				 '8' = 'Different state in South'
				 '9' = 'Different state in Northeast';

VALUE $MIGSAME 	 '1' = 'Not in universe under 1 year old'
                 '2' = 'Yes'
                 '3' = 'No';

VALUE $MIGSUN 	 '1' = 'Not in universe'
                 '2' = 'Yes'
                 '3' = 'No';

VALUE $PARENT 	 '1' = 'Not in universe'
                 '2' = 'Both parents present'
                 '3' = 'Neither parent present'
                 '4' = 'Mother only present'
				 '5' = 'Father only present';

VALUE $PEFNTVTY	'1' = 'Mexico' 
				'2' = 'United-States' 
				'3' = 'Puerto-Rico' 
				'4' = 'Dominican-Republic' 
				'5' = 'Jamaica' 
				'6' = 'Cuba' 
				'7' = 'Portugal' 
				'8' = 'Nicaragua' 
				'9' = 'Peru' 
				'10' = 'Ecuador' 
				'11' = 'Guatemala' 
				'12' = 'Philippines' 
				'13' = 'Canada' 
				'14' = 'Columbia' 
				'15' = 'El-Salvador' 
				'16' = 'Japan' 
				'17' = 'England' 
				'18' = 'Trinadad&Tobago' 
				'19' = 'Honduras' 
				'20' = 'Germany' 
				'21' = 'Taiwan'
				'22' = 'Outlying-U S (Guam USVI etc)' 
				'23' = 'India' 
				'24' = 'Vietnam' 
				'25' = 'China' 
				'26' = 'Hong Kong' 
				'27' = 'Cambodia' 
				'28' = 'France' 
				'29' = 'Laos' 
				'30' = 'Haiti' 
				'31' = 'South Korea' 
				'32' = 'Iran' 
				'33' = 'Greece' 
				'34' = 'Italy' 
				'35' = 'Poland' 
				'36' = 'Thailand' 
				'37' = 'Yugoslavia' 
				'38' = 'Holand-Netherlands' 
				'39' = 'Ireland' 
				'40' = 'Scotland' 
				'41' = 'Hungary' 
				'42' = 'Panama';

VALUE $PEMNTVTY '1' = 'India' 
				'2' = 'Mexico' 
				'3' = 'United-States' 
				'4' = 'Puerto-Rico' 
				'5' = 'Dominican-Republic' 
				'6' = 'England' 
				'7' = 'Honduras' 
				'8' = 'Peru' 
				'9' = 'Guatemala'
				'10' = 'Columbia' 
				'11' = 'El-Salvador' 
				'12' = 'Philippines' 
				'13' = 'France' 
				'14' = 'Ecuador' 
				'15' = 'Nicaragua' 
				'16' = 'Cuba' 
				'17' = 'Outlying-U S (Guam USVI etc)' 
				'18' = 'Jamaica' 
				'19' = 'South Korea' 
				'20' = 'China' 
				'21' = 'Germany' 
				'22' = 'Yugoslavia' 
				'23' = 'Canada' 
				'24' = 'Vietnam' 
				'25' = 'Japan' 
				'26' = 'Cambodia' 
				'27' = 'Ireland' 
				'28' = 'Laos' 
				'29' = 'Haiti' 
				'30' = 'Portugal' 
				'31' = 'Taiwan' 
				'32' = 'Holand-Netherlands' 
				'33' = 'Greece' 
				'34' = 'Italy' 
				'35' = 'Poland' 
				'36' = 'Thailand'
				'37' = 'Trinadad&Tobago'
				'38' = 'Hungary' 
				'39' = 'Panama' 
				'40' = 'Hong Kong' 
				'41' = 'Scotland' 
				'42' = 'Iran';	 

VALUE $PENATVTY '1' = 'United-States' 
				'2' = 'Mexico'  
				'3' = 'Puerto-Rico'
				'4' = 'Peru'
				'5' = 'Canada'
				'6' = 'South Korea'
				'7' = 'India'
				'8' = 'Japan' 
				'9' = 'Haiti' 
				'10' = 'El-Salvador'
				'11' = 'Dominican-Republic'
				'12' = 'Portugal'
				'13' = 'Columbia' 
				'14' = 'England' 
				'15' = 'Thailand'
				'16' = 'Cuba'
				'17' = 'Laos'
				'18' = 'Panama'
				'19' = 'China' 
				'20' = 'Germany'
				'21' = 'Vietnam' 
				'22' = 'Italy'
				'23' = 'Honduras'
				'24' = 'Outlying-U S (Guam USVI etc)'
				'25' = 'Hungary'
				'26' = 'Philippines'
				'27' = 'Poland'
				'28' = 'Ecuador'
				'29' = 'Iran'
				'30' = 'Guatemala'
				'31' = 'Holand-Netherlands'
				'32' = 'Taiwan'
				'33' = 'Nicaragua'
				'34' = 'France'
				'35' = 'Jamaica'
				'36' = 'Scotland'
				'37' = 'Yugoslavia'
				'38' = 'Hong Kong' 
				'39' = 'Trinadad&Tobago'
				'40' = 'Greece'
				'41' = 'Cambodia'
				'42' = 'Ireland';

VALUE $PRCITSHP '1' = 'Native- Born in the United States'
				'2' = 'Foreign born- Not a citizen of U S '
				'3' = 'Native- Born in Puerto Rico or U S Outlying'
				'4' = 'Native- Born abroad of American Parent(s)'
				'5' = 'Foreign born- U S citizen by naturalization';

VALUE $VETQVA 	'1' = 'Not in universe'
				'2' = 'YES'
				'3' = 'NO';

VALUE $INCOME	1 = '>50000'
				0 = '<50000';

RUN;

DATA census_test;
SET census_test;
LABEL    AAGE   	= "AGE"
         ACLSWKR 	= "Class of Worker"
         ADTIND 	= "Industry Code"
         ADTOCC     = "Occupation Code"
         AHGA    	= "Education"
		 AHRSPAY   	= "Wage per Hour"
         AHSCOL		= "Enrolled in Edu Inst."
         AMARITL	= "Martial Status"
         AMJIND		= "Major Industry Code"
         AMJOCC		= "Major Occupation Code"
		 ARACE		= "Race"
         AREORGN	= "hispanic Origin"
         ASEX		= "Sex"
         AUNMEM		= "Member of labor union"
		 AUNTYPE	= "Reason of unemployment"
		 AWKSTAT	= "Full/Part time"
		 CAPGAIN	= "Capital Gain"
		 CAPLOSS	= "Capital Loss"
		 DIVVAL		= "Dividend from Stocks"
		 FILESTAT	= "Tax filer Status"
		 GRINREG	= "Region of Residence"
		 GRINST		= "State of Residence"
		 HHDFMX		= "Household/family status"
		 HHDREL		= "Household summary"
		 MARSUPWT	= "Instance weight"
		 MIGMTR1	= "Migration code-change (MSA)"
		 MIGMTR3	= "Migration code-change (Region)"
		 MIGMTR4	= "Migration code-move (Region)"
		 MIGSAME	= "Lived in household last year"
		 MIGSUN		= "Migration Prev. Res. in Sunbelt"
		 NOEMP		= "Number of employee/employer"
		 PARENT		= "Family Members Under 18"
		 PEFNTVTY	= "Country of Birth Father"
		 PEMNTVTY	= "Country of Birth Mother"
		 PENATVTY	= "Country of Birth self"
		 PRCITSHP	= "Citizenship"
		 SEOTR		= "Owner/Self-Employed"
		 VETQVA		= "Fill Questionnaire for Veteran's Admin"
		 VETYN		= "Veterans Benefits"
		 WKSWORK	= "Weeks Worked in Year"
		 AGI		= "Adjusted Gross Income (-/+50000)"
		 INCOME		= "INCOME code (0/1)";

IF (AGI eq '50000+.') THEN INCOME = 1;
ELSE IF (AGI eq '-50000') THEN INCOME = 0;    
ELSE INCOME = .;
		 																									
FORMAT 	ACLSWKR    	$ACLSWKR.
		AHGA 		$AHGA.
		AHSCOL 		$AHSCOL.
		AMARITL 	$AMARITL.
		AMJIND 		$AMJIND.
		AMJOCC 		$AMJOCC.
		ARACE 		$ARACE.
		AREORGN 	$AREORGN.
		ASEX 		$ASEX.
		AUNMEM 		$AUNMEM.
		AUNTYPE 	$AUNTYPE.
		AWKSTAT 	$AWKSTAT.
		FILESTAT 	$FILESTAT.
		GRINREG 	$GRINREG.
		GRINST 		$GRINST.
		HHDFMX 		$HHDFMX.
		HHDREL 		$HHDREL.
		MIGMTR1 	$MIGMTRa.
		MIGMTR3 	$MIGMTRb.
		MIGMTR4 	$MIGMTRc.
		MIGSAME 	$MIGSAME.
		MIGSUN 		$MIGSUN.
		PARENT 		$PARENT.
		PEFNTVTY 	$PEFNTVTY.
		PEMNTVTY 	$PEMNTVTY.
		PENATVTY 	$PENATVTY.
		PRCITSHP 	$PRCITSHP.
		VETQVA 		$VETQVA.;

IF STRIP (ACLSWKR) eq '.' THEN ACLSWKR='';
IF STRIP (AHSCOL) eq '.' THEN AHSCOL='';
IF STRIP (AMJOCC) eq '.' THEN AMJOCC='';
IF STRIP (AUNMEM) eq '.' THEN AUNMEM='';
IF STRIP (AUNTYPE) eq '.' THEN AUNTYPE='';
IF STRIP (GRINREG) eq '.' THEN GRINREG='';
IF STRIP (GRINST) eq '.' THEN GRINST='';
IF STRIP (MIGMTR1) eq '.' THEN MIGMTR1='';
IF STRIP (MIGMTR3) eq '.' THEN MIGMTR3='';
IF STRIP (MIGMTR4) eq '.' THEN MIGMTR4='';
IF STRIP (MIGSUN) eq '.' THEN MIGSUN='';
IF STRIP (PARENT) eq '.' THEN PARENT='';
IF STRIP (VETQVA) eq '.' THEN VETQVA='';
IF STRIP (AMJIND) eq '.' THEN AMJIND='';
IF STRIP (MIGSAME) eq '.' THEN MIGSAME='';

IF STRIP (ARACE) eq '.' THEN ARACE='';
IF STRIP (ASEX) eq '.' THEN ASEX='';
IF STRIP (AWKSTAT) eq '.' THEN AWKSTAT='';
IF STRIP (FILESTAT) eq '.' THEN FILESTAT='';
IF STRIP (HHDFMX) eq '.' THEN HHDFMX='';
IF STRIP (HHDREL) eq '.' THEN HHDREL='';
IF STRIP (PARENT) eq '.' THEN PARENT='';
IF STRIP (PEFNTVTY) eq '.' THEN PEFNTVTY='';
IF STRIP (PEMNTVTY) eq '.' THEN PEMNTVTY='';

IF STRIP (PENATVTY) eq '.' THEN PENATVTY='';
IF STRIP (PRCITSHP) eq '.' THEN PRCITSHP='';

IF AHGA eq '7th and 8th grade' OR AHGA eq '9th grade' OR AHGA eq '5th or 6th grade' OR AHGA eq 'Less than 1st grade' OR AHGA eq '1st 2nd 3rd or 4th grade' THEN AHGA_EDU = 2;
ELSE IF AHGA eq 'Children' THEN AHGA_EDU = 1;
ELSE IF AHGA eq '10th grade' OR AHGA eq '11th grade' THEN AHGA_EDU = 3;
ELSE IF AHGA eq '12th grade no diploma' THEN AHGA_EDU = 4;
ELSE IF AHGA eq 'High school graduate' THEN AHGA_EDU = 5;
ELSE IF AHGA eq 'Bachelors degree(BA AB BS)' THEN AHGA_EDU = 6;
ELSE IF AHGA eq 'Some college but no degree' THEN AHGA_EDU = 7;
ELSE IF AHGA eq 'Masters degree(MA MS MEng MEd MSW MBA)' THEN AHGA_EDU = 8;
ELSE IF AHGA eq 'Associates degree-occup /vocational' THEN AHGA_EDU = 9;
ELSE IF AHGA eq 'Associates degree-academic program' THEN AHGA_EDU = 10;
ELSE IF AHGA eq 'Doctorate degree(PhD EdD)' THEN AHGA_EDU = 11;
ELSE IF AHGA eq 'Prof school degree (MD DDS DVM LLB JD)' THEN AHGA_EDU = 12;
ELSE AHGA_EDU=.;

IF ACLSWKR eq 'Local government' OR ACLSWKR eq 'State government' THEN ACLSWKR_N=3;
ELSE IF ACLSWKR eq 'Not in universe' THEN ACLSWKR_N=1;
ELSE IF ACLSWKR eq 'Federal government' THEN ACLSWKR_N=2;
ELSE IF ACLSWKR eq 'Never worked' THEN ACLSWKR_N=4;
ELSE IF ACLSWKR eq 'Private' THEN ACLSWKR_N=5;
ELSE IF ACLSWKR eq 'Self-employed-incorporated' THEN ACLSWKR_N=6;
ELSE IF ACLSWKR eq 'Self-employed-not incorporated' THEN ACLSWKR_N=7;
ELSE IF ACLSWKR eq 'Without pay' THEN ACLSWKR_N=8;
ELSE ACLSWKR_N=.;

IF AMARITL eq 'Married-A F spouse present' THEN AMARITL_N = 2;
ELSE IF AMARITL eq 'Never married' THEN AMARITL_N = 1;
ELSE IF AMARITL eq 'Married-civilian spouse present' THEN AMARITL_N = 2;
ELSE IF AMARITL eq 'Married-spouse absent' THEN AMARITL_N = 3;
ELSE IF AMARITL eq 'Separated' THEN AMARITL_N = 4;
ELSE IF AMARITL eq 'Divorced' THEN AMARITL_N = 5;
ELSE IF AMARITL eq 'Widowed' THEN AMARITL_N = 6;
ELSE AMARITL_N = .;

/*HISPANIC ORIGIN*/
IF AREORGN eq 'NA' OR AREORGN eq 'Do not know' THEN AREORGN_N=9;
ELSE IF AREORGN eq 'Mexican (Mexicano)' THEN AREORGN_N=1;
ELSE IF AREORGN eq 'Mexican-American' THEN AREORGN_N=2;
ELSE IF AREORGN eq 'Puerto Rican' THEN AREORGN_N=3;
ELSE IF AREORGN eq 'Central or South American' THEN AREORGN_N=4;
ELSE IF AREORGN eq 'All other' THEN AREORGN_N=5;
ELSE IF AREORGN eq 'Other Spanish' THEN AREORGN_N=6;
ELSE IF AREORGN eq 'Chicano' THEN AREORGN_N=7;
ELSE IF AREORGN eq 'Cuban' THEN AREORGN_N=8;
ELSE AREORGN_N=.;

IF AMJIND eq 'Not in universe or children' THEN AMJIND_N=1;
ELSE IF AMJIND eq 'Entertainment' THEN AMJIND_N=2;
ELSE IF AMJIND eq 'Social services' THEN AMJIND_N=3;
ELSE IF AMJIND eq 'Agriculture' THEN AMJIND_N=4;
ELSE IF AMJIND eq 'Education' THEN AMJIND_N=5;
ELSE IF AMJIND eq 'Public administration' THEN AMJIND_N=6;
ELSE IF AMJIND eq 'Manufacturing-durable goods' OR AMJIND eq 'Manufacturing-nondurable goods' THEN AMJIND_N=7;
ELSE IF AMJIND eq 'Wholesale trade' OR AMJIND eq 'Retail trade' THEN AMJIND_N=8;
ELSE IF AMJIND eq 'Finance insurance and real estate' THEN AMJIND_N=9;
ELSE IF AMJIND eq 'Private household services' THEN AMJIND_N=10;
ELSE IF AMJIND eq 'Business and repair services' THEN AMJIND_N=11;
ELSE IF AMJIND eq 'Personal services except private HH' THEN AMJIND_N=12;
ELSE IF AMJIND eq 'Construction' THEN AMJIND_N=13;
ELSE IF AMJIND eq 'Medical except hospital' THEN AMJIND_N=14;
ELSE IF AMJIND eq 'Other professional services' THEN AMJIND_N=15;
ELSE IF AMJIND eq 'Transportation' THEN AMJIND_N=16;
ELSE IF AMJIND eq 'Utilities and sanitary services' THEN AMJIND_N=17;
ELSE IF AMJIND eq 'Mining' THEN AMJIND_N=18;
ELSE IF AMJIND eq 'Communications' THEN AMJIND_N=19;
ELSE IF AMJIND eq 'Hospital services' THEN AMJIND_N=20;
ELSE IF AMJIND eq 'Mexican-American' THEN AMJIND_N=21;
ELSE IF AMJIND eq 'Forestry and fisheries' THEN AMJIND_N=22;
ELSE IF AMJIND eq 'Armed Forces' THEN AMJIND_N=23;
ELSE AMJIND_N=.;

RUN;


Ods graphics on;
Ods rtf file = 'census.rtf';

options nospool;
/*
HHDFMX FILESTAT HHDREL ASEX AWKSTAT PARENT
HHDFMX NOEMP FILESTAT HHDREL AMARITL_N ASEX AWKSTAT PARENT VETYN AHRSPAY
*/

/*All numeric chi-sq ranking*/
PROC LOGISTIC  data= census_test OUTEST=estimates_chisq DESCENDING;  /*this is the main initial model */
	TITLE 'Model on test data';
	  CLASS AMJOCC HHDFMX ASEX FILESTAT ARACE AHSCOL MIGMTR1 GRINST AUNMEM;
      MODEL  INCOME = AMJOCC HHDFMX ASEX FILESTAT ARACE AHSCOL MIGMTR1 GRINST AUNMEM DIVVAL AHGA_EDU CAPGAIN WKSWORK CAPLOSS AAGE NOEMP ADTOCC ACLSWKR_N AREORGN_N AMJIND_N ADTIND AMARITL_N VETYN /
	  MAXITER=200
Ctable pprob = ( 0 to 0.2 by 0.05)
Lackfit
details
Risklimits
OUTROC=ROC_chisq_test;
Run;

PROC GPLOT DATA=ROC_chisq_test;
   TITLE 'ROC Curve chi-sq with order=data';
   PLOT _SENSIT_ * _1MSPEC_ = 'o';
   LABEL _SENSIT_ = 'Sensitivity'
         _1MSPEC_ = '1 - Specificity';
RUN;

Ods graphics off;
Ods rtf close;
Run; 
