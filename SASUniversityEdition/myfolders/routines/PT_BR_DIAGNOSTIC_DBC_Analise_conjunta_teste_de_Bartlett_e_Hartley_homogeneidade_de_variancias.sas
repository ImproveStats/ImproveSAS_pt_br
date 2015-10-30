*========================================================================================
*OBJECTIVE:	>To Perform Bartlett variance homogeneity test to Multi-Environmental Trial (MET)
			>You must have at least 2 factors in your dataset to run this routine. e.g. 
			GENOTYPES and ENVIRONMENT

			Objective of Bartlett and Hartley test:
			.Detect heterogeneity in variances of genotypes tested in Multi-Environmental Trial (MET)
				
*AUTHOR: Alysson Jalles da Silva

*EMAIL: jalles10@gmail.com

*DATE: 16/04/2015

*REQUIRES: SAS 9.4 or SAS University Edition

*VERSION: 16/04/2015 - 1.0  - Pilot Project
		  17/04/2015 - 1.01 - Added Hartley test
		  25/10/2015 - 1.02 - Added more comments to ease the user life!
========================================================================================;


/*Example: MET with 2 SEASONS, 6 ENVIRONMENTS, 10 GENOTYPES and 4 BLOCKS to YIELD */
/* 			and 	2 SEASONS, 5 ENVIRONMENTS, 10 GENOTYPES and 4 BLOCKS to VAR2 */
data GENERAL_DATA;
input 
SEASON ENVIRONMENT GENOTYPE BLOCK YIELD VAR2;
cards;
1	1	1	1	464.2	9
1	1	2	1	570.8	9
1	1	3	1	556.7	9
1	1	4	1	520.0	10
1	1	5	1	706.7	9
1	1	6	1	599.2	10
1	1	7	1	806.7	10
1	1	8	1	509.2	10
1	1	9	1	564.2	10
1	1	10	1	520.0	10
1	1	1	2	395.0	9
1	1	2	2	555.8	10
1	1	3	2	450.8	9
1	1	4	2	656.7	9
1	1	5	2	531.7	9
1	1	6	2	495.0	9
1	1	7	2	480.8	9
1	1	8	2	434.2	10
1	1	9	2	623.3	9
1	1	10	2	497.5	9
1	1	1	3	404.2	10
1	1	2	3	573.3	9
1	1	3	3	629.0	9
1	1	4	3	619.0	10
1	1	5	3	623.3	10
1	1	6	3	622.5	9
1	1	7	3	495.8	9
1	1	8	3	398.3	10
1	1	9	3	519.2	10
1	1	10	3	431.0	9
1	1	1	4	408.3	9
1	1	2	4	433.3	10
1	1	3	4	533.3	10
1	1	4	4	707.5	10
1	1	5	4	434.2	10
1	1	6	4	380.8	9
1	1	7	4	530.8	9
1	1	8	4	413.3	10
1	1	9	4	443.3	9
1	1	10	4	415.8	10
2	1	1	1	217.5	9
2	1	2	1	265.8	10
2	1	3	1	144.2	9
2	1	4	1	197.5	9
2	1	5	1	221.7	9
2	1	6	1	192.5	10
2	1	7	1	220.8	9
2	1	8	1	222.5	9
2	1	9	1	271.7	9
2	1	10	1	232.5	9
2	1	1	2	212.5	9
2	1	2	2	154.2	9
2	1	3	2	220.8	10
2	1	4	2	233.3	10
2	1	5	2	152.5	9
2	1	6	2	185.8	10
2	1	7	2	232.5	9
2	1	8	2	219.2	9
2	1	9	2	192.5	9
2	1	10	2	200.0	9
2	1	1	3	221.7	9
2	1	2	3	245.8	9
2	1	3	3	214.2	10
2	1	4	3	180.8	9
2	1	5	3	240.0	10
2	1	6	3	241.7	9
2	1	7	3	240.8	9
2	1	8	3	325.0	10
2	1	9	3	251.7	9
2	1	10	3	223.3	9
2	1	1	4	180.8	10
2	1	2	4	195.8	9
2	1	3	4	179.2	9
2	1	4	4	219.2	10
2	1	5	4	213.3	9
2	1	6	4	206.7	10
2	1	7	4	180.0	10
2	1	8	4	179.2	10
2	1	9	4	228.3	10
2	1	10	4	184.2	10
1	2	1	1	520.0	9
1	2	2	1	420.8	9
1	2	3	1	464.2	10
1	2	4	1	516.7	9
1	2	5	1	549.2	10
1	2	6	1	464.2	9
1	2	7	1	480.0	9
1	2	8	1	368.3	10
1	2	9	1	456.7	9
1	2	10	1	541.7	10
1	2	1	2	490.0	9
1	2	2	2	364.2	9
1	2	3	2	503.3	10
1	2	4	2	529.2	9
1	2	5	2	565.0	10
1	2	6	2	545.0	9
1	2	7	2	505.0	9
1	2	8	2	467.5	10
1	2	9	2	507.5	9
1	2	10	2	395.8	10
1	2	1	3	452.5	10
1	2	2	3	359.2	9
1	2	3	3	511.7	10
1	2	4	3	524.2	10
1	2	5	3	455.8	9
1	2	6	3	609.2	9
1	2	7	3	552.5	9
1	2	8	3	450.0	10
1	2	9	3	538.3	9
1	2	10	3	556.7	9
1	2	1	4	390.0	10
1	2	2	4	399.2	10
1	2	3	4	560.8	9
1	2	4	4	585.3	10
1	2	5	4	535.8	9
1	2	6	4	447.5	9
1	2	7	4	444.2	9
1	2	8	4	365.0	10
1	2	9	4	455.0	9
1	2	10	4	426.7	9
2	2	1	1	236.7	10
2	2	2	1	222.5	9
2	2	3	1	329.2	10
2	2	4	1	248.3	10
2	2	5	1	241.7	10
2	2	6	1	168.3	9
2	2	7	1	157.5	10
2	2	8	1	165.0	9
2	2	9	1	205.8	9
2	2	10	1	137.5	9
2	2	1	2	294.2	10
2	2	2	2	333.3	10
2	2	3	2	261.7	9
2	2	4	2	285.8	10
2	2	5	2	254.2	10
2	2	6	2	367.5	9
2	2	7	2	226.7	10
2	2	8	2	189.2	10
2	2	9	2	207.5	9
2	2	10	2	131.7	9
2	2	1	3	193.3	10
2	2	2	3	255.8	10
2	2	3	3	263.3	9
2	2	4	3	177.5	9
2	2	5	3	286.7	9
2	2	6	3	201.7	10
2	2	7	3	170.0	10
2	2	8	3	189.2	10
2	2	9	3	188.3	9
2	2	10	3	221.7	10
2	2	1	4	187.5	10
2	2	2	4	164.2	10
2	2	3	4	290.0	10
2	2	4	4	335.8	10
2	2	5	4	312.5	10
2	2	6	4	224.2	10
2	2	7	4	177.5	10
2	2	8	4	269.2	9
2	2	9	4	290.8	9
2	2	10	4	240.8	9
1	3	1	1	251.7	9
1	3	2	1	279.2	10
1	3	3	1	310.8	10
1	3	4	1	256.7	10
1	3	5	1	314.2	10
1	3	6	1	369.2	10
1	3	7	1	311.7	10
1	3	8	1	259.3	10
1	3	9	1	362.5	9
1	3	10	1	264.7	10
1	3	1	2	285.0	9
1	3	2	2	226.7	9
1	3	3	2	279.2	10
1	3	4	2	237.5	10
1	3	5	2	206.7	9
1	3	6	2	323.3	10
1	3	7	2	264.2	10
1	3	8	2	213.3	10
1	3	9	2	331.7	9
1	3	10	2	246.7	10
1	3	1	3	234.2	10
1	3	2	3	238.3	9
1	3	3	3	273.3	9
1	3	4	3	265.8	10
1	3	5	3	293.3	10
1	3	6	3	250.0	10
1	3	7	3	236.7	10
1	3	8	3	225.0	9
1	3	9	3	274.2	9
1	3	10	3	230.0	10
1	3	1	4	219.2	9
1	3	2	4	200.0	10
1	3	3	4	249.2	9
1	3	4	4	196.7	9
1	3	5	4	237.5	9
1	3	6	4	226.7	9
1	3	7	4	195.8	9
1	3	8	4	235.0	9
1	3	9	4	247.5	9
1	3	10	4	218.3	9
2	3	1	1	75.8	10
2	3	2	1	125.0	10
2	3	3	1	105.8	10
2	3	4	1	120.0	10
2	3	5	1	103.3	9
2	3	6	1	127.5	9
2	3	7	1	110.8	10
2	3	8	1	100.8	9
2	3	9	1	124.2	10
2	3	10	1	83.3	9
2	3	1	2	78.3	10
2	3	2	2	95.0	10
2	3	3	2	89.2	9
2	3	4	2	89.2	10
2	3	5	2	91.7	9
2	3	6	2	91.7	9
2	3	7	2	114.2	10
2	3	8	2	104.2	10
2	3	9	2	101.7	9
2	3	10	2	73.3	9
2	3	1	3	65.0	9
2	3	2	3	125.0	9
2	3	3	3	95.8	9
2	3	4	3	89.2	9
2	3	5	3	75.8	9
2	3	6	3	105.8	10
2	3	7	3	98.3	10
2	3	8	3	95.0	9
2	3	9	3	89.2	9
2	3	10	3	75.8	10
2	3	1	4	80.8	9
2	3	2	4	110.0	9
2	3	3	4	83.3	10
2	3	4	4	85.8	10
2	3	5	4	85.8	10
2	3	6	4	90.8	10
2	3	7	4	78.3	10
2	3	8	4	81.7	10
2	3	9	4	88.3	10
2	3	10	4	64.2	9
1	4	1	1	428.3	10
1	4	2	1	340.8	9
1	4	3	1	423.3	9
1	4	4	1	384.2	10
1	4	5	1	381.7	10
1	4	6	1	427.5	10
1	4	7	1	334.2	9
1	4	8	1	287.5	10
1	4	9	1	422.5	9
1	4	10	1	410.0	9
1	4	1	2	400.8	10
1	4	2	2	340.8	10
1	4	3	2	430.0	9
1	4	4	2	357.5	10
1	4	5	2	392.5	10
1	4	6	2	410.0	10
1	4	7	2	357.5	10
1	4	8	2	302.7	10
1	4	9	2	457.5	9
1	4	10	2	406.7	10
1	4	1	3	350.0	10
1	4	2	3	290.0	10
1	4	3	3	444.2	10
1	4	4	3	413.3	10
1	4	5	3	346.7	10
1	4	6	3	400.8	9
1	4	7	3	418.3	9
1	4	8	3	259.2	9
1	4	9	3	489.2	10
1	4	10	3	392.5	10
1	4	1	4	331.7	10
1	4	2	4	280.0	10
1	4	3	4	367.5	9
1	4	4	4	343.3	10
1	4	5	4	345.0	10
1	4	6	4	420.0	10
1	4	7	4	348.3	10
1	4	8	4	259.2	9
1	4	9	4	425.0	9
1	4	10	4	363.3	9
2	4	1	1	160.8	10
2	4	2	1	163.3	10
2	4	3	1	156.7	9
2	4	4	1	143.3	10
2	4	5	1	182.5	9
2	4	6	1	167.5	9
2	4	7	1	100.0	9
2	4	8	1	180.8	9
2	4	9	1	115.8	9
2	4	10	1	171.7	9
2	4	1	2	155.0	10
2	4	2	2	169.2	9
2	4	3	2	156.7	9
2	4	4	2	144.2	9
2	4	5	2	133.3	9
2	4	6	2	145.8	10
2	4	7	2	208.2	10
2	4	8	2	151.7	10
2	4	9	2	201.7	10
2	4	10	2	163.3	9
2	4	1	3	175.0	9
2	4	2	3	194.2	9
2	4	3	3	165.8	9
2	4	4	3	203.3	10
2	4	5	3	169.2	10
2	4	6	3	214.2	10
2	4	7	3	170.0	9
2	4	8	3	195.8	9
2	4	9	3	192.5	10
2	4	10	3	170.0	9
2	4	1	4	198.3	9
2	4	2	4	159.2	10
2	4	3	4	147.5	9
2	4	4	4	187.5	9
2	4	5	4	161.7	9
2	4	6	4	186.0	10
2	4	7	4	195.0	10
2	4	8	4	175.0	9
2	4	9	4	178.3	10
2	4	10	4	193.3	10
1	5	1	1	353.3	9
1	5	2	1	426.7	10
1	5	3	1	434.2	9
1	5	4	1	362.5	9
1	5	5	1	418.3	9
1	5	6	1	472.5	10
1	5	7	1	321.7	9
1	5	8	1	330.0	9
1	5	9	1	345.8	10
1	5	10	1	390.0	10
1	5	1	2	338.3	10
1	5	2	2	376.7	9
1	5	3	2	416.7	10
1	5	4	2	357.5	9
1	5	5	2	396.7	10
1	5	6	2	360.8	9
1	5	7	2	398.3	10
1	5	8	2	324.2	9
1	5	9	2	378.3	10
1	5	10	2	435.0	10
1	5	1	3	383.3	10
1	5	2	3	414.2	10
1	5	3	3	447.5	10
1	5	4	3	375.8	10
1	5	5	3	395.8	10
1	5	6	3	485.0	9
1	5	7	3	499.2	10
1	5	8	3	335.0	9
1	5	9	3	414.2	9
1	5	10	3	429.2	10
1	5	1	4	332.5	9
1	5	2	4	351.7	10
1	5	3	4	462.5	9
1	5	4	4	395.8	10
1	5	5	4	419.2	9
1	5	6	4	395.8	9
1	5	7	4	390.0	10
1	5	8	4	336.7	10
1	5	9	4	395.8	10
1	5	10	4	399.2	10
2	5	1	1	180.0	10
2	5	2	1	195.0	9
2	5	3	1	167.5	9
2	5	4	1	221.7	9
2	5	5	1	114.2	10
2	5	6	1	163.3	10
2	5	7	1	233.3	9
2	5	8	1	213.3	10
2	5	9	1	106.7	9
2	5	10	1	144.2	10
2	5	1	2	206.7	10
2	5	2	2	249.2	9
2	5	3	2	145.8	9
2	5	4	2	142.5	9
2	5	5	2	139.2	10
2	5	6	2	121.7	10
2	5	7	2	223.3	9
2	5	8	2	167.5	9
2	5	9	2	155.0	10
2	5	10	2	245.0	10
2	5	1	3	155.8	10
2	5	2	3	136.7	10
2	5	3	3	175.8	10
2	5	4	3	160.0	10
2	5	5	3	159.2	10
2	5	6	3	105.0	9
2	5	7	3	185.8	9
2	5	8	3	230.0	10
2	5	9	3	190.0	10
2	5	10	3	194.2	9
2	5	1	4	181.7	9
2	5	2	4	150.8	9
2	5	3	4	127.5	9
2	5	4	4	202.5	9
2	5	5	4	97.5	9
2	5	6	4	135.8	10
2	5	7	4	206.7	9
2	5	8	4	215.8	10
2	5	9	4	153.3	10
2	5	10	4	204.2	10
1	6	1	1	278.3	10
1	6	2	1	355.0	9
1	6	3	1	239.2	9
1	6	4	1	279.0	10
1	6	5	1	285.8	10
1	6	6	1	245.0	10
1	6	7	1	246.7	9
1	6	8	1	222.5	9
1	6	9	1	215.0	9
1	6	10	1	313.3	10
1	6	1	2	191.7	10
1	6	2	2	288.3	9
1	6	3	2	240.8	10
1	6	4	2	240.0	9
1	6	5	2	414.2	9
1	6	6	2	370.8	10
1	6	7	2	269.2	10
1	6	8	2	233.3	9
1	6	9	2	206.7	9
1	6	10	2	401.7	10
1	6	1	3	251.7	10
1	6	2	3	188.3	9
1	6	3	3	269.2	10
1	6	4	3	312.5	9
1	6	5	3	292.5	10
1	6	6	3	265.0	10
1	6	7	3	309.2	9
1	6	8	3	180.0	9
1	6	9	3	300.8	9
1	6	10	3	245.0	9
1	6	1	4	126.7	9
1	6	2	4	118.8	9
1	6	3	4	295.0	10
1	6	4	4	336.7	10
1	6	5	4	195.8	10
1	6	6	4	339.2	10
1	6	7	4	150.0	10
1	6	8	4	225.0	10
1	6	9	4	186.7	10
1	6	10	4	198.3	9
2	6	1	1	67.5	.
2	6	2	1	85.0	.
2	6	3	1	65.0	.
2	6	4	1	129.0	.
2	6	5	1	75.0	.
2	6	6	1	.	.
2	6	7	1	105.0	.
2	6	8	1	70.0	.
2	6	9	1	.	.
2	6	10	1	91.0	.
2	6	1	2	91.7	.
2	6	2	2	75.0	.
2	6	3	2	85.8	.
2	6	4	2	148.3	.
2	6	5	2	100.8	.
2	6	6	2	119.2	.
2	6	7	2	155.0	.
2	6	8	2	135.0	.
2	6	9	2	110.0	.
2	6	10	2	95.0	.
2	6	1	3	101.3	.
2	6	2	3	127.5	.
2	6	3	3	97.5	.
2	6	4	3	80.0	.
2	6	5	3	87.0	.
2	6	6	3	117.0	.
2	6	7	3	123.3	.
2	6	8	3	102.5	.
2	6	9	3	92.5	.
2	6	10	3	62.5	.
2	6	1	4	69.2	.
2	6	2	4	195.0	.
2	6	3	4	125.0	.
2	6	4	4	107.5	.
2	6	5	4	84.2	.
2	6	6	4	95.0	.
2	6	7	4	118.3	.
2	6	8	4	90.8	.
2	6	9	4	106.0	.
2	6	10	4	114.2	.
;

