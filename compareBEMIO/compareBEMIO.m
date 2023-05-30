%% BEMIO example comparing different hydro data 

%% UMaine
clear all;clc; close all
WAMIT_out = './WAMIT/IEA-15-240-RWT-UMaineSemi_1stOrder.out.wamit';
AQWA_out = './AQWA000/UMaine_MSL20_MASS_COG000';

WAMIT_hydro = struct();
WAMIT_hydro = readWAMIT(WAMIT_hydro,WAMIT_out,[]);
WAMIT_hydro = radiationIRF(WAMIT_hydro,[],[],[],[],[]);
WAMIT_hydro = excitationIRF(WAMIT_hydro,[],[],[],[],[]);

AQWA_hydro = struct();
AQWA_hydro = readAQWA(AQWA_hydro, [AQWA_out '.AH1'], [AQWA_out '.LIS']);
AQWA_hydro = radiationIRF(AQWA_hydro,[],[],[],[],[]);
AQWA_hydro = excitationIRF(AQWA_hydro,[],[],[],[],[]);

WAMIT_hydro.body{1} = 'WAMIT';
AQWA_hydro.body{1}  = 'AQWA';

plotBEMIO(WAMIT_hydro,AQWA_hydro)




