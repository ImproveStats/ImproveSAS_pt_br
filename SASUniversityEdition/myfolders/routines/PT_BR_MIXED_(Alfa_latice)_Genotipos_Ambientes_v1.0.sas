*========================================================================================
*OBJETIVO:	Calcular Parametros geneticos em experimentos alfa latice varios ambientes
			Predicao dos BLUPS

*AUTOR: Alysson Jalles da Silva

*EMAIL: jalles10@gmail.com

*DATA: 03/06/2016

*VERSAO: 1.0

*MODIFICADA: ___.
========================================================================================;

*Simulando um experimento alfa latice;
proc plan seed=2016;
 factors ENV=2 ordered REP=5 ordered BLOCK=4 ordered GEN=4 of 20
 cyclic (1 18 15 12) 4;
 output out=ALPHA_DATA;
run; 

*Simulando 2 variaveis para o alfa latice design;
data ALPHA_DATA; set ALPHA_DATA;
call streaminit(3862); /*SEED=3862*/
VAR1=rand('normal',50, 5); /*MEDIA 50 cm: DEV.PAD: 5*/
VAR2=rand('normal',58,44);
run;

*Realizando analise de modelos mistos do alta lattice;
*Predizendo BLUPS (Estimates);
proc mixed data=ALPHA_DATA;
class ENV REP BLOCK GEN;
model VAR1=ENV; /*<---: Fixed effects*/
random GEN GEN*ENV REP(BLOCK) BLOCK(REP ENV)/solution;  /*<---: Random effects*/
estimate "Media geral da variavel" intercept 1 | GEN 0;
run; 

	*Valores obtidos na saida do proc mixed;
%let var=VAR1;  *Nome da variavel;
%let Vg=0.5334; *variancia genetica;
%let Ve=24.1819;*variance residual;
%let Vi=1.1852; *variancia gen*amb;
%let x=50.0668; *Media geral do Experimento;
	*Valores obtidos no experimento;
%let num_rep=5; *numero de REP;
%let num_env=2; *number of AMB;
	*Valor para tabela final;
%let DECIMAL_PLACE=6; *Casas decimais na tabela de parametros geneticos;

data GENETIC_PARAMETER; 
do OBS=1 to 14; *14 parametros geneticos;
output; end;
run;

data GENETIC_PARAMETER; set GENETIC_PARAMETER; 
if OBS=1 then do;GP='Vp               '; &var=&Vg+&Vi+&Ve; end;
%let Vp=%sysevalf(&Vg+&Vi+&Ve); 
if OBS=2 then do;GP='Vg'; &var=&Vg; end;
if OBS=3 then do;GP='Vi';&var=&Vi;end;
if OBS=4 then do;GP='c2int';&var=&Vi/&Vp;end;
if OBS=5 then do;GP='Ve';&var=&Ve;end;
if OBS=6 then do;GP='h2mg (%)';&var=(&Vg)/(&Vg+(&Vi/&NUM_ENV)+(&Ve/(&NUM_REP*&NUM_ENV)))*100;end;
	%let h2mg=%sysevalf((&Vg)/(&Vg+(&Vi/&NUM_ENV)+(&Ve/(&NUM_REP*&NUM_ENV)))*100); 
if OBS=7 then do;GP='Acgen (%)';&var=sqrt(&h2mg)*10;end;
	%let Acgen=%sysevalf(((&h2mg)*10)**0.5); 
if OBS=8 then do;GP='Cvg';&var=(100*(sqrt(&Vg))/&x);end;
	%let Cvg=%sysevalf(100*((&Vg)**0.5)/&x); 
if OBS=9 then do;GP='Cve';&var=(100*(sqrt(&Ve))/&x);end;
	%let Cve=%sysevalf(100*((&Ve)**0.5)/&x); 
if OBS=10 then do;GP='CVg/CVe';&var=&Cvg/&Cve;end;
if OBS=11 then do;GP='rgloc';&var=&Ve/(&Vg+&Vi);end;
if OBS=12 then do;GP='PEV';&var=(1-((&Acgen/100)**2))*(&Vg);end;
	%let PEV=%sysevalf(1-((&Acgen/100)**2))*(&Vg); 
if OBS=13 then do;GP='SEP';&var=sqrt(&PEV);end;
if OBS=14 then do;GP='Media Geral';&var=&X;end;
label GP='Parametro Genetico';
drop OBS;
Proc print noobs label;
format &var 32.&DECIMAL_PLACE;
footnote1 color=red "O-N-D-E";
footnote2 color=darkblue
"Vf=Vg+Vi+Ve: Variancia Fenotipica individual (GEN);
Vg: Variancia Genotipica;
Vi: Variancia da interacao GEN X AMB;
c2int= Vga/Vf: Coeficiente de determinacao dos efeitos da interacao GEN X AMB;
Ve: Variancia Residual;
h2mg=(Vg/(Vg+Vi/num.amb+Ve/(num.amb*num.rep): Herdabilidade media (genotipos);
AcGen=raiz.quadrada(h2mg): Acuracia na selecao dos genotipos;
CVg=raiz.quadrada(Vg/media.geral: Coeficiente de variacao genetico;
CVe= raiz.quadrada(Ve))/media.geral: Coeficiente de variacao ambiental;
CVg/Cve=CVg/Cve: coeficiente de variacao relativo;
rgloc=Vg/(Vg+Vi): Corr. genotipica entre o desempenho dos genotipos nos varios ambientes;
PEV=(1-AcGen^2)*Vg: Acuracia na selecao de genotipos;
SEP= raiz.quadrada(PEV): Desvio padrao do valor genotipico dos genotipos";
run;title; footnote;