/*RECOMENDATIONS:
1)If you have no SEASON, then change the step [0] to:

proc sort data=GENERAL_DATA; by ENVIRONMENT;
proc glm data=GENERAL_DATA outstat=ANOVA_OUTPUT noprint;
by ENVIRONMENT;
class BLOCK GENOTYPE ENVIRONMENT;
model YIELD VAR2   =BLOCK(ENVIRONMENT) 
					GENOTYPE|ENVIRONMENT;
run;

2)Don't change this part of PROC GLM:
outstat=ANOVA_OUTPUT

3)Just put the variables in the 'model' of PROC GLM and RUN ALL SAS routine
*/

/*=======================================================================================================*/
/*============1) PERRFOMING BARTLETT TEST===================================================================*/
/*=======================================================================================================*/
/*=======================================================================================================*/

/*=======================================================================================================*/
/*[0] Sorting dataset - this is essential*/
options linesize= 88 pagesize= 64;  ** portrait **; 
proc sort data=GENERAL_DATA; by SEASON ENVIRONMENT;

/*You NEED to change this model and put your Multi-Environment Trials(MET) model*/
/*[1]Building model and exporting SS and DF's*/
/*The recomendation is to change only "model" statment*/
proc glm data=GENERAL_DATA outstat=ANOVA_OUTPUT noprint;
by SEASON ENVIRONMENT;
class BLOCK GENOTYPE ENVIRONMENT SEASON;
model YIELD VAR2   =BLOCK(ENVIRONMENT SEASON) 
					GENOTYPE 
					ENVIRONMENT 
					SEASON
					SEASON*ENVIRONMENT
					GENOTYPE*ENVIRONMENT
					GENOTYPE*SEASON
					GENOTYPE*SEASON*ENVIRONMENT;
run;

/*=======================================================================================================*/

/*You DON'T need to change the routine below*/
/*[2]Calculating Mean Square Erros (MSE) and Deleting unnecessary output from ANOVA_OUTPUT dataset*/
/*Creating a "UNIQUE_ENVIRONMENTAL" to represent each combination of environment*/
proc sort data=ANOVA_OUTPUT; by _NAME_;
data ANOVA_OUTPUT; set ANOVA_OUTPUT (drop=PROB F _SOURCE_ /*&variables*/ rename=(_NAME_=EVALUATED_VARIABLE));
if (_TYPE_='SS1') or (_TYPE_='SS3') then delete;
data ANOVA_OUTPUT; retain UNIQUE_ENVIROMENTAL_BY_VAR; set ANOVA_OUTPUT (drop=_TYPE_);
MSE=SS/DF;
UNIQUE_ENVIROMENTAL_BY_VAR= 
 UNIQUE_ENVIROMENTAL_BY_VAR + 1;
  by EVALUATED_VARIABLE;
  if first.EVALUATED_VARIABLE then UNIQUE_ENVIROMENTAL_BY_VAR = 1; 
data ANOVA_OUTPUT; set ANOVA_OUTPUT (drop=SS);
run;
/*Exporting Raw dataset*/
data ANOVA_RAW_OUTPUT; 
set ANOVA_OUTPUT;run;

/*Obtaining Number of Environments by variable*/
/*Cleaning up MIN_MAX_ENV dataset and merging with general one*/
proc means nolabels data=ANOVA_OUTPUT Min Max noprint;
by EVALUATED_VARIABLE;
var UNIQUE_ENVIROMENTAL_BY_VAR;
output out=MIN_MAX_ENV;
data MIN_MAX_ENV; set MIN_MAX_ENV (drop=_TYPE_ _FREQ_ rename=(_STAT_=MAX UNIQUE_ENVIROMENTAL_BY_VAR=NUMBER_ENV)); 
if MAX=: 'MA';
data ANOVA_OUTPUT; 
merge ANOVA_OUTPUT MIN_MAX_ENV; by EVALUATED_VARIABLE; run;

/*[3]Obtaining "A" of Bartlett formula*/
proc summary data = ANOVA_OUTPUT;
by EVALUATED_VARIABLE;
 var DF;
 output out=RESULT_SUM_DF sum=;
data RESULT_SUM_DF;
set  RESULT_SUM_DF (drop=_TYPE_ rename=(DF=A _FREQ_=NUMB_ENV));
/*Merging "A" with ANOVA_OUTPUT by EVALUATED_VARIABLES*/
data ANOVA_OUTPUT; 
merge ANOVA_OUTPUT RESULT_SUM_DF;
by EVALUATED_VARIABLE;
run;

/*[4]Obtaining SP2 from Bartlett formula*/
data ANOVA_OUTPUT; set ANOVA_OUTPUT;
DF_TIMES_MSE=DF*MSE;
proc summary data = ANOVA_OUTPUT;
by EVALUATED_VARIABLE;
var DF_TIMES_MSE;
output out=RESULT_SUM_DF_TIMES_MSE sum=;
data RESULT_SUM_DF_TIMES_MSE;
set  RESULT_SUM_DF_TIMES_MSE (drop=_TYPE_ rename=(DF_TIMES_MSE=SUM_DF_TIMES_MSE _FREQ_=NUMB_ENV));
/*Merging "DF_TIMES_MSE" with ANOVA_OUTPUT by EVALUATED_VARIABLES*/
data ANOVA_OUTPUT; 
merge ANOVA_OUTPUT RESULT_SUM_DF_TIMES_MSE;
by EVALUATED_VARIABLE;
/*Calculating the final SP2*/
data ANOVA_OUTPUT;
set ANOVA_OUTPUT;
SP2=SUM_DF_TIMES_MSE/A;
run;

/*[5]Calculating "C"*/ 
data ANOVA_OUTPUT;
set ANOVA_OUTPUT;
*LOG_MSE=Log(MSE);
DF_TIMES_LOG_MSE=DF*log10(MSE);
run;
proc summary data = ANOVA_OUTPUT;
by EVALUATED_VARIABLE;
var DF_TIMES_LOG_MSE;
output out=RESULT_SUM_DF_TIMES_LOG_MSE sum=;
data RESULT_SUM_DF_TIMES_LOG_MSE;
set  RESULT_SUM_DF_TIMES_LOG_MSE (drop=_TYPE_ rename=(DF_TIMES_LOG_MSE=C _FREQ_=NUMB_ENV));
/*Merging "RESULT_SUM_DF_TIMES_LOG_MSE" with ANOVA_OUTPUT by EVALUATED_VARIABLES*/
data ANOVA_OUTPUT; 
merge ANOVA_OUTPUT RESULT_SUM_DF_TIMES_LOG_MSE;
by EVALUATED_VARIABLE;
run;

/*[6]Calculating "D"*/
data ANOVA_OUTPUT;
set ANOVA_OUTPUT;
ONE_OVER_VJ=1/DF;
proc summary data = ANOVA_OUTPUT;
by EVALUATED_VARIABLE;
var ONE_OVER_VJ;
output out=RESULT_SUM_ONE_OVER_VJ sum=;
data RESULT_SUM_ONE_OVER_VJ;
set  RESULT_SUM_ONE_OVER_VJ (drop=_TYPE_ rename=(ONE_OVER_VJ=D _FREQ_=NUMB_ENV));
/*Merging "RESULT_SUM_ONE_OVER_VJ" with ANOVA_OUTPUT by EVALUATED_VARIABLES*/
data ANOVA_OUTPUT; 
merge ANOVA_OUTPUT RESULT_SUM_ONE_OVER_VJ;
by EVALUATED_VARIABLE;
run;

/*[7] Finally calculating "Ba" or Full Bartlett formula*/
data ANOVA_OUTPUT; set ANOVA_OUTPUT;
BARTLETT_VALUE=(2.3026*(A*(log10(SP2))-C))/(1+((1/3*(NUMBER_ENV-1))*(D-1/A))); run;

/*[8] Calculating Chi-Square Probability of assays having homogeneus variance or not*/
title1 "Resultados do teste de "  color=RED "Bartlett " color=darkblue "para checar homogeneidade de variancias de experimentos de varios locais (MET)";
title2 "Results of " color=RED "Bartlett " color=darkblue "test to check homogeneity of variances in Multi-Environment Trials (MET)";
data ANOVA_OUTPUT; set ANOVA_OUTPUT;
P_VALUE=(1-probchi(BARTLETT_VALUE,(NUMBER_ENV-1)));
label P_VALUE="P=Pr[X" "^{unicode 2265}" "^{unicode 03C7}²]"; 
format P_VALUE pvalue6.4; 
if P_VALUE ge 0.05 then RESULT=":) Suas variancias sao HOMOGENEAS - Nao se preocupe!";
else RESULT= ":( Suas variancais sao HETEROGENEAS, tenha cuidado!";
run;

/*[9] Creating a clean dataset and erasing unnecessary ones*/
data ANOVA_OUTPUT; set ANOVA_OUTPUT ;
LAG_EVALUATED_VARIABLE=lag(EVALUATED_VARIABLE);
if EVALUATED_VARIABLE=LAG_EVALUATED_VARIABLE then delete;
data ANOVA_OUTPUT; set ANOVA_OUTPUT (keep=P_VALUE RESULT BARTLETT_VALUE EVALUATED_VARIABLE A SP2 C D NUMBER_ENV);
run;
/*Excluding unnecessary datasets*/
proc Delete data = 
RESULT_SUM_DF 
RESULT_SUM_DF_TIMES_LOG_MSE
RESULT_SUM_DF_TIMES_MSE
RESULT_SUM_ONE_OVER_VJ
MIN_MAX_ENV;  
run;
/*data ANOVA_OUTPUT; set ANOVA_OUTPUT (keep=RELATION_QMR BARTLETT_VALUE EVALUATED_VARIABLE NUMBER_ENV);
run;*/

/*[10]Ordering dataset*/
proc sort data=ANOVA_OUTPUT; by RESULT EVALUATED_VARIABLE descending  _CHARACTER_; run;


/*[11] Showing results*/
/*Creating an alert to HETEROGENEOUS variances!*/
ods html;
ods escapechar='^';
proc report data=ANOVA_OUTPUT;
column EVALUATED_VARIABLE NUMBER_ENV /*RELATION_QMR*/ BARTLETT_VALUE P_VALUE RESULT;
 define EVALUATED_VARIABLE / display;
  define NUMBER_ENV / display;
  /* define RELATION_QMR / display;*/
    define BARTLETT_VALUE / display;
	 define P_VALUE / display;
	  define RESULT / display;
compute RESULT;
if  RESULT=":( Suas variancais sao HETEROGENEAS, tenha cuidado!" then call define(_col_,"style","style={background=BlueViolet}");
endcomp;
run;
footnote font='Times New Roman' height=12pt  color=red "By: Alysson Jalles"; title;
/*You DON'T need to change the routine above*/


/*=======================================================================================================*/
/*============EXPLORING RAW DATASET======================================================================*/
/*=======================================================================================================*/
/*=======================================================================================================*/

*Put down after "%let variables_names=" the names of your evaluated variables;
*%let variables_names=YIELD VAR2;

/*[11]Cleaning Full Raw dataset*/
*data ANOVA_RAW_OUTPUT; 
*set ANOVA_RAW_OUTPUT (drop=&variables_names); *run;

/*[13]Showing Full Raw dataset*/
*proc print data=ANOVA_RAW_OUTPUT; *run;



/*SOURCES:/

/*Ramalho, M.A.P.; Ferreira, D.F.; Oliveira, A.C.
Experimentacao em genetica e melhoramento de
plantas (2012). 3. Ed. UFLA, 328 pg. Chapter 8.

Bartlett, M. S. (1937). Properties of sufficiency 
and statistical tests. Proceedings of Royal Society of
London A, 160,268-82.
*/






/*=======================================================================================================*/
/*============2) PERFORMING HARTLEY TEST=================================================================*/
/*=======================================================================================================*/
/*=======================================================================================================*/

/*[0] Sorting dataset - this is essential*/
proc sort data=GENERAL_DATA; by SEASON ENVIRONMENT;

/*You NEED to change this model and put your Multi-Environment Trials(MET) model*/
/*[1]Building model and exporting SS and DF's*/
/*The recomendation is to change only "model" statment*/
proc glm data=GENERAL_DATA outstat=ANOVA_OUTPUT noprint;
by SEASON ENVIRONMENT;
class BLOCK GENOTYPE ENVIRONMENT SEASON;
model YIELD VAR2   =BLOCK(ENVIRONMENT SEASON) 
					GENOTYPE 
					ENVIRONMENT 
					SEASON
					SEASON*ENVIRONMENT
					GENOTYPE*ENVIRONMENT
					GENOTYPE*SEASON
					GENOTYPE*SEASON*ENVIRONMENT;
run;
/*=======================================================================================================*/

/*You DON'T need to change the routine below*/
/*[2]Calculating Mean Square Erros (MSE) and Deleting unnecessary output from ANOVA_OUTPUT dataset*/
/*Creating a "UNIQUE_ENVIRONMENTAL" to represent each combination of environment*/
proc sort data=ANOVA_OUTPUT; by _NAME_;
data ANOVA_OUTPUT; set ANOVA_OUTPUT (drop=PROB F _SOURCE_ /*&variables*/ rename=(_NAME_=EVALUATED_VARIABLE));
if (_TYPE_='SS1') or (_TYPE_='SS3') then delete;
data ANOVA_OUTPUT; retain UNIQUE_ENVIROMENTAL_BY_VAR; set ANOVA_OUTPUT (drop=_TYPE_);
MSE=SS/DF;
UNIQUE_ENVIROMENTAL_BY_VAR= 
 UNIQUE_ENVIROMENTAL_BY_VAR + 1;
  by EVALUATED_VARIABLE;
  if first.EVALUATED_VARIABLE then UNIQUE_ENVIROMENTAL_BY_VAR = 1; 
data ANOVA_OUTPUT; set ANOVA_OUTPUT (drop=SS);
run;
/*Exporting Raw dataset*/
data ANOVA_RAW_OUTPUT; 
set ANOVA_OUTPUT;run;

proc sort data=ANOVA_OUTPUT; by MSE EVALUATED_VARIABLE; run;

/*[3]Obtaining Relation Relation_MSE (Biggest MSE/Smaller MSE) According Hartley*/
/*Cleaning up MIN_MAX_ENV dataset*/
proc means nolabels data=ANOVA_OUTPUT Min Max noprint;
by EVALUATED_VARIABLE;
var MSE;
output out=MIN_MAX_MSE;
data DF; set ANOVA_OUTPUT (keep=EVALUATED_VARIABLE DF MSE);
proc sort data=MIN_MAX_MSE; BY MSE EVALUATED_VARIABLE;
proc sort data=DF; BY MSE EVALUATED_VARIABLE;
data MIN_MAX_MSE; merge MIN_MAX_MSE DF; by MSE EVALUATED_VARIABLE;
data MIN_MAX_MSE; set MIN_MAX_MSE (drop=_TYPE_ _FREQ_ rename=(_STAT_=MIN_MAX)); 
if (MIN_MAX=: "MIN") or (MIN_MAX=: "MAX"); 
run;

/*Apagar esse banco de dados teste*/
*data MIN_MAX_MSE;
*input EVALUATED_VARIABLE$	MIN_MAX$	MSE	DF;
*cards;
*VAR2	MIN	0.19	25
*VAR2	MAX	0.28	27
*YIELD	MIN	90.31	27
*YIELD	MAX	6224.56	27
;


data MIN_MAX_MSE; set MIN_MAX_MSE; 
LAG_MSE_MIN_MAX=lag(MSE);
LAG_DF=lag(DF);
if MIN_MAX='MAX' then HARTLEY_RELATION_MSE=MSE/LAG_MSE_MIN_MAX;
if (MIN_MAX="MAX") and (DF=LAG_DF) then P_VALUE=1-probf(HARTLEY_RELATION_MSE,DF, LAG_DF);
else if (MIN_MAX='MAX') and (DF ne LAG_DF) then P_VALUE=1-probf(HARTLEY_RELATION_MSE,(harmean(DF, LAG_DF)), (harmean(DF, LAG_DF)));
if (MIN_MAX='MAX') and (DF ne LAG_DF) then put 'WARNING:' "CAREFULL, your degrees freedom are different to " EVALUATED_VARIABLE 
" in this case Hartley test to this variable may not be a good option"; 
label P_VALUE="[P" "^{unicode 2265}" "F]"; 
format P_VALUE pvalue6.4; 
if P_VALUE ge 0.05 then RESULT=":) Suas variancias sao HOMOGENEAS - Nao se preocupe!";
else RESULT= ":( Suas variancias HETEROGENEAS, tenha cuidado";
if P_VALUE=. then RESULT=.;
run;


data MIN_MAX_MSE; set MIN_MAX_MSE (drop=LAG_MSE_MIN_MAX LAG_DF);
run; 

/*[4] Showing results*/
/*Creating an alert to HETEROGENEOUS variances!*/
title "Resultados do teste de " color=RED "Hartley " color=darkblue "para checar homogeneidade de variancias de experimentos de varios locais (MET)";
title2 "Results of " color=RED "Hartley " color=darkblue "test to check homogeneity of variances in Multi-Environment Trials (MET)";
proc report data=MIN_MAX_MSE;
column EVALUATED_VARIABLE MIN_MAX MSE DF HARTLEY_RELATION_MSE P_VALUE RESULT;
 define EVALUATED_VARIABLE / display;
  define MIN_MAX / display;
   define MSE / display;
    define DF / display;
	 define P_VALUE / display;
	 	 define RESULT / display;
compute RESULT;
if  RESULT=":( Suas variancias HETEROGENEAS, tenha cuidado" then call define(_col_,"style","style={background=BlueViolet}");
endcomp;
run;
footnote font='Times New Roman' height=12pt  color=red "By: Alysson Jalles"; title;
/*You DON'T need to change the routine above*/
ods html close;
title; *footnote;
ods preferences;
