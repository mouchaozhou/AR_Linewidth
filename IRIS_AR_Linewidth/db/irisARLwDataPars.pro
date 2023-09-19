pro irisARLwDataPars, sEvtNum, sLineID, $
                    ; @out
                    sDataPath=sDataPath, nWaveWin=nWaveWin, aLineRg=aLineRg, aContRg=aContRg

  if (sLineID eq 'SIIV1394') then begin
      case sEvtNum of
      ;#region case 1
        '1' : begin
                ; 数据所在的子路径
                sDataPath ='2015/01/22/20150122_060619_3893010094/'
                ; Si IV 所在的谱线窗口
                nWaveWin = 1
                ; Si IV 所在的谱线范围                        
                aLineRg = [963, 1077]
                ; 背景（连续谱）所取的谱线范围
                aContRg = [1209, 1286]
              end
        '2' : begin
                sDataPath ='2015/01/25/20150122_060619_3893010094/'
                nWaveWin = 1
                aLineRg = [976, 1063]
                aContRg = [1324, 1398]
              end
        '3' : begin
                sDataPath ='2015/01/27/20150127_062137_3893010094/'
                nWaveWin = 1
                aLineRg = [981, 1059]
                aContRg = [1224, 1300]
              end
        '4' : begin
                sDataPath ='2015/01/28/20150128_064412_3893010094/'
                nWaveWin = 1
                aLineRg = [978, 1083]
                aContRg = [1222, 1299]
              end
        '5' : begin
                sDataPath ='2015/01/29/20150129_054843_3893010094/'
                nWaveWin = 1
                aLineRg = [978, 1078]
                aContRg = [1258, 1394]
              end
        '6' : begin
                sDataPath ='2015/01/30/20150130_055150_3893010094/'
                nWaveWin = 1
                aLineRg = [965, 1085]
                aContRg = [1226, 1308]
              end
        '7' : begin
                sDataPath ='2015/01/31/20150131_092926_3893010094/'
                nWaveWin = 1
                aLineRg = [981, 1070]
                aContRg = [1235, 1308]
              end
        '8' : begin
                sDataPath ='2015/02/01/20150201_095154_3893010094/'
                nWaveWin = 1
                aLineRg = [978, 1068]
                aContRg = [1320, 1402]
              end
        '9' : begin
                sDataPath ='2015/02/02/20150202_054117_3893010094/'
                nWaveWin = 1
                aLineRg = [983, 1077]
                aContRg = [1234, 1321]
              end
        '10' : begin
                sDataPath ='2015/02/03/20150203_190631_3893012099/'
                nWaveWin = 1
                aLineRg = [981, 1074]
                aContRg = [1326, 1410]
              end
        ;#endregion
        ;#region case 2
        '11' : begin
                sDataPath = '2014/12/09/20141209_053534_3893010094/'
                nWaveWin = 1
                aLineRg = [957, 1097]
                aContRg = [1224, 1390]
              end
        '12' : begin
                sDataPath = '2014/12/10/20141210_105117_3893010094/'
                nWaveWin = 1
                aLineRg = [954, 1092]
                aContRg = [1178, 1397]
              end
        '13' : begin
                sDataPath = '2014/12/11/20141211_062217_3893010094/'
                nWaveWin = 1
                aLineRg = [969, 1094]
                aContRg = [1169, 1350]
              end
        '14' : begin
                sDataPath = '2014/12/12/20141212_064427_3893010094/'
                nWaveWin = 1
                aLineRg = [972, 1072]
                aContRg = [1183, 1348]
              end
        '15' : begin
                sDataPath = '2014/12/13/20141213_071106_3893010094/'
                nWaveWin = 1
                aLineRg = [972, 1083]
                aContRg = [1206, 1399]
              end
        '16' : begin
                sDataPath = '2014/12/14/20141214_090817_3893010094/'
                nWaveWin = 1
                aLineRg = [983, 1081]
                aContRg = [1225, 1388]
              end
        '17' : begin
                sDataPath = '2014/12/15/20141215_061617_3893010094/'
                nWaveWin = 1
                aLineRg = [972, 1070]
                aContRg = [1161, 1348]
              end
        '18' : begin
                sDataPath = '2014/12/16/20141216_063854_3893010094/'
                nWaveWin = 1
                aLineRg = [970, 1074]
                aContRg = [1203, 1381]
              end
        ;#endregion
        ;#region case 3
        '19' : begin
                sDataPath = '2015/02/21/20150221_052920_3893010094/'
                nWaveWin = 1
                aLineRg = [976, 1077]
                aContRg = [368, 567]
              end
        '20' : begin
                sDataPath = '2015/02/23/20150223_155114_3893010094/'
                nWaveWin = 1
                aLineRg = [975, 1101]
                aContRg = [369, 566]
              end
        '21' : begin
                sDataPath = '2015/02/24/20150224_070918_3893010094/'
                nWaveWin = 1
                aLineRg = [981, 1090]
                aContRg = [361, 527]
              end
        '22' : begin
                sDataPath = '2015/02/26/20150226_050731_3893010094/'
                nWaveWin = 1
                aLineRg = [977, 1090]
                aContRg = [1216, 1392]
              end
        '23' : begin
                sDataPath = '2015/03/01/20150301_015918_3893010094/'
                nWaveWin = 1
                aLineRg = [972, 1103]
                aContRg = [1210, 1383]
              end
        ;#endregion
        ;#region case 4
        '24' : begin
                sDataPath = '2015/03/10/20150310_044658_3893010094/'
                nWaveWin = 1
                aLineRg = [964, 1097]
                aContRg = [1192, 1309]
              end
        '25' : begin
                sDataPath = '2015/03/12/20150312_045658_3893010094/'
                nWaveWin = 1
                aLineRg = [947, 1102]
                aContRg = [1239, 1394]
              end
        '26' : begin
                sDataPath = '2015/03/15/20150315_035818_3893010094/'
                nWaveWin = 1
                aLineRg = [958, 1116]
                aContRg = [1191, 1382]
              end
        '27' : begin
                sDataPath = '2015/03/31/20150331_043808_3893010094/'
                nWaveWin = 1
                aLineRg = [963, 1079]
                aContRg = [1232, 1370]
              end
        '28' : begin
                sDataPath = '2015/04/03/20150403_030418_3893010094/'
                nWaveWin = 1
                aLineRg = [970, 1079]
                aContRg = [1201, 1416]
              end
        ;#endregion
        ;#region case 5
        '29' : begin
                sDataPath = '2015/04/05/20150405_170008_3893010094/'
                nWaveWin = 1
                aLineRg = [972, 1070]
                aContRg = [1179, 1397]
              end
        '30' : begin
                sDataPath = '2015/04/07/20150407_050030_3893010094/'
                nWaveWin = 1
                aLineRg = [981, 1083]
                aContRg = [1156, 1403]
              end
        '31' : begin
                sDataPath = '2015/04/09/20150409_043810_3893010094/'
                nWaveWin = 1
                aLineRg = [967, 1074]
                aContRg = [1147, 1294]
              end
        '32' : begin
                sDataPath = '2015/04/12/20150412_172028_3893010094/'
                nWaveWin = 1
                aLineRg = [970, 1074]
                aContRg = [1256, 1412]
              end
        '33' : begin
                sDataPath = '2015/04/14/20150414_054418_3893010094/'
                nWaveWin = 1
                aLineRg = [969, 1074]
                aContRg = [1283, 1441]
              end
        ;#endregion
        ;#region case 6
        '34' : begin
                sDataPath = '2015/04/16/20150416_051659_3893010094/'
                nWaveWin = 1
                aLineRg = [964, 1079]
                aContRg = [1195, 1384]
              end
        '35' : begin
                sDataPath = '2015/04/19/20150419_050617_3893010094/'
                nWaveWin = 1
                aLineRg = [970, 1068]
                aContRg = [1237, 1404]
              end
        '36' : begin
                sDataPath = '2015/04/21/20150421_045916_3893010094/'
                nWaveWin = 1
                aLineRg = [967, 1072]
                aContRg = [1228, 1401]
              end
        '37' : begin
                sDataPath = '2015/04/23/20150423_041916_3893010094/'
                nWaveWin = 1
                aLineRg = [967, 1076]
                aContRg = [1247, 1403]
              end
        '38' : begin
                sDataPath = '2015/04/26/20150426_065516_3893010094/'
                nWaveWin = 1
                aLineRg = [968, 1070]
                aContRg = [1262, 1460]
              end
        ;#endregion
        ;#region case 7
        '39' : begin
                sDataPath = '2015/05/28/20150528_044656_3893010094/'
                nWaveWin = 1
                aLineRg = [960, 1085]
                aContRg = [1230, 1421]
              end
        '40' : begin
                sDataPath = '2015/05/31/20150531_055053_3893010094/'
                nWaveWin = 1
                aLineRg = [958, 1085]
                aContRg = [1183, 1377]
              end
        '41' : begin
                sDataPath = '2015/06/02/20150602_050158_3893010094/'
                nWaveWin = 1
                aLineRg = [965, 1081]
                aContRg = [1169, 1345]
              end
        '42' : begin
                sDataPath = '2015/06/04/20150604_051928_3893010094/'
                nWaveWin = 1
                aLineRg = [963, 1092]
                aContRg = [1186, 1373]
              end
        '43' : begin
                sDataPath = '2015/06/07/20150607_030928_3893010094/'
                nWaveWin = 1
                aLineRg = [963, 1083]
                aContRg = [1150, 1395]
              end
        ;#endregion
        ;#region case 8
        '44' : begin
                sDataPath = '2015/07/14/20150714_044928_3893010094/'
                nWaveWin = 1
                aLineRg = [957, 1097]
                aContRg = [1152, 1406]
              end
        '45' : begin
                sDataPath = '2015/07/16/20150716_045428_3893010094/'
                nWaveWin = 1
                aLineRg = [964, 1073]
                aContRg = [1201, 1395]
              end
        '46' : begin
                sDataPath = '2015/07/17/20150717_051928_3893010094/'
                nWaveWin = 1
                aLineRg = [966, 1083]
                aContRg = [1117, 1282]
              end
        '47' : begin
                sDataPath = '2015/07/19/20150719_045230_3893010094/'
                nWaveWin = 1
                aLineRg = [972, 1078]
                aContRg = [1265, 1410]
              end
        '48' : begin
                sDataPath = '2015/07/26/20150726_043718_3893010094/'
                nWaveWin = 1
                aLineRg = [957, 1072]
                aContRg = [1123, 1275]
              end
        ;#endregion
        ;#region case 9
        '49' : begin
                sDataPath = '2015/08/04/20150804_060918_3893010094/'
                nWaveWin = 1
                aLineRg = [938, 1092]
                aContRg = [1161, 1345]
              end
        '50' : begin
                sDataPath = '2015/08/06/20150806_061918_3893010094/'
                nWaveWin = 1
                aLineRg = [940, 1089]
                aContRg = [1143, 1358]
              end
        '51' : begin
                sDataPath = '2015/08/09/20150809_054748_3893010094/'
                nWaveWin = 1
                aLineRg = [935, 1088]
                aContRg = [1128, 1297]
              end
        '52' : begin
                sDataPath = '2015/08/11/20150811_065816_3893010094/'
                nWaveWin = 1
                aLineRg = [954, 1089]
                aContRg = [1181, 1368]
              end
        '53' : begin
                sDataPath = '2015/08/13/20150813_044916_3893010094/'
                nWaveWin = 1
                aLineRg = [950, 1098]
                aContRg = [1138, 1350]
              end
        ;#endregion
        ;#region case 10
        '54' : begin
                sDataPath = '2015/08/25/20150825_161503_3893010094/'
                nWaveWin = 1
                aLineRg = [965, 1063]
                aContRg = [1145, 1334]
              end
        '55' : begin
                sDataPath = '2015/08/27/20150827_050950_3893010094/'
                nWaveWin = 1
                aLineRg = [950, 1103]
                aContRg = [1138, 1296]
              end
        '56' : begin
                sDataPath = '2015/08/30/20150830_160928_3893010094/'
                nWaveWin = 1
                aLineRg = [969, 1076]
                aContRg = [1132, 1261]
              end
        '57' : begin
                sDataPath = '2015/09/01/20150901_183928_3893010094/'
                nWaveWin = 1
                aLineRg = [976, 1078]
                aContRg = [1112, 1270]
              end
        '58' : begin
                sDataPath = '2015/09/03/20150903_051928_3893010094/'
                nWaveWin = 1
                aLineRg = [970, 1074]
                aContRg = [1103, 1387]
              end
        '59' : begin
                sDataPath = '2015/09/06/20150906_170928_3893010094/'
                nWaveWin = 1
                aLineRg = [969, 1069]
                aContRg = [512, 665]
              end
        ;#endregion
        ;#region case 11
        '60' : begin
                sDataPath = '2015/11/13/20151113_100217_3893010094/'
                nWaveWin = 1
                aLineRg = [964, 1082]
                aContRg = [1136, 1345]
              end
        '61' : begin
                sDataPath = '2015/11/14/20151114_132818_3893010094/'
                nWaveWin = 1
                aLineRg = [959, 1083]
                aContRg = [1153, 1377]
              end
        '62' : begin
                sDataPath = '2015/11/16/20151116_155943_3882010194/'
                nWaveWin = 1
                aLineRg = [965, 1071]
                aContRg = [1127, 1320]
              end
        '63' : begin
                sDataPath = '2015/11/17/20151117_230117_3893010094/'
                nWaveWin = 1
                aLineRg = [973, 1067]
                aContRg = [1109, 1267]
              end
        '64' : begin
                sDataPath = '2015/11/19/20151119_185417_3893010094/'
                nWaveWin = 1
                aLineRg = [977, 1075]
                aContRg = [1126, 1364]
              end
        '65' : begin
                sDataPath = '2015/11/22/20151122_230817_3893010094/'
                nWaveWin = 1
                aLineRg = [971, 1078]
                aContRg = [1131, 1380]
              end
        '66' : begin
                sDataPath = '2015/11/24/20151124_054659_3893010094/'
                nWaveWin = 1
                aLineRg = [964, 1079]
                aContRg = [1121, 1310]
              end
        ;#endregion
        ;#region case 12
        '67' : begin
                sDataPath = '2015/11/26/20151126_094501_3893010094/'
                nWaveWin = 1
                aLineRg = [960, 1072]
                aContRg = [1132, 1323]
              end
        '68' : begin
                sDataPath = '2015/11/29/20151129_073642_3893010094/'
                nWaveWin = 1
                aLineRg = [977, 1087]
                aContRg = [1148, 1370]
              end
        '69' : begin
                sDataPath = '2015/12/01/20151201_064449_3893010094/'
                nWaveWin = 1
                aLineRg = [969, 1089]
                aContRg = [1147, 1408]
              end
        '70' : begin
                sDataPath = '2015/12/03/20151203_072851_3893010094/'
                nWaveWin = 1
                aLineRg = [966, 1086]
                aContRg = [1135, 1386]
              end
        '71' : begin
                sDataPath = '2015/12/06/20151206_083552_3893010094/'
                nWaveWin = 1
                aLineRg = [970, 1070]
                aContRg = [1176, 1414]
              end
        ;#endregion
        ;#region case 13
        '72' : begin
                sDataPath = '2015/12/08/20151208_060548_3893010094/'
                nWaveWin = 1
                aLineRg = [966, 1077]
                aContRg = [1143, 1335]
              end
        '73' : begin
                sDataPath = '2015/12/10/20151210_082734_3893010094/'
                nWaveWin = 1
                aLineRg = [961, 1068]
                aContRg = [1148, 1357]
              end
        '74' : begin
                sDataPath = '2015/12/13/20151213_075657_3893010094/'
                nWaveWin = 1
                aLineRg = [963, 1087]
                aContRg = [1118, 1372]
              end
        '75' : begin
                sDataPath = '2015/12/15/20151215_115716_3893010094/'
                nWaveWin = 1
                aLineRg = [972, 1072]
                aContRg = [1108, 1310]
              end
        '76' : begin
                sDataPath = '2015/12/17/20151217_061116_3893010094/'
                nWaveWin = 1
                aLineRg = [970, 1078]
                aContRg = [1116, 1345]
              end
        ;#endregion
        ;#region case 14
        '77' : begin
                sDataPath = '2014/11/17/20141117_065301_3893010094/'
                nWaveWin = 1
                aLineRg = [958, 1078]
                aContRg = [305, 549]
              end
        '78' : begin
                sDataPath = '2014/11/18/20141118_054001_3893010094/'
                nWaveWin = 1
                aLineRg = [955, 1104]
                aContRg = [1146, 1391]
              end
        '79' : begin
                sDataPath = '2014/11/20/20141120_051552_3893010094/'
                nWaveWin = 1
                aLineRg = [960, 1105]
                aContRg = [1153, 1355]
              end
        '80' : begin
                sDataPath = '2014/11/21/20141121_082451_3893010094/'
                nWaveWin = 1
                aLineRg = [961, 1094]
                aContRg = [360, 596]
              end
        '81' : begin
                sDataPath = '2014/11/22/20141122_053252_3893010094/'
                nWaveWin = 1
                aLineRg = [961, 1078]
                aContRg = [349, 578]
              end
        '82' : begin
                sDataPath = '2014/11/23/20141123_055559_3893010094/'
                nWaveWin = 1
                aLineRg = [956, 1085]
                aContRg = [1176, 1399]
              end
        '83' : begin
                sDataPath = '2014/11/24/20141124_051537_3893010094/'
                nWaveWin = 1
                aLineRg = [958, 1084]
                aContRg = [1207, 1400]
              end
        '84' : begin
                sDataPath = '2014/11/25/20141125_200201_3893010094/'
                nWaveWin = 1
                aLineRg = [958, 1095]
                aContRg = [1225, 1424]
              end
        '85' : begin
                sDataPath = '2014/11/26/20141126_070901_3893010094/'
                nWaveWin = 1
                aLineRg = [959, 1090]
                aContRg = [1126, 1386]
              end
        ;#endregion

        ;#High resolution data -------------------------------------
        ;#region 15 (1)
        '86' : begin
                sDataPath = '2014/07/04/20140704_114030_3824263396/'
                nWaveWin = 3
                aLineRg = [97, 129]
                aContRg = [145, 170]
              end
        '87' : begin
                sDataPath = '2014/07/05/20140705_230030_3824263396/'
                nWaveWin = 3
                aLineRg = [92, 132]
                aContRg = [147, 177]
              end
        '88' : begin
                sDataPath = '2014/07/07/20140707_233530_3824263396/'
                nWaveWin = 3
                aLineRg = [92, 132]
                aContRg = [148, 177]
              end
        '89' : begin
                sDataPath = '2014/07/08/20140708_192613_3824263396/'
                nWaveWin = 3
                aLineRg = [95, 132]
                aContRg = [143, 174]
              end
        '90' : begin
                sDataPath = '2014/07/09/20140709_202030_3824263396/'
                nWaveWin = 3
                aLineRg = [90, 135]
                aContRg = [142, 178]
              end
        '91' : begin
                sDataPath = '2014/07/10/20140710_123030_3824263396/'
                nWaveWin = 3
                aLineRg = [89, 131]
                aContRg = [145, 178]
              end
        '92' : begin
                sDataPath = '2014/07/12/20140712_001628_3824263396/'
                nWaveWin = 3
                aLineRg = [89, 133]
                aContRg = [145, 178]
              end
        '93' : begin
                sDataPath = '2014/07/12/20140712_121730_3824263396/'
                nWaveWin = 3
                aLineRg = [91, 136]
                aContRg = [141, 174]
              end
        ;#endregion
        ;#region 16 (2)
          ;No Si IV 1394
          ;Only have:
          ;C I
          ;Si IV 1403
          ;2814
          ;Mg II
        ;#endregion
        ;#region 17 (3)
        '107' : begin
                sDataPath = '2014/08/15/20140815_070803_3800258196/'
                nWaveWin = 2
                aLineRg = [80, 114]
                aContRg = [123, 143]
              end
        '108' : begin
                sDataPath = '2014/08/15/20140815_223609_3880012196/'
                nWaveWin = 1
                aLineRg = [967, 1084]
                aContRg = [1148, 1360]
              end
        '109' : begin
                sDataPath = '2014/08/16/20140816_211749_3800258196/'
                nWaveWin = 2
                aLineRg = [82, 110]
                aContRg = [118, 141]
              end
        '110' : begin
                sDataPath = '2014/08/17/20140817_214403_3800258196/'
                nWaveWin = 2
                aLineRg = [83, 110]
                aContRg = [117, 138]
              end
        ;#endregion
        ;#region 18 (4)
        '111' : begin
                sDataPath = '2015/02/13/20150213_061157_3800006096/'
                nWaveWin = 2
                aLineRg = [163, 218]
                aContRg = [236, 270]
              end
        '112' : begin
                sDataPath = '2015/02/14/20150214_150407_3820256096/'
                nWaveWin = 3
                aLineRg = [98, 127]
                aContRg = [133, 152]
              end
        '113' : begin
                sDataPath = '2015/02/16/20150216_082412_3820258096/'
                nWaveWin = 3
                aLineRg = [98, 125]
                aContRg = [135, 157]
              end
        '114' : begin
                sDataPath = '2015/02/17/20150217_084912_3820258096/'
                nWaveWin = 3
                aLineRg = [97, 126]
                aContRg = [132, 152]
              end
        '115' : begin
                sDataPath = '2015/02/17/20150217_224734_3800013096/'
                nWaveWin = 2
                aLineRg = [163, 224]
                aContRg = [242, 288]
              end
        '116' : begin
                sDataPath = '2015/02/19/20150219_011422_3800010096/'
                nWaveWin = 2
                aLineRg = [167, 221]
                aContRg = [237, 299]
              end
        '117' : begin
                sDataPath = '2015/02/20/20150220_133006_3800106096/'
                nWaveWin = 2
                aLineRg = [82, 109]
                aContRg = [117, 136]
              end
        ;#endregion
        ;#region 19 (5)
        '118' : begin
                sDataPath = '2015/02/21/20150221_142955_3800106096/'
                nWaveWin = 2
                aLineRg = [82, 110]
                aContRg = [118, 145]
              end
        '119' : begin
                sDataPath = '2015/02/21/20150221_103943_3800106096/'
                nWaveWin = 2
                aLineRg = [82, 109]
                aContRg = [119, 137]
              end
        '120' : begin
                sDataPath = '2015/02/21/20150221_123519_3800106096/'
                nWaveWin = 2
                aLineRg = [82, 111]
                aContRg = [120, 140]
              end
        '121' : begin
                sDataPath = '2015/02/21/20150221_084001_3800110096/'
                nWaveWin = 2
                aLineRg = [83, 110]
                aContRg = [114, 136]
              end
        '122' : begin
                sDataPath = '2015/02/22/20150222_075113_3800110096/'
                nWaveWin = 2
                aLineRg = [83, 110]
                aContRg = [118, 142]
              end
        '123' : begin
                sDataPath = '2015/02/22/20150222_095006_3800110096/'
                nWaveWin = 2
                aLineRg = [84, 110]
                aContRg = [116, 139]
              end
        '124' : begin
                sDataPath = '2015/02/22/20150222_114859_3800110096/'
                nWaveWin = 2
                aLineRg = [83, 111]
                aContRg = [117, 139]
              end
        '125' : begin
                sDataPath = '2015/02/22/20150222_154645_3800110096/'
                nWaveWin = 2
                aLineRg = [84, 109]
                aContRg = [117, 141]
              end
        '126' : begin
                sDataPath = '2015/02/22/20150222_134752_3800110096/'
                nWaveWin = 2
                aLineRg = [83, 109]
                aContRg = [120, 144]
              end
        '127' : begin
                sDataPath = '2015/02/23/20150223_213555_3800110096/'
                nWaveWin = 2
                aLineRg = [83, 110]
                aContRg = [116, 137]
              end
        '128' : begin
                sDataPath = '2015/02/23/20150223_233348_3800110096/'
                nWaveWin = 2
                aLineRg = [82, 109]
                aContRg = [121, 143]
              end
        '129' : begin
                sDataPath = '2015/02/25/20150225_092905_3820104096/'
                nWaveWin = 3
                aLineRg = [100, 123]
                aContRg = [129, 148]
              end
        '130' : begin
                sDataPath = '2015/02/25/20150225_095939_3820104096/'
                nWaveWin = 3
                aLineRg = [107, 127]
                aContRg = [134, 159]
              end
        '131' : begin
                sDataPath = '2015/02/25/20150225_103013_3820104096/'
                nWaveWin = 3
                aLineRg = [97, 123]
                aContRg = [131, 153]
              end
        '132' : begin
                sDataPath = '2015/02/25/20150225_110047_3820104096/'
                nWaveWin = 3
                aLineRg = [101, 124]
                aContRg = [134, 156]
              end
        '133' : begin
                sDataPath = '2015/02/25/20150225_113121_3820104096/'
                nWaveWin = 3
                aLineRg = [99, 126]
                aContRg = [133, 155]
              end
        '134' : begin
                sDataPath = '2015/02/25/20150225_120155_3820104096/'
                nWaveWin = 3
                aLineRg = [101, 127]
                aContRg = [136, 159]
              end
        '135' : begin
                sDataPath = '2015/02/25/20150225_124705_3820104096/'
                nWaveWin = 3
                aLineRg = [99, 124]
                aContRg = [131, 151]
              end
        '136' : begin
                sDataPath = '2015/02/25/20150225_131805_3820104096/'
                nWaveWin = 3
                aLineRg = [99, 126]
                aContRg = [133, 153]
              end
        '137' : begin
                sDataPath = '2015/02/26/20150226_131659_3820106096/'
                nWaveWin = 3
                aLineRg = [97, 126]
                aContRg = [131, 159]
              end
        '138' : begin
                sDataPath = '2015/02/26/20150226_123301_3820106096/'
                nWaveWin = 3
                aLineRg = [97, 126]
                aContRg = [131, 157]
              end
        '139' : begin
                sDataPath = '2015/02/26/20150226_140107_3820106096/'
                nWaveWin = 3
                aLineRg = [98, 127]
                aContRg = [142, 164]
              end
        '140' : begin
                sDataPath = '2015/02/26/20150226_102107_3820106096/'
                nWaveWin = 3
                aLineRg = [101, 122]
                aContRg = [128, 162]
              end
        '141' : begin
                sDataPath = '2015/02/26/20150226_110505_3820106096/'
                nWaveWin = 3
                aLineRg = [98, 126]
                aContRg = [133, 162]
              end
        '142' : begin
                sDataPath = '2015/02/26/20150226_114903_3820106096/'
                nWaveWin = 3
                aLineRg = [98, 127]
                aContRg = [132, 159]
              end
        '143' : begin
                sDataPath = '2015/02/27/20150227_233431_3890112096/'
                nWaveWin = 1
                aLineRg = [488, 530]
                aContRg = [558, 686]
              end
        '144' : begin
                sDataPath = '2015/02/28/20150228_133431_3890112096/'
                nWaveWin = 1
                aLineRg = [490, 540]
                aContRg = [564, 632]
              end
        '145' : begin
                sDataPath = '2015/02/28/20150228_072133_3890112096/'
                nWaveWin = 1
                aLineRg = [485, 544]
                aContRg = [573, 681]
              end
        ;#endregion
        ;#region 20 (6)
        '146' : begin
                sDataPath = '2015/09/23/20150923_202231_3690092077/'
                nWaveWin = 1
                aLineRg = [962, 1083]
                aContRg = [1138, 1315]
              end
        '147' : begin
                sDataPath = '2015/09/23/20150923_000943_3690092077/'
                nWaveWin = 1
                aLineRg = [973, 1085]
                aContRg = [1128, 1368]
              end
        '148' : begin
                sDataPath = '2015/09/24/20150924_172213_3690092077/'
                nWaveWin = 1
                aLineRg = [966, 1086]
                aContRg = [1159, 1381]
              end
        '149' : begin
                sDataPath = '2015/09/25/20150925_210043_3690092077/'
                nWaveWin = 1
                aLineRg = [975, 1075]
                aContRg = [1132, 1278]
              end
        '150' : begin
                sDataPath = '2015/09/26/20150926_212341_3690092077/'
                nWaveWin = 1
                aLineRg = [980, 1074]
                aContRg = [1130, 1317]
              end
        '151' : begin
                sDataPath = '2015/09/28/20150928_170841_3690092077/'
                nWaveWin = 1
                aLineRg = [977, 1088]
                aContRg = [1161, 1333]
              end
        '152' : begin
                sDataPath = '2015/10/02/20151002_005443_3690092077/'
                nWaveWin = 1
                aLineRg = [973, 1085]
                aContRg = [1181, 1352]
              end
        '153' : begin
                sDataPath = '2015/10/02/20151002_204720_3690092077/'
                nWaveWin = 1
                aLineRg = [975, 1097]
                aContRg = [1143, 1339]
              end
        ;#endregion
        ;#region 21 (7)
        '154' : begin
                sDataPath = '2015/11/13/20151113_130505_3630088076/'
                nWaveWin = 3
                aLineRg = [197, 252]
                aContRg = [290, 329]
              end
        '155' : begin
                sDataPath = '2015/11/13/20151113_112859_3630088076/'
                nWaveWin = 3
                aLineRg = [195, 245]
                aContRg = [270, 311]
              end
        '156' : begin
                sDataPath = '2015/11/14/20151114_083509_3630008076/'
                nWaveWin = 3
                aLineRg = [194, 251]
                aContRg = [267, 315]
              end
        '157' : begin
                sDataPath = '2015/11/14/20151114_101239_3630008076/'
                nWaveWin = 3
                aLineRg = [195, 252]
                aContRg = [263, 310]
              end
        '158' : begin
                sDataPath = '2015/11/14/20151114_065738_3630008076/'
                nWaveWin = 3
                aLineRg = [198, 253]
                aContRg = [265, 328]
              end
        '159' : begin
                sDataPath = '2015/11/14/20151114_115009_3630008076/'
                nWaveWin = 3
                aLineRg = [198, 251]
                aContRg = [280, 328]
              end
        '160' : begin
                sDataPath = '2015/11/14/20151114_164420_3630088076/'
                nWaveWin = 3
                aLineRg = [198, 250]
                aContRg = [264, 311]
              end
        '161' : begin
                sDataPath = '2015/11/14/20151114_182010_3630088076/'
                nWaveWin = 3
                aLineRg = [200, 252]
                aContRg = [265, 309]
              end
        '162' : begin
                sDataPath = '2015/11/14/20151114_213511_3630088076/'
                nWaveWin = 3
                aLineRg = [200, 247]
                aContRg = [269, 316]
              end
        '163' : begin
                sDataPath = '2015/11/14/20151114_195741_3630088076/'
                nWaveWin = 3
                aLineRg = [200, 250]
                aContRg = [261, 307]
              end
        '164' : begin
                sDataPath = '2015/11/14/20151114_231241_3630088076/'
                nWaveWin = 3
                aLineRg = [199, 251]
                aContRg = [277, 325]
              end
        '165' : begin
                sDataPath = '2015/11/14/20151114_052029_3630008076/'
                nWaveWin = 3
                aLineRg = [195, 251]
                aContRg = [261, 309]
              end
        '166' : begin
                sDataPath = '2015/11/15/20151115_202020_3630008076/'
                nWaveWin = 3
                aLineRg = [198, 247]
                aContRg = [262, 308]
              end
        '167' : begin
                sDataPath = '2015/11/15/20151115_005011_3630088076/'
                nWaveWin = 3
                aLineRg = [197, 247]
                aContRg = [285, 341]
              end
        '168' : begin
                sDataPath = '2015/11/15/20151115_215744_3630008076/'
                nWaveWin = 3
                aLineRg = [198, 247]
                aContRg = [259, 320]
              end
        '169' : begin
                sDataPath = '2015/11/15/20151115_060407_3630088076/'
                nWaveWin = 3
                aLineRg = [200, 245]
                aContRg = [257, 306]
              end
        '170' : begin
                sDataPath = '2015/11/15/20151115_022838_3630088076/'
                nWaveWin = 3
                aLineRg = [196, 249]
                aContRg = [271, 317]
              end
        '171' : begin
                sDataPath = '2015/11/15/20151115_040512_3630088076/'
                nWaveWin = 3
                aLineRg = [196, 256]
                aContRg = [269, 314]
              end
        '172' : begin
                sDataPath = '2015/11/15/20151115_233514_3630008076/'
                nWaveWin = 3
                aLineRg = [187, 260]
                aContRg = [272, 322]
              end
        '173' : begin
                sDataPath = '2015/11/16/20151116_011350_3630088076/'
                nWaveWin = 3
                aLineRg = [193, 251]
                aContRg = [289, 333]
              end
        '174' : begin
                sDataPath = '2015/11/16/20151116_235746_3630088076/'
                nWaveWin = 3
                aLineRg = [191, 252]
                aContRg = [266, 311]
              end
        '175' : begin
                sDataPath = '2015/11/16/20151116_025014_3630088076/'
                nWaveWin = 3
                aLineRg = [192, 256]
                aContRg = [274, 327]
              end
        '176' : begin
                sDataPath = '2015/11/16/20151116_060515_3630088076/'
                nWaveWin = 3
                aLineRg = [190, 254]
                aContRg = [263, 300]
              end
        '177' : begin
                sDataPath = '2015/11/16/20151116_043457_3630088076/'
                nWaveWin = 3
                aLineRg = [193, 251]
                aContRg = [282, 322]
              end
        '178' : begin
                sDataPath = '2015/11/16/20151116_172823_3630088076/'
                nWaveWin = 3
                aLineRg = [190, 254]
                aContRg = [269, 318]
              end
        '179' : begin
                sDataPath = '2015/11/16/20151116_190516_3630088076/'
                nWaveWin = 3
                aLineRg = [193, 246]
                aContRg = [270, 311]
              end
        '180' : begin
                sDataPath = '2015/11/16/20151116_204246_3630088076/'
                nWaveWin = 3
                aLineRg = [194, 251]
                aContRg = [276, 334]
              end
        '181' : begin
                sDataPath = '2015/11/16/20151116_222016_3630088076/'
                nWaveWin = 3
                aLineRg = [193, 247]
                aContRg = [262, 312]
              end
        '182' : begin
                sDataPath = '2015/11/17/20151117_013516_3630088076/'
                nWaveWin = 3
                aLineRg = [192, 253]
                aContRg = [273, 321]
              end
        ;#endregion
        ;#region 22 (8)
        '183' : begin
                sDataPath = '2015/11/18/20151118_145420_3630088076/'
                nWaveWin = 3
                aLineRg = [194, 253]
                aContRg = [272, 318]
              end
        '184' : begin
                sDataPath = '2015/11/18/20151118_163017_3630088076/'
                nWaveWin = 3
                aLineRg = [194, 253]
                aContRg = [276, 327]
              end
        '185' : begin
                sDataPath = '2015/11/19/20151119_084517_3630088076/'
                nWaveWin = 3
                aLineRg = [198, 251]
                aContRg = [265, 323]
              end
        '186' : begin
                sDataPath = '2015/11/19/20151119_070747_3630088076/'
                nWaveWin = 3
                aLineRg = [196, 251]
                aContRg = [269, 333]
              end
        '187' : begin
                sDataPath = '2015/11/19/20151119_055002_3630088076/'
                nWaveWin = 3
                aLineRg = [197, 252]
                aContRg = [270, 329]
              end
        '188' : begin
                sDataPath = '2015/11/20/20151120_171550_3630008076/'
                nWaveWin = 3
                aLineRg = [192, 254]
                aContRg = [271, 323]
              end
        '189' : begin
                sDataPath = '2015/11/20/20151120_185245_3630008076/'
                nWaveWin = 3
                aLineRg = [194, 253]
                aContRg = [264, 328]
              end
        '190' : begin
                sDataPath = '2015/11/20/20151120_203015_3630008076/'
                nWaveWin = 3
                aLineRg = [196, 254]
                aContRg = [271, 352]
              end
        '191' : begin
                sDataPath = '2015/11/22/20151122_144510_3630088076/'
                nWaveWin = 3
                aLineRg = [192, 248]
                aContRg = [268, 320]
              end
        '192' : begin
                sDataPath = '2015/11/22/20151122_130740_3630088076/'
                nWaveWin = 3
                aLineRg = [195, 253]
                aContRg = [291, 337]
              end
        '193' : begin
                sDataPath = '2015/11/22/20151122_113020_3630088076/'
                nWaveWin = 3
                aLineRg = [193, 256]
                aContRg = [269, 327]
              end
        '194' : begin
                sDataPath = '2015/11/23/20151123_101520_3630088076/'
                nWaveWin = 3
                aLineRg = [191, 256]
                aContRg = [266, 321]
              end
        '195' : begin
                sDataPath = '2015/11/23/20151123_115237_3630088076/'
                nWaveWin = 3
                aLineRg = [193, 253]
                aContRg = [270, 318]
              end
        '196' : begin
                sDataPath = '2015/11/24/20151124_023004_3630088076/'
                nWaveWin = 3
                aLineRg = [191, 257]
                aContRg = [276, 330]
              end
        '197' : begin
                sDataPath = '2015/11/24/20151124_005320_3630088076/'
                nWaveWin = 3
                aLineRg = [193, 256]
                aContRg = [269, 319]
              end
        '198' : begin
                sDataPath = '2015/11/24/20151124_121708_3630088076/'
                nWaveWin = 3
                aLineRg = [191, 251]
                aContRg = [273, 327]
              end
        '199' : begin
                sDataPath = '2015/11/24/20151124_103726_3630088076/'
                nWaveWin = 3
                aLineRg = [191, 254]
                aContRg = [270, 330]
              end
        '200' : begin
                sDataPath = '2015/11/25/20151125_060922_3630088076/'
                nWaveWin = 3
                aLineRg = [192, 253]
                aContRg = [271, 332]
              end
        '201' : begin
                sDataPath = '2015/11/25/20151125_074500_3630088076/'
                nWaveWin = 3
                aLineRg = [190, 251]
                aContRg = [271, 323]
              end
        '202' : begin
                sDataPath = '2015/11/25/20151125_092230_3630088076/'
                nWaveWin = 3
                aLineRg = [193, 253]
                aContRg = [267, 333]
              end
        ;#endregion
        ;#region 23 (9)
        '203' : begin
                sDataPath = '2015/11/25/20151125_160004_3630088076/'
                nWaveWin = 3
                aLineRg = [195, 254]
                aContRg = [270, 321]
              end
        '204' : begin
                sDataPath = '2015/11/25/20151125_172958_3630088076/'
                nWaveWin = 3
                aLineRg = [194, 253]
                aContRg = [269, 331]
              end
        '205' : begin
                sDataPath = '2015/11/25/20151125_190728_3630088076/'
                nWaveWin = 3
                aLineRg = [194, 250]
                aContRg = [267, 337]
              end
        '206' : begin
                sDataPath = '2015/11/26/20151126_013727_3630088076/'
                nWaveWin = 3
                aLineRg = [194, 252]
                aContRg = [270, 320]
              end
        '207' : begin
                sDataPath = '2015/11/26/20151126_000553_3630088076/'
                nWaveWin = 3
                aLineRg = [193, 258]
                aContRg = [279, 330]
              end
        '208' : begin
                sDataPath = '2015/11/26/20151126_224431_3690088076/'
                nWaveWin = 1
                aLineRg = [974, 1074]
                aContRg = [1147, 1387]
              end
        '209' : begin
                sDataPath = '2015/11/27/20151127_002200_3690088076/'
                nWaveWin = 1
                aLineRg = [974, 1083]
                aContRg = [1145, 1374]
              end
        '210' : begin
                sDataPath = '2015/11/27/20151127_114427_3690088076/'
                nWaveWin = 1
                aLineRg = [977, 1074]
                aContRg = [1137, 1307]
              end
        '211' : begin
                sDataPath = '2015/11/27/20151127_015930_3690088076/'
                nWaveWin = 1
                aLineRg = [974, 1081]
                aContRg = [1154, 1361]
              end
        '212' : begin
                sDataPath = '2015/11/27/20151127_132157_3690088076/'
                nWaveWin = 1
                aLineRg = [972, 1070]
                aContRg = [1132, 1336]
              end
        '213' : begin
                sDataPath = '2015/11/27/20151127_230654_3690088076/'
                nWaveWin = 1
                aLineRg = [966, 1083]
                aContRg = [1137, 1338]
              end
        '214' : begin
                sDataPath = '2015/11/27/20151127_213017_3690088076/'
                nWaveWin = 1
                aLineRg = [979, 1077]
                aContRg = [1156, 1367]
              end
        '215' : begin
                sDataPath = '2015/11/27/20151127_145926_3690088076/'
                nWaveWin = 1
                aLineRg = [975, 1077]
                aContRg = [1147, 1349]
              end
        '216' : begin
                sDataPath = '2015/11/27/20151127_100700_3690088076/'
                nWaveWin = 1
                aLineRg = [977, 1085]
                aContRg = [1161, 1396]
              end
        '217' : begin
                sDataPath = '2015/11/28/20151128_022153_3690088076/'
                nWaveWin = 1
                aLineRg = [975, 1083]
                aContRg = [1137, 1292]
              end
        '218' : begin
                sDataPath = '2015/11/28/20151128_004424_3690088076/'
                nWaveWin = 1
                aLineRg = [963, 1090]
                aContRg = [1147, 1360]
              end
        '219' : begin
                sDataPath = '2015/11/28/20151128_170002_3690088076/'
                nWaveWin = 1
                aLineRg = [979, 1076]
                aContRg = [1143, 1387]
              end
        '220' : begin
                sDataPath = '2015/11/28/20151128_183648_3690088076/'
                nWaveWin = 1
                aLineRg = [986, 1072]
                aContRg = [1147, 1318]
              end
        '221' : begin
                sDataPath = '2015/11/28/20151128_201418_3690088076/'
                nWaveWin = 1
                aLineRg = [986, 1074]
                aContRg = [1127, 1374]
              end
        '222' : begin
                sDataPath = '2015/11/28/20151128_215147_3690088076/'
                nWaveWin = 1
                aLineRg = [980, 1079]
                aContRg = [1161, 1382]
              end
        '223' : begin
                sDataPath = '2015/11/29/20151129_105244_3690088076/'
                nWaveWin = 1
                aLineRg = [982, 1073]
                aContRg = [1115, 1326]
              end
        '224' : begin
                sDataPath = '2015/11/29/20151129_122913_3690088076/'
                nWaveWin = 1
                aLineRg = [977, 1083]
                aContRg = [1130, 1363]
              end
        '225' : begin
                sDataPath = '2015/11/29/20151129_140642_3690088076/'
                nWaveWin = 1
                aLineRg = [972, 1097]
                aContRg = [1152, 1343]
              end
        '226' : begin
                sDataPath = '2015/11/29/20151129_154412_3690088076/'
                nWaveWin = 1
                aLineRg = [981, 1088]
                aContRg = [1152, 1372]
              end
        '227' : begin
                sDataPath = '2015/11/30/20151130_111401_3690088076/'
                nWaveWin = 1
                aLineRg = [980, 1077]
                aContRg = [1148, 1384]
              end
        '228' : begin
                sDataPath = '2015/11/30/20151130_125135_3690088076/'
                nWaveWin = 1
                aLineRg = [979, 1088]
                aContRg = [1126, 1317]
              end
        '229' : begin
                sDataPath = '2015/11/30/20151130_142904_3690088076/'
                nWaveWin = 1
                aLineRg = [975, 1081]
                aContRg = [1124, 1353]
              end
        '230' : begin
                sDataPath = '2015/11/30/20151130_160634_3690088076/'
                nWaveWin = 1
                aLineRg = [977, 1071]
                aContRg = [1117, 1350]
              end
        '231' : begin
                sDataPath = '2015/11/30/20151130_223725_3690088076/'
                nWaveWin = 1
                aLineRg = [981, 1068]
                aContRg = [1139, 1390]
              end
        '232' : begin
                sDataPath = '2015/12/01/20151201_001401_3690088076/'
                nWaveWin = 1
                aLineRg = [979, 1081]
                aContRg = [1137, 1348]
              end
        '233' : begin
                sDataPath = '2015/12/01/20151201_015131_3690088076/'
                nWaveWin = 1
                aLineRg = [975, 1082]
                aContRg = [1117, 1393]
              end
        '234' : begin
                sDataPath = '2015/12/01/20151201_095911_3690088076/'
                nWaveWin = 1
                aLineRg = [981, 1070]
                aContRg = [1143, 1361]
              end
        '235' : begin
                sDataPath = '2015/12/01/20151201_113640_3690088076/'
                nWaveWin = 1
                aLineRg = [979, 1086]
                aContRg = [1130, 1388]
              end
        '236' : begin
                sDataPath = '2015/12/01/20151201_180637_3690088076/'
                nWaveWin = 1
                aLineRg = [982, 1079]
                aContRg = [1130, 1386]
              end
        '237' : begin
                sDataPath = '2015/12/01/20151201_194407_3690088076/'
                nWaveWin = 1
                aLineRg = [964, 1088]
                aContRg = [1128, 1362]
              end
        '238' : begin
                sDataPath = '2015/12/02/20151202_021405_3690088076/'
                nWaveWin = 1
                aLineRg = [970, 1082]
                aContRg = [1131, 1357]
              end
        '239' : begin
                sDataPath = '2015/12/02/20151202_052904_3690088076/'
                nWaveWin = 1
                aLineRg = [984, 1075]
                aContRg = [1173, 1364]
              end
        '240' : begin
                sDataPath = '2015/12/02/20151202_070633_3690088076/'
                nWaveWin = 1
                aLineRg = [975, 1075]
                aContRg = [1126, 1373]
              end
        '241' : begin
                sDataPath = '2015/12/02/20151202_182859_3690088076/'
                nWaveWin = 1
                aLineRg = [979, 1077]
                aContRg = [1135, 1350]
              end
        '242' : begin
                sDataPath = '2015/12/02/20151202_165131_3690088076/'
                nWaveWin = 1
                aLineRg = [977, 1075]
                aContRg = [1121, 1350]
              end
        '243' : begin
                sDataPath = '2015/12/03/20151203_023628_3690088076/'
                nWaveWin = 1
                aLineRg = [970, 1070]
                aContRg = [1146, 1384]
              end
        '244' : begin
                sDataPath = '2015/12/03/20151203_122122_3690088076/'
                nWaveWin = 1
                aLineRg = [961, 1087]
                aContRg = [1143, 1376]
              end
        '245' : begin
                sDataPath = '2015/12/03/20151203_202849_3690088076/'
                nWaveWin = 1
                aLineRg = [974, 1085]
                aContRg = [1137, 1423]
              end
        '246' : begin
                sDataPath = '2015/12/03/20151203_185119_3690088076/'
                nWaveWin = 1
                aLineRg = [963, 1092]
                aContRg = [1137, 1407]
              end
        ;#endregion
        ;#region 24 (10)
        '247' : begin
                sDataPath = '2015/12/04/20151204_142111_3690088076/'
                nWaveWin = 1
                aLineRg = [979, 1061]
                aContRg = [1119, 1312]
              end
        '248' : begin
                sDataPath = '2015/12/04/20151204_061345_3690088076/'
                nWaveWin = 1
                aLineRg = [997, 1065]
                aContRg = [1094, 1356]
              end
        '249' : begin
                sDataPath = '2015/12/04/20151204_205109_3690088076/'
                nWaveWin = 1
                aLineRg = [990, 1065]
                aContRg = [1112, 1569]
              end
        '250' : begin
                sDataPath = '2015/12/04/20151204_075114_3690088076/'
                nWaveWin = 1
                aLineRg = [986, 1071]
                aContRg = [1142, 1477]
              end
        '251' : begin
                sDataPath = '2015/12/04/20151204_155841_3690088076/'
                nWaveWin = 1
                aLineRg = [977, 1082]
                aContRg = [1121, 1564]
              end
        '252' : begin
                sDataPath = '2015/12/05/20151205_095202_3690088076/'
                nWaveWin = 1
                aLineRg = [980, 1071]
                aContRg = [1153, 1508]
              end
        '253' : begin
                sDataPath = '2015/12/05/20151205_113030_3690088076/'
                nWaveWin = 1
                aLineRg = [964, 1106]
                aContRg = [1164, 1577]
              end
        '254' : begin
                sDataPath = '2015/12/05/20151205_193856_3690088076/'
                nWaveWin = 1
                aLineRg = [979, 1094]
                aContRg = [1194, 1421]
              end
        '255' : begin
                sDataPath = '2015/12/05/20151205_211625_3690088076/'
                nWaveWin = 1
                aLineRg = [981, 1077]
                aContRg = [1121, 1430]
              end
        '256' : begin
                sDataPath = '2015/12/06/20151206_101323_3690088076/'
                nWaveWin = 1
                aLineRg = [988, 1079]
                aContRg = [1133, 1546]
              end
        '257' : begin
                sDataPath = '2015/12/06/20151206_034623_3690088076/'
                nWaveWin = 1
                aLineRg = [959, 1103]
                aContRg = [1145, 1556]
              end
        '258' : begin
                sDataPath = '2015/12/06/20151206_115058_3690088076/'
                nWaveWin = 1
                aLineRg = [975, 1079]
                aContRg = [1264, 1504]
              end
        '259' : begin
                sDataPath = '2015/12/06/20151206_195825_3690088076/'
                nWaveWin = 1
                aLineRg = [992, 1083]
                aContRg = [1139, 1527]
              end
        '260' : begin
                sDataPath = '2015/12/06/20151206_182049_3690088076/'
                nWaveWin = 1
                aLineRg = [996, 1068]
                aContRg = [1125, 1591]
              end
        '261' : begin
                sDataPath = '2015/12/07/20151207_040545_3690088076/'
                nWaveWin = 1
                aLineRg = [985, 1059]
                aContRg = [1107, 1449]
              end
        '262' : begin
                sDataPath = '2015/12/07/20151207_121312_3690088076/'
                nWaveWin = 1
                aLineRg = [985, 1068]
                aContRg = [1141, 1476]
              end
        '263' : begin
                sDataPath = '2015/12/07/20151207_184308_3690088076/'
                nWaveWin = 1
                aLineRg = [968, 1087]
                aContRg = [1139, 1582]
              end
        ;#endregion
        ;#region 25 (11)
        '264' : begin
                sDataPath = '2015/12/17/20151217_222619_3620008076/'
                nWaveWin = 3
                aLineRg = [187, 260]
                aContRg = [275, 346]
              end
        '265' : begin
                sDataPath = '2015/12/18/20151218_000419_3620008076/'
                nWaveWin = 3
                aLineRg = [195, 253]
                aContRg = [275, 345]
              end
        '266' : begin
                sDataPath = '2015/12/18/20151218_161913_3600104077/'
                nWaveWin = 2
                aLineRg = [84, 116]
                aContRg = [125, 161]
              end
        '267' : begin
                sDataPath = '2015/12/18/20151218_193313_3600104077/'
                nWaveWin = 2
                aLineRg = [83, 111]
                aContRg = [115, 156]
              end
        '268' : begin
                sDataPath = '2015/12/20/20151220_121049_3620008076/'
                nWaveWin = 3
                aLineRg = [195, 249]
                aContRg = [278, 343]
              end
        '269' : begin
                sDataPath = '2015/12/21/20151221_123319_3620008076/'
                nWaveWin = 3
                aLineRg = [194, 253]
                aContRg = [266, 344]
              end
        '270' : begin
                sDataPath = '2015/12/21/20151221_105519_3620008076/'
                nWaveWin = 3
                aLineRg = [196, 252]
                aContRg = [263, 338]
              end
        '271' : begin
                sDataPath = '2015/12/21/20151221_221819_3620008076/'
                nWaveWin = 3
                aLineRg = [195, 255]
                aContRg = [281, 345]
              end
        '272' : begin
                sDataPath = '2015/12/21/20151221_204013_3600104077/'
                nWaveWin = 2
                aLineRg = [87, 116]
                aContRg = [125, 171]
              end
        '273' : begin
                sDataPath = '2015/12/21/20151221_235519_3620008076/'
                nWaveWin = 3
                aLineRg = [194, 249]
                aContRg = [272, 347]
              end
        '274' : begin
                sDataPath = '2015/12/22/20151222_094111_3620008076/'
                nWaveWin = 3
                aLineRg = [192, 253]
                aContRg = [275, 339]
              end
        '275' : begin
                sDataPath = '2015/12/22/20151222_192611_3620008076/'
                nWaveWin = 3
                aLineRg = [186, 263]
                aContRg = [279, 349]
              end
        '276' : begin
                sDataPath = '2015/12/23/20151223_082911_3620008076/'
                nWaveWin = 3
                aLineRg = [193, 251]
                aContRg = [266, 348]
              end
        '277' : begin
                sDataPath = '2015/12/23/20151223_064911_3620008076/'
                nWaveWin = 3
                aLineRg = [192, 255]
                aContRg = [272, 343]
              end
        ;#endregion
        ;#region 26 (12)
        '278' : begin
                sDataPath = '2015/12/24/20151224_232701_3620008076/'
                nWaveWin = 3
                aLineRg = [195, 244]
                aContRg = [270, 336]
              end
        '279' : begin
                sDataPath = '2015/12/25/20151225_104901_3620008076/'
                nWaveWin = 3
                aLineRg = [183, 265]
                aContRg = [293, 359]
              end
        '280' : begin
                sDataPath = '2015/12/25/20151225_221401_3620008076/'
                nWaveWin = 3
                aLineRg = [182, 263]
                aContRg = [283, 355]
              end
        '281' : begin
                sDataPath = '2015/12/26/20151226_111400_3620008076/'
                nWaveWin = 3
                aLineRg = [186, 265]
                aContRg = [286, 355]
              end
        '282' : begin
                sDataPath = '2015/12/27/20151227_001301_3620008076/'
                nWaveWin = 3
                aLineRg = [194, 263]
                aContRg = [286, 353]
              end
        '283' : begin
                sDataPath = '2015/12/27/20151227_113400_3620008076/'
                nWaveWin = 3
                aLineRg = [194, 257]
                aContRg = [287, 348]
              end
        '284' : begin
                sDataPath = '2015/12/27/20151227_225700_3620008076/'
                nWaveWin = 3
                aLineRg = [189, 261]
                aContRg = [290, 353]
              end
        '285' : begin
                sDataPath = '2015/12/28/20151228_214200_3620008076/'
                nWaveWin = 3
                aLineRg = [197, 253]
                aContRg = [278, 346]
              end
        '286' : begin
                sDataPath = '2016/01/02/20160102_103021_3620008076/'
                nWaveWin = 3
                aLineRg = [187, 257]
                aContRg = [278, 350]
              end
        '287' : begin
                sDataPath = '2016/01/02/20160102_071521_3620008076/'
                nWaveWin = 3
                aLineRg = [187, 254]
                aContRg = [270, 353]
              end
        '288' : begin
                sDataPath = '2016/01/02/20160102_053821_3620008076/'
                nWaveWin = 3
                aLineRg = [183, 261]
                aContRg = [276, 351]
              end
        '289' : begin
                sDataPath = '2016/01/02/20160102_085321_3620008076/'
                nWaveWin = 3
                aLineRg = [187, 257]
                aContRg = [281, 342]
              end
        '290' : begin
                sDataPath = '2016/01/02/20160102_233023_3630008076/'
                nWaveWin = 3
                aLineRg = [187, 267]
                aContRg = [282, 358]
              end
        '291' : begin
                sDataPath = '2016/01/03/20160103_010721_3630008076/'
                nWaveWin = 3
                aLineRg = [186, 257]
                aContRg = [273, 341]
              end
        ;#endregion
        ;#region 27 (13)
        '292' : begin
                sDataPath = '2016/01/08/20160108_061411_3630008076/'
                nWaveWin = 3
                aLineRg = [187, 257]
                aContRg = [284, 353]
              end
        '293' : begin
                sDataPath = '2016/01/08/20160108_110511_3630008076/'
                nWaveWin = 3
                aLineRg = [192, 256]
                aContRg = [281, 345]
              end
        '294' : begin
                sDataPath = '2016/01/08/20160108_155811_3620008076/'
                nWaveWin = 3
                aLineRg = [192, 261]
                aContRg = [279, 343]
              end
        '295' : begin
                sDataPath = '2016/01/08/20160108_205011_3620008076/'
                nWaveWin = 3
                aLineRg = [194, 251]
                aContRg = [273, 352]
              end
        '296' : begin
                sDataPath = '2016/01/09/20160109_211211_3630008076/'
                nWaveWin = 3
                aLineRg = [200, 250]
                aContRg = [282, 350]
              end
        '297' : begin
                sDataPath = '2016/01/09/20160109_014311_3630008076/'
                nWaveWin = 3
                aLineRg = [195, 255]
                aContRg = [273, 343]
              end
        '298' : begin
                sDataPath = '2016/01/09/20160109_063511_3630008076/'
                nWaveWin = 3
                aLineRg = [195, 252]
                aContRg = [265, 336]
              end
        '299' : begin
                sDataPath = '2016/01/09/20160109_112811_3630008076/'
                nWaveWin = 3
                aLineRg = [194, 253]
                aContRg = [276, 343]
              end
        '300' : begin
                sDataPath = '2016/01/09/20160109_162011_3630008076/'
                nWaveWin = 3
                aLineRg = [191, 253]
                aContRg = [273, 324]
              end
        '301' : begin
                sDataPath = '2016/01/10/20160110_020511_3630008076/'
                nWaveWin = 3
                aLineRg = [193, 257]
                aContRg = [279, 350]
              end
        '302' : begin
                sDataPath = '2016/01/10/20160110_065711_3630008076/'
                nWaveWin = 3
                aLineRg = [195, 252]
                aContRg = [281, 344]
              end
        '303' : begin
                sDataPath = '2016/01/10/20160110_101211_3630008076/'
                nWaveWin = 3
                aLineRg = [197, 252]
                aContRg = [269, 348]
              end
        '304' : begin
                sDataPath = '2016/01/10/20160110_164211_3630008076/'
                nWaveWin = 3
                aLineRg = [200, 256]
                aContRg = [277, 346]
              end
        '305' : begin
                sDataPath = '2016/01/10/20160110_213511_3630008076/'
                nWaveWin = 3
                aLineRg = [200, 255]
                aContRg = [282, 348]
              end
        '306' : begin
                sDataPath = '2016/01/11/20160111_071911_3630008076/'
                nWaveWin = 3
                aLineRg = [201, 253]
                aContRg = [282, 358]
              end
        '307' : begin
                sDataPath = '2016/01/11/20160111_022711_3630008076/'
                nWaveWin = 3
                aLineRg = [197, 250]
                aContRg = [281, 346]
              end
        '308' : begin
                sDataPath = '2016/01/11/20160111_121211_3630008076/'
                nWaveWin = 3
                aLineRg = [196, 253]
                aContRg = [277, 347]
              end
        '309' : begin
                sDataPath = '2016/01/11/20160111_170411_3620008076/'
                nWaveWin = 3
                aLineRg = [198, 255]
                aContRg = [280, 343]
              end
        '310' : begin
                sDataPath = '2016/01/11/20160111_215711_3620008076/'
                nWaveWin = 3
                aLineRg = [203, 250]
                aContRg = [272, 340]
              end
        '311' : begin
                sDataPath = '2016/01/12/20160112_043009_3630008076/'
                nWaveWin = 3
                aLineRg = [201, 253]
                aContRg = [281, 343]
              end
        '312' : begin
                sDataPath = '2016/01/12/20160112_105909_3630008076/'
                nWaveWin = 3
                aLineRg = [195, 255]
                aContRg = [272, 333]
              end
        '313' : begin
                sDataPath = '2016/01/12/20160112_024911_3620008076/'
                nWaveWin = 3
                aLineRg = [197, 251]
                aContRg = [274, 322]
              end
        '314' : begin
                sDataPath = '2016/01/12/20160112_154909_3630008076/'
                nWaveWin = 3
                aLineRg = [196, 257]
                aContRg = [278, 348]
              end
        '315' : begin
                sDataPath = '2016/01/12/20160112_204109_3630008076/'
                nWaveWin = 3
                aLineRg = [203, 250]
                aContRg = [268, 335]
              end
        '316' : begin
                sDataPath = '2016/01/13/20160113_111909_3630008076/'
                nWaveWin = 3
                aLineRg = [198, 254]
                aContRg = [273, 334]
              end
        '317' : begin
                sDataPath = '2016/01/13/20160113_161409_3630008076/'
                nWaveWin = 3
                aLineRg = [197, 251]
                aContRg = [274, 339]
              end
        '318' : begin
                sDataPath = '2016/01/13/20160113_013409_3630008076/'
                nWaveWin = 3
                aLineRg = [194, 260]
                aContRg = [277, 337]
              end
        '319' : begin
                sDataPath = '2016/01/13/20160113_062909_3630008076/'
                nWaveWin = 3
                aLineRg = [197, 254]
                aContRg = [276, 341]
              end
        '320' : begin
                sDataPath = '2016/01/13/20160113_210409_3630008076/'
                nWaveWin = 3
                aLineRg = [200, 249]
                aContRg = [262, 328]
              end
        '321' : begin
                sDataPath = '2016/01/14/20160114_100409_3630008076/'
                nWaveWin = 3
                aLineRg = [197, 250]
                aContRg = [270, 336]
              end
        '322' : begin
                sDataPath = '2016/01/14/20160114_051409_3630008076/'
                nWaveWin = 3
                aLineRg = [197, 253]
                aContRg = [270, 345]
              end
        ;'323' : begin
        ;       sDataPath = '2016/01/14/20160114_145609_3630008076/'
        ;       nWaveWin = 3
        ;       aLineRg = [0, 0]
        ;       aContRg = [0, 0]
        ;     end
        ;'324' : begin
        ;       sDataPath = '2016/01/14/20160114_194909_3630008076/'
        ;       nWaveWin = 3
        ;       aLineRg = [0, 0]
        ;       aContRg = [0, 0]
        ;     end
        '325' : begin
                sDataPath = '2016/01/14/20160114_230409_3630008076/'
                nWaveWin = 3
                aLineRg = [195, 253]
                aContRg = [282, 346]
              end
        '326' : begin
                sDataPath = '2016/01/15/20160115_232919_3630008076/'
                nWaveWin = 3
                aLineRg = [181, 273]
                aContRg = [286, 358]
              end
        '327' : begin
                sDataPath = '2016/01/15/20160115_053419_3630008076/'
                nWaveWin = 3
                aLineRg = [189, 263]
                aContRg = [285, 349]
              end
        '328' : begin
                sDataPath = '2016/01/15/20160115_120419_3630008076/'
                nWaveWin = 3
                aLineRg = [180, 264]
                aContRg = [295, 356]
              end
        '329' : begin
                sDataPath = '2016/01/15/20160115_183419_3630008076/'
                nWaveWin = 3
                aLineRg = [184, 264]
                aContRg = [284, 348]
              end
        '330' : begin
                sDataPath = '2016/01/16/20160116_042009_3630008076/'
                nWaveWin = 3
                aLineRg = [180, 261]
                aContRg = [284, 344]
              end
        '331' : begin
                sDataPath = '2016/01/16/20160116_104709_3630008076/'
                nWaveWin = 3
                aLineRg = [183, 261]
                aContRg = [287, 355]
              end
        ;'332' : begin
        ;       sDataPath = '2016/01/16/20160116_171709_3630008076/'
        ;       nWaveWin = 3
        ;       aLineRg = [0, 0]
        ;       aContRg = [0, 0]
        ;     end
        '333' : begin
                sDataPath = '2016/01/17/20160117_110909_3630008076/'
                nWaveWin = 3
                aLineRg = [193, 257]
                aContRg = [274, 336]
              end
        ;'334' : begin
        ;       sDataPath = '2016/01/17/20160117_191909_3630008076/'
        ;       nWaveWin = 3
        ;       aLineRg = [0, 0]
        ;       aContRg = [0, 0]
        ;     end
        '335' : begin
                sDataPath = '2016/01/17/20160117_012509_3630008076/'
                nWaveWin = 3
                aLineRg = [190, 253]
                aContRg = [268, 339]
              end
        '336' : begin
                sDataPath = '2016/01/18/20160118_113409_3630008076/'
                nWaveWin = 3
                aLineRg = [194, 253]
                aContRg = [279, 346]
              end
        '337' : begin
                sDataPath = '2016/01/18/20160118_032409_3630008076/'
                nWaveWin = 3
                aLineRg = [190, 257]
                aContRg = [282, 348]
              end
        ;#endregion
        ;#region 28 (14)
        '338' : begin
                sDataPath = '2016/01/16/20160116_154009_3630008076/'
                nWaveWin = 3
                aLineRg = [194, 260]
                aContRg = [282, 342]
              end
        '339' : begin
                sDataPath = '2016/01/16/20160116_234709_3630008076/'
                nWaveWin = 3
                aLineRg = [195, 255]
                aContRg = [274, 335]
              end
        '340' : begin
                sDataPath = '2016/01/17/20160117_093209_3630008076/'
                nWaveWin = 3
                aLineRg = [196, 252]
                aContRg = [262, 338]
              end
        '341' : begin
                sDataPath = '2016/01/17/20160117_173909_3630008076/'
                nWaveWin = 3
                aLineRg = [190, 257]
                aContRg = [279, 353]
              end
        '342' : begin
                sDataPath = '2016/01/18/20160118_095409_3630008076/'
                nWaveWin = 3
                aLineRg = [194, 250]
                aContRg = [266, 337]
              end
        '343' : begin
                sDataPath = '2016/01/18/20160118_014909_3630008076/'
                nWaveWin = 3
                aLineRg = [192, 258]
                aContRg = [274, 350]
              end
        '344' : begin
                sDataPath = '2016/01/18/20160118_211711_3630008076/'
                nWaveWin = 3
                aLineRg = [202, 247]
                aContRg = [266, 342]
              end
        '345' : begin
                sDataPath = '2016/01/19/20160119_101711_3630008076/'
                nWaveWin = 3
                aLineRg = [198, 254]
                aContRg = [264, 340]
              end
        '346' : begin
                sDataPath = '2016/01/19/20160119_034711_3630008076/'
                nWaveWin = 3
                aLineRg = [194, 253]
                aContRg = [274, 336]
              end
        '347' : begin
                sDataPath = '2016/01/19/20160119_133311_3630008076/'
                nWaveWin = 3
                aLineRg = [194, 253]
                aContRg = [268, 339]
              end
        '348' : begin
                sDataPath = '2016/01/19/20160119_003311_3630008076/'
                nWaveWin = 3
                aLineRg = [194, 250]
                aContRg = [276, 334]
              end
        '349' : begin
                sDataPath = '2016/01/19/20160119_164811_3630008076/'
                nWaveWin = 3
                aLineRg = [197, 252]
                aContRg = [293, 360]
              end
        '350' : begin
                sDataPath = '2016/01/19/20160119_231711_3630008076/'
                nWaveWin = 3
                aLineRg = [193, 256]
                aContRg = [281, 339]
              end
        '351' : begin
                sDataPath = '2016/01/20/20160120_090100_3630008076/'
                nWaveWin = 3
                aLineRg = [197, 249]
                aContRg = [265, 347]
              end
        '352' : begin
                sDataPath = '2016/01/20/20160120_023211_3630008076/'
                nWaveWin = 3
                aLineRg = [193, 255]
                aContRg = [289, 353]
              end
        '353' : begin
                sDataPath = '2016/01/20/20160120_072221_3630008076/'
                nWaveWin = 3
                aLineRg = [199, 249]
                aContRg = [270, 334]
              end
        '354' : begin
                sDataPath = '2016/01/21/20160121_011721_3620008076/'
                nWaveWin = 3
                aLineRg = [198, 249]
                aContRg = [269, 339]
              end
        '355' : begin
                sDataPath = '2016/01/21/20160121_025321_3620008076/'
                nWaveWin = 3
                aLineRg = [201, 251]
                aContRg = [269, 345]
              end
        '356' : begin
                sDataPath = '2016/01/22/20160122_094421_3620008076/'
                nWaveWin = 3
                aLineRg = [199, 248]
                aContRg = [269, 334]
              end
        ;#endregion
        ;#region 29 (15)
        '357' : begin
                sDataPath = '2016/01/21/20160121_105921_3620008076/'
                nWaveWin = 3
                aLineRg = [194, 252]
                aContRg = [286, 358]
              end
        '358' : begin
                sDataPath = '2016/01/22/20160122_112221_3630008076/'
                nWaveWin = 3
                aLineRg = [193, 253]
                aContRg = [267, 338]
              end
        '359' : begin
                sDataPath = '2016/01/22/20160122_000121_3620008076/'
                nWaveWin = 3
                aLineRg = [192, 257]
                aContRg = [273, 342]
              end
        '360' : begin
                sDataPath = '2016/01/22/20160122_161521_3630008076/'
                nWaveWin = 3
                aLineRg = [195, 253]
                aContRg = [279, 347]
              end
        '361' : begin
                sDataPath = '2016/01/22/20160122_045221_3630008076/'
                nWaveWin = 3
                aLineRg = [193, 251]
                aContRg = [264, 322]
              end
        '362' : begin
                sDataPath = '2016/01/22/20160122_224521_3630008076/'
                nWaveWin = 3
                aLineRg = [196, 253]
                aContRg = [271, 338]
              end
        '363' : begin
                sDataPath = '2016/01/23/20160123_145921_3620008076/'
                nWaveWin = 3
                aLineRg = [194, 255]
                aContRg = [273, 347]
              end
        '364' : begin
                sDataPath = '2016/01/23/20160123_050456_3620008076/'
                nWaveWin = 3
                aLineRg = [198, 246]
                aContRg = [269, 359]
              end
        '365' : begin
                sDataPath = '2016/01/23/20160123_231519_3620008076/'
                nWaveWin = 3
                aLineRg = [193, 252]
                aContRg = [273, 348]
              end
        '366' : begin
                sDataPath = '2016/01/24/20160124_152019_3620008076/'
                nWaveWin = 3
                aLineRg = [197, 253]
                aContRg = [284, 345]
              end
        '367' : begin
                sDataPath = '2016/01/24/20160124_120519_3620008076/'
                nWaveWin = 3
                aLineRg = [194, 253]
                aContRg = [279, 356]
              end
        '368' : begin
                sDataPath = '2016/01/24/20160124_035819_3630008076/'
                nWaveWin = 3
                aLineRg = [195, 253]
                aContRg = [270, 347]
              end
        '369' : begin
                sDataPath = '2016/01/24/20160124_214959_3620008076/'
                nWaveWin = 3
                aLineRg = [201, 252]
                aContRg = [277, 344]
              end
        '370' : begin
                sDataPath = '2016/01/25/20160125_140919_3630008076/'
                nWaveWin = 3
                aLineRg = [194, 253]
                aContRg = [273, 341]
              end
        '371' : begin
                sDataPath = '2016/01/25/20160125_024319_3630008076/'
                nWaveWin = 3
                aLineRg = [192, 257]
                aContRg = [280, 361]
              end
        '372' : begin
                sDataPath = '2016/01/25/20160125_235419_3630008076/'
                nWaveWin = 3
                aLineRg = [196, 250]
                aContRg = [270, 331]
              end
        ;#endregion
        ;#region 30 (16)
        '373' : begin
                sDataPath = '2016/01/29/20160129_104421_3630008076/'
                nWaveWin = 3
                aLineRg = [196, 251]
                aContRg = [264, 345]
              end
        '374' : begin
                sDataPath = '2016/01/29/20160129_185921_3630008076/'
                nWaveWin = 3
                aLineRg = [192, 261]
                aContRg = [281, 350]
              end
        '375' : begin
                sDataPath = '2016/01/30/20160130_092621_3630008076/'
                nWaveWin = 3
                aLineRg = [199, 246]
                aContRg = [264, 347]
              end
        '376' : begin
                sDataPath = '2016/01/30/20160130_155621_3630008076/'
                nWaveWin = 3
                aLineRg = [188, 257]
                aContRg = [285, 354]
              end
        '377' : begin
                sDataPath = '2016/01/30/20160130_025921_3630008076/'
                nWaveWin = 3
                aLineRg = [191, 252]
                aContRg = [271, 323]
              end
        '378' : begin
                sDataPath = '2016/01/31/20160131_130321_3630008076/'
                nWaveWin = 3
                aLineRg = [191, 254]
                aContRg = [268, 336]
              end
        '379' : begin
                sDataPath = '2016/01/31/20160131_014121_3630008076/'
                nWaveWin = 3
                aLineRg = [190, 253]
                aContRg = [276, 346]
              end
        '380' : begin
                sDataPath = '2016/02/01/20160201_132521_3630008076/'
                nWaveWin = 3
                aLineRg = [189, 258]
                aContRg = [268, 332]
              end
        '381' : begin
                sDataPath = '2016/02/01/20160201_020321_3630008076/'
                nWaveWin = 3
                aLineRg = [195, 257]
                aContRg = [269, 343]
              end
        '382' : begin
                sDataPath = '2016/02/02/20160202_004721_3630008076/'
                nWaveWin = 3
                aLineRg = [188, 260]
                aContRg = [291, 349]
              end
        ;#endregion
        ;#region 31 (17)
        '383' : begin
                sDataPath = '2016/02/06/20160206_115821_3630008076/'
                nWaveWin = 3
                aLineRg = [190, 257]
                aContRg = [277, 355]
              end
        '384' : begin
                sDataPath = '2016/02/06/20160206_214251_3630008076/'
                nWaveWin = 3
                aLineRg = [187, 253]
                aContRg = [277, 355]
              end
        '385' : begin
                sDataPath = '2016/02/06/20160206_070548_3630008076/'
                nWaveWin = 3
                aLineRg = [187, 248]
                aContRg = [266, 365]
              end
        '386' : begin
                sDataPath = '2016/02/07/20160207_090521_3630008076/'
                nWaveWin = 3
                aLineRg = [190, 252]
                aContRg = [274, 346]
              end
        '387' : begin
                sDataPath = '2016/02/07/20160207_023521_3630008076/'
                nWaveWin = 3
                aLineRg = [189, 260]
                aContRg = [280, 347]
              end
        '388' : begin
                sDataPath = '2016/02/07/20160207_121956_3630008076/'
                nWaveWin = 3
                aLineRg = [190, 256]
                aContRg = [272, 346]
              end
        '389' : begin
                sDataPath = '2016/02/07/20160207_220451_3630008076/'
                nWaveWin = 3
                aLineRg = [191, 243]
                aContRg = [272, 342]
              end
        '390' : begin
                sDataPath = '2016/02/08/20160208_074923_3620008076/'
                nWaveWin = 3
                aLineRg = [194, 248]
                aContRg = [269, 342]
              end
        '391' : begin
                sDataPath = '2016/02/08/20160208_141921_3620008076/'
                nWaveWin = 3
                aLineRg = [183, 257]
                aContRg = [275, 349]
              end
        ;'392' : begin
        ;       sDataPath = '2016/02/08/20160208_204921_3620008076/'
        ;       nWaveWin = 3
        ;       aLineRg = [0, 0]
        ;       aContRg = [0, 0]
        ;     end
        ;'393' : begin
        ;       sDataPath = '2016/02/09/20160209_063401_3630008076/'
        ;       nWaveWin = 3
        ;       aLineRg = [0, 0]
        ;       aContRg = [0, 0]
        ;     end
        '394' : begin
                sDataPath = '2016/02/09/20160209_014121_3620008076/'
                nWaveWin = 3
                aLineRg = [187, 250]
                aContRg = [284, 359]
              end
        '395' : begin
                sDataPath = '2016/02/09/20160209_130351_3630008076/'
                nWaveWin = 3
                aLineRg = [192, 241]
                aContRg = [260, 332]
              end
        '396' : begin
                sDataPath = '2016/02/09/20160209_211119_3630008076/'
                nWaveWin = 3
                aLineRg = [191, 250]
                aContRg = [262, 363]
              end
        '397' : begin
                sDataPath = '2016/02/10/20160210_083249_3630008076/'
                nWaveWin = 3
                aLineRg = [187, 248]
                aContRg = [278, 344]
              end
        '398' : begin
                sDataPath = '2016/02/10/20160210_020332_3630008076/'
                nWaveWin = 3
                aLineRg = [191, 252]
                aContRg = [265, 343]
              end
        ;'399' : begin
        ;       sDataPath = '2016/02/10/20160210_150234_3630008076/'
        ;       nWaveWin = 3
        ;       aLineRg = [0, 0]
        ;       aContRg = [0, 0]
        ;     end
        '400' : begin
                sDataPath = '2016/02/10/20160210_213319_3630008076/'
                nWaveWin = 3
                aLineRg = [187, 250]
                aContRg = [280, 358]
              end
        ;'401' : begin
        ;       sDataPath = '2016/02/11/20160211_022439_3630008076/'
        ;       nWaveWin = 3
        ;       aLineRg = [0, 0]
        ;       aContRg = [0, 0]
        ;     end
        '402' : begin
                sDataPath = '2016/02/11/20160211_055900_3630008076/'
                nWaveWin = 3
                aLineRg = [185, 253]
                aContRg = [274, 345]
              end
        '403' : begin
                sDataPath = '2016/02/11/20160211_201719_3630008076/'
                nWaveWin = 3
                aLineRg = [190, 245]
                aContRg = [272, 356]
              end
        '404' : begin
                sDataPath = '2016/02/11/20160211_120919_3620008076/'
                nWaveWin = 3
                aLineRg = [187, 250]
                aContRg = [273, 346]
              end
        '405' : begin
                sDataPath = '2016/02/12/20160212_025419_3630008076/'
                nWaveWin = 3
                aLineRg = [183, 252]
                aContRg = [285, 359]
              end
        ;#endregion
        ;#region 32 (18)
        '406' : begin
                sDataPath = '2016/02/26/20160226_054411_3620258078/'
                nWaveWin = 3
                aLineRg = [96, 127]
                aContRg = [138, 177]
              end
        '407' : begin
                sDataPath = '2016/02/26/20160226_145011_3620258078/'
                nWaveWin = 3
                aLineRg = [97, 128]
                aContRg = [139, 178]
              end
        '408' : begin
                sDataPath = '2016/02/27/20160227_074513_3620258078/'
                nWaveWin = 3
                aLineRg = [91, 130]
                aContRg = [143, 177]
              end
        '409' : begin
                sDataPath = '2016/02/27/20160227_165111_3620258078/'
                nWaveWin = 3
                aLineRg = [95, 131]
                aContRg = [138, 177]
              end
        ;'410' : begin
        ;       sDataPath = '2016/02/27/20160227_135056_3620258078/'
        ;       nWaveWin = 3
        ;       aLineRg = [0, 0]
        ;       aContRg = [0, 0]
        ;     end
        '411' : begin
                sDataPath = '2016/02/28/20160228_032041_3620258078/'
                nWaveWin = 3
                aLineRg = [96, 133]
                aContRg = [139, 174]
              end
        ;'412' : begin
        ;       sDataPath = '2016/02/28/20160228_153411_3620258078/'
        ;       nWaveWin = 3
        ;       aLineRg = [0, 0]
        ;       aContRg = [0, 0]
        ;     end
        '413' : begin
                sDataPath = '2016/02/28/20160228_094211_3620258078/'
                nWaveWin = 3
                aLineRg = [94, 129]
                aContRg = [141, 179]
              end
        ;'414' : begin
        ;       sDataPath = '2016/02/28/20160228_233811_3620258078/'
        ;       nWaveWin = 3
        ;       aLineRg = [0, 0]
        ;       aContRg = [0, 0]
        ;     end
        '415' : begin
                sDataPath = '2016/02/29/20160229_192111_3620258078/'
                nWaveWin = 3
                aLineRg = [97, 128]
                aContRg = [136, 178]
              end
        '416' : begin
                sDataPath = '2016/02/29/20160229_100511_3620258078/'
                nWaveWin = 3
                aLineRg = [98, 127]
                aContRg = [144, 176]
              end
        '417' : begin
                sDataPath = '2016/02/29/20160229_051141_3620258078/'
                nWaveWin = 3
                aLineRg = [95, 132]
                aContRg = [140, 183]
              end
        '418' : begin
                sDataPath = '2016/03/01/20160301_023441_3620258078/'
                nWaveWin = 3
                aLineRg = [98, 132]
                aContRg = [143, 184]
              end
        ;#endregiaon
        ;#region QS 33
        '419' : begin
            sDataPath = '2014/07/01/20140701_062609_3893012099/'
                nWaveWin = 1
                aLineRg = [973, 1094]
                aContRg = [1152, 1364]
              end
        '420' : begin
            sDataPath = '2014/07/03/20140703_153609_3893012099/'
                nWaveWin = 1
                aLineRg = [988, 1070]
                aContRg = [1136, 1289]
              end
        '421' : begin
            sDataPath = '2014/07/06/20140706_221109_3893012099/'
                nWaveWin = 1
                aLineRg = [985, 1083]
                aContRg = [1131, 1288]
              end
        '422' : begin
            sDataPath = '2014/07/08/20140708_044107_3893012099/'
                nWaveWin = 1
                aLineRg = [981, 1085]
                aContRg = [1160, 1340]
              end
        '423' : begin
            sDataPath = '2014/07/10/20140710_052016_3893012099/'
                nWaveWin = 1
                aLineRg = [967, 1074]
                aContRg = [1168, 1411]
              end
        ;#endregion
        ;#region QS 34
        '424' : begin
            sDataPath = '2014/07/13/20140713_034539_3893012099/'
                nWaveWin = 1
                aLineRg = [972, 1082]
                aContRg = [1149, 1367]
              end
        '425' : begin
            sDataPath = '2014/07/15/20140715_111309_3893012099/'
                nWaveWin = 1
                aLineRg = [970, 1079]
                aContRg = [1121, 1275]
              end
        '426' : begin
            sDataPath = '2014/07/17/20140717_161109_3893012099/'
                nWaveWin = 1
                aLineRg = [976, 1078]
                aContRg = [1115, 1389]
              end
        '427' : begin
            sDataPath = '2014/07/20/20140720_154352_3893012099/'
                nWaveWin = 1
                aLineRg = [988, 1083]
                aContRg = [1121, 1203]
              end
        '428' : begin
            sDataPath = '2014/07/22/20140722_154407_3893012099/'
                nWaveWin = 1
                aLineRg = [979, 1083]
                aContRg = [1149, 1412]
              end
        '429' : begin
            sDataPath = '2014/07/24/20140724_050107_3893012099/'
                nWaveWin = 1
                aLineRg = [983, 1080]
                aContRg = [1138, 1416]
              end
        ;#endregion
        ;#region QSs 35
        '430' : begin
            sDataPath = '2014/07/27/20140727_134107_3893012099/'
                nWaveWin = 1
                aLineRg = [979, 1077]
                aContRg = [1140, 1319]
              end
        '431' : begin
            sDataPath = '2014/07/29/20140729_054609_3893012099/'
                nWaveWin = 1
                aLineRg = [975, 1079]
                aContRg = [1132, 1406]
              end
        '432' : begin
            sDataPath = '2015/05/10/20150510_050907_3893012099/'
                nWaveWin = 1
                aLineRg = [981, 1065]
                aContRg = [1192, 1381]
              end
        '433' : begin
            sDataPath = '2015/05/14/20150514_045234_3893012099/'
                nWaveWin = 1
                aLineRg = [988, 1066]
                aContRg = [1167, 1415]
              end
        '434' : begin
            sDataPath = '2015/06/09/20150609_051510_3893012099/'
                nWaveWin = 1
                aLineRg = [979, 1063]
                aContRg = [1186, 1432]
              end
        '435' : begin
            sDataPath = '2015/06/14/20150614_150248_3893012099/'
                nWaveWin = 1
                aLineRg = [972, 1065]
                aContRg = [1266, 1448]
              end
        '436' : begin
            sDataPath = '2016/02/23/20160223_053127_3893012099/'
                nWaveWin = 1
                aLineRg = [972, 1071]
                aContRg = [1184, 1438]
              end
        '437' : begin
            sDataPath = '2016/03/03/20160303_051512_3893012099/'
                nWaveWin = 1
                aLineRg = [977, 1072]
                aContRg = [1247, 1441]
              end
        '438' : begin
            sDataPath = '2016/03/05/20160305_074412_3893012099/'
                nWaveWin = 1
                aLineRg = [972, 1077]
                aContRg = [1125, 1441]
              end
        '439' : begin
            sDataPath = '2016/03/06/20160306_081805_3893012099/'
                nWaveWin = 1
                aLineRg = [968, 1066]
                aContRg = [1127, 1366]
              end
        '440' : begin
            sDataPath = '2016/03/27/20160327_053533_3893012099/'
                nWaveWin = 1
                aLineRg = [977, 1085]
                aContRg = [1230, 1427]
              end
        '441' : begin
            sDataPath = '2016/04/07/20160407_050433_3893012099/'
                nWaveWin = 1
                aLineRg = [977, 1078]
                aContRg = [1169, 1445]
              end
        '442' : begin
            sDataPath = '2016/05/10/20160510_051451_3893012099/'
                nWaveWin = 1
                aLineRg = [988, 1060]
                aContRg = [1244, 1546]
              end
        '443' : begin
            sDataPath = '2016/05/12/20160512_054958_3893012099/'
                nWaveWin = 1
                aLineRg = [987, 1056]
                aContRg = [1091, 1312]
              end
        '444' : begin
            sDataPath = '2016/05/15/20160515_171455_3893012099/'
                nWaveWin = 1
                aLineRg = [988, 1063]
                aContRg = [1172, 1415]
              end
        '445' : begin
            sDataPath = '2016/05/17/20160517_051325_3893012099/'
                nWaveWin = 1
                aLineRg = [992, 1070]
                aContRg = [1125, 1271]
              end
        ;endregion
        ;#region QS 36
        '446' : begin
            sDataPath = '2016/06/30/20160630_052003_3893012099/'
                nWaveWin = 1
                aLineRg = [982, 1074]
                aContRg = [1154, 1417]
              end
        '447' : begin
            sDataPath = '2016/07/03/20160703_032343_3893012099/'
                nWaveWin = 1
                aLineRg = [984, 1070]
                aContRg = [1108, 1364]
              end
        '448' : begin
            sDataPath = '2016/07/05/20160705_021533_3893012099/'
                nWaveWin = 1
                aLineRg = [983, 1074]
                aContRg = [1115, 1336]
              end
        ;#endregion
        ;#region QS 37
        '449' : begin
            sDataPath = '2014/07/01/20140701_062609_3893012099/'
                nWaveWin = 1
                aLineRg = [981, 1077]
                aContRg = [1154, 1404]
              end
        '450' : begin
            sDataPath = '2014/07/03/20140703_153609_3893012099/'
                nWaveWin = 1
                aLineRg = [988, 1074]
                aContRg = [1098, 1286]
              end
        '451' : begin
            sDataPath = '2014/07/06/20140706_221109_3893012099/'
                nWaveWin = 1
                aLineRg = [992, 1069]
                aContRg = [1111, 1290]
              end
        '452' : begin
            sDataPath = '2014/07/08/20140708_044107_3893012099/'
                nWaveWin = 1
                aLineRg = [970, 1070]
                aContRg = [1132, 1346]
              end
        '453' : begin
            sDataPath = '2014/07/10/20140710_052016_3893012099/'
                nWaveWin = 1
                aLineRg = [968, 1069]
                aContRg = [1158, 1409]
              end
        '454' : begin
            sDataPath = '2014/07/13/20140713_034539_3893012099/'
                nWaveWin = 1
                aLineRg = [972, 1069]
                aContRg = [1136, 1418]
              end
        '455' : begin
            sDataPath = '2014/07/15/20140715_111309_3893012099/'
                nWaveWin = 1
                aLineRg = [975, 1068]
                aContRg = [1105, 1264]
              end
        '456' : begin
            sDataPath = '2014/07/17/20140717_161109_3893012099/'
                nWaveWin = 1
                aLineRg = [994, 1076]
                aContRg = [1111, 1378]
              end
        '457' : begin
            sDataPath = '2014/07/20/20140720_154352_3893012099/'
                nWaveWin = 1
                aLineRg = [990, 1076]
                aContRg = [1110, 1200]
              end
        '458' : begin
            sDataPath = '2014/07/22/20140722_154407_3893012099/'
                nWaveWin = 1
                aLineRg = [987, 1083]
                aContRg = [1153, 1431]
              end
        '459' : begin
            sDataPath = '2014/07/24/20140724_050107_3893012099/'
                nWaveWin = 1
                aLineRg = [992, 1069]
                aContRg = [1155, 1409]
              end
        '460' : begin
            sDataPath = '2014/07/27/20140727_134107_3893012099/'
                nWaveWin = 1
                aLineRg = [988, 1070]
                aContRg = [1125, 1309]
              end
        '461' : begin
            sDataPath = '2014/07/29/20140729_054609_3893012099/'
                nWaveWin = 1
                aLineRg = [990, 1085]
                aContRg = [1114, 1306]
              end
        ;#endregion
        else : message,'Do not exist this event number: ' + sEvtNum
      endcase
  endif $
  else if (sLineID eq 'SIIV1403') then begin
      case sEvtNum of
        ;#region case 1
        ; No SIIV 1403
        ;#endregion
        ;#region case 2
        ; No SIIV 1403
        ;#endregion
        ;#region case 3
        ; No SIIV 1403
        ;#endregion
        ;#region case 4
        ; No SIIV 1403
        ;#endregion
        ;#region case 5
        ; No SIIV 1403
        ;#endregion
        ;#region case 6
        ; No SIIV 1403
        ;#endregion
        ;#region case 7
        ; No SIIV 1403
        ;#endregion
        ;#region case 8
        ; No SIIV 1403
        ;#endregion
        ;#region case 9
        ; No SIIV 1403
        ;#endregion
        ;#region case 10
        ; No SIIV 1403
        ;#endregion
        ;#region case 11
        ; No SIIV 1403
        ;#endregion
        ;#region case 12
        ; No SIIV 1403
        ;#endregion
        ;#region case 13
        ; No SIIV 1403
        ;#endregion
        ;#region case 14
        ; No SIIV 1403
        ;#endregion
        ;#region case 15
        '86' : begin
                sDataPath = '2014/07/04/20140704_114030_3824263396/'
                nWaveWin = 4
                aLineRg = [146, 178]
                aContRg = [191, 227]
              end
        '87' : begin
                sDataPath = '2014/07/05/20140705_230030_3824263396/'
                nWaveWin = 4
                aLineRg = [146, 177]
                aContRg = [189, 230]
              end
        '88' : begin
                sDataPath = '2014/07/07/20140707_233530_3824263396/'
                nWaveWin = 4
                aLineRg = [142, 184]
                aContRg = [193, 231]
              end
        '89' : begin
                sDataPath = '2014/07/08/20140708_192613_3824263396/'
                nWaveWin = 4
                aLineRg = [145, 179]
                aContRg = [186, 224]
              end
        '90' : begin
                sDataPath = '2014/07/09/20140709_202030_3824263396/'
                nWaveWin = 4
                aLineRg = [142, 179]
                aContRg = [190, 232]
              end
        '91' : begin
                sDataPath = '2014/07/10/20140710_123030_3824263396/'
                nWaveWin = 4
                aLineRg = [143, 183]
                aContRg = [191, 226]
              end
        '92' : begin
                sDataPath = '2014/07/12/20140712_001628_3824263396/'
                nWaveWin = 4
                aLineRg = [142, 188]
                aContRg = [194, 230]
              end
        '93' : begin
                sDataPath = '2014/07/12/20140712_121730_3824263396/'
                nWaveWin = 4
                aLineRg = [143, 183]
                aContRg = [193, 232]
              end
        ;#endregion
        ;#region case 16
        ; No SIIV 1394
        ; No SIIV 1403
        ;#endregion
        ;#region case 17
        '107' : begin
                sDataPath = '2014/08/15/20140815_070803_3800258196/'
                nWaveWin = 3
                aLineRg = [156, 202]
                aContRg = [208, 245]
              end
        ;'108' : begin
        ;       sDataPath = '2014/08/15/20140815_223609_3880012196/'
        ;       nWaveWin = 3
        ;       aLineRg = [0, 0]
        ;       aContRg = [0, 0]
        ;     end
        '109' : begin
                sDataPath = '2014/08/16/20140816_211749_3800258196/'
                nWaveWin = 3
                aLineRg = [159, 193]
                aContRg = [204, 252]
              end
        '110' : begin
                sDataPath = '2014/08/17/20140817_214403_3800258196/'
                nWaveWin = 3
                aLineRg = [158, 197]
                aContRg = [205, 241]
              end
        ;#endregion
        ;#region case 18
        '111' : begin
                sDataPath = '2015/02/13/20150213_061157_3800006096/'
                nWaveWin = 3
                aLineRg = [314, 395]
                aContRg = [413, 489]
              end
        '112' : begin
                sDataPath = '2015/02/14/20150214_150407_3820256096/'
                nWaveWin = 4
                aLineRg = [145, 183]
                aContRg = [193, 236]
              end
        '113' : begin
                sDataPath = '2015/02/16/20150216_082412_3820258096/'
                nWaveWin = 4
                aLineRg = [141, 179]
                aContRg = [188, 233]
              end
        '114' : begin
                sDataPath = '2015/02/17/20150217_084912_3820258096/'
                nWaveWin = 4
                aLineRg = [144, 179]
                aContRg = [189, 232]
              end
        '115' : begin
                sDataPath = '2015/02/17/20150217_224734_3800013096/'
                nWaveWin = 3
                aLineRg = [321, 393]
                aContRg = [418, 493]
              end
        '116' : begin
                sDataPath = '2015/02/19/20150219_011422_3800010096/'
                nWaveWin = 3
                aLineRg = [319, 393]
                aContRg = [411, 485]
              end
        '117' : begin
                sDataPath = '2015/02/20/20150220_133006_3800106096/'
                nWaveWin = 3
                aLineRg = [158, 196]
                aContRg = [204, 243]
              end
        ;#endregion
        ;#region case 19
        '118' : begin
                sDataPath = '2015/02/21/20150221_142955_3800106096/'
                nWaveWin = 3
                aLineRg = [160, 196]
                aContRg = [207, 254]
              end
        '119' : begin
                sDataPath = '2015/02/21/20150221_103943_3800106096/'
                nWaveWin = 3
                aLineRg = [159, 196]
                aContRg = [204, 241]
              end
        '120' : begin
                sDataPath = '2015/02/21/20150221_123519_3800106096/'
                nWaveWin = 3
                aLineRg = [163, 193]
                aContRg = [204, 251]
              end
        '121' : begin
                sDataPath = '2015/02/21/20150221_084001_3800110096/'
                nWaveWin = 3
                aLineRg = [162, 196]
                aContRg = [210, 250]
              end
        '122' : begin
                sDataPath = '2015/02/22/20150222_075113_3800110096/'
                nWaveWin = 3
                aLineRg = [162, 194]
                aContRg = [202, 237]
              end
        '123' : begin
                sDataPath = '2015/02/22/20150222_095006_3800110096/'
                nWaveWin = 3
                aLineRg = [163, 193]
                aContRg = [201, 247]
              end
        '124' : begin
                sDataPath = '2015/02/22/20150222_114859_3800110096/'
                nWaveWin = 3
                aLineRg = [161, 197]
                aContRg = [204, 246]
              end
        '125' : begin
                sDataPath = '2015/02/22/20150222_154645_3800110096/'
                nWaveWin = 3
                aLineRg = [163, 196]
                aContRg = [203, 249]
              end
        '126' : begin
                sDataPath = '2015/02/22/20150222_134752_3800110096/'
                nWaveWin = 3
                aLineRg = [163, 194]
                aContRg = [205, 245]
              end
        '127' : begin
                sDataPath = '2015/02/23/20150223_213555_3800110096/'
                nWaveWin = 3
                aLineRg = [165, 195]
                aContRg = [202, 246]
              end
        '128' : begin
                sDataPath = '2015/02/23/20150223_233348_3800110096/'
                nWaveWin = 3
                aLineRg = [161, 197]
                aContRg = [207, 243]
              end
        '129' : begin
                sDataPath = '2015/02/25/20150225_092905_3820104096/'
                nWaveWin = 4
                aLineRg = [145, 177]
                aContRg = [51, 132]
              end
        '130' : begin
                sDataPath = '2015/02/25/20150225_095939_3820104096/'
                nWaveWin = 4
                aLineRg = [152, 177]
                aContRg = [195, 240]
              end
        '131' : begin
                sDataPath = '2015/02/25/20150225_103013_3820104096/'
                nWaveWin = 4
                aLineRg = [145, 179]
                aContRg = [191, 246]
              end
        '132' : begin
                sDataPath = '2015/02/25/20150225_110047_3820104096/'
                nWaveWin = 4
                aLineRg = [147, 178]
                aContRg = [39, 132]
              end
        '133' : begin
                sDataPath = '2015/02/25/20150225_113121_3820104096/'
                nWaveWin = 4
                aLineRg = [148, 179]
                aContRg = [188, 232]
              end
        '134' : begin
                sDataPath = '2015/02/25/20150225_120155_3820104096/'
                nWaveWin = 4
                aLineRg = [147, 179]
                aContRg = [190, 239]
              end
        '135' : begin
                sDataPath = '2015/02/25/20150225_124705_3820104096/'
                nWaveWin = 4
                aLineRg = [143, 175]
                aContRg = [182, 239]
              end
        '136' : begin
                sDataPath = '2015/02/25/20150225_131805_3820104096/'
                nWaveWin = 4
                aLineRg = [146, 177]
                aContRg = [190, 235]
              end
        '137' : begin
                sDataPath = '2015/02/26/20150226_131659_3820106096/'
                nWaveWin = 4
                aLineRg = [148, 178]
                aContRg = [189, 231]
              end
        '138' : begin
                sDataPath = '2015/02/26/20150226_123301_3820106096/'
                nWaveWin = 4
                aLineRg = [146, 177]
                aContRg = [185, 224]
              end
        '139' : begin
                sDataPath = '2015/02/26/20150226_140107_3820106096/'
                nWaveWin = 4
                aLineRg = [146, 177]
                aContRg = [187, 220]
              end
        '140' : begin
                sDataPath = '2015/02/26/20150226_102107_3820106096/'
                nWaveWin = 4
                aLineRg = [150, 175]
                aContRg = [191, 239]
              end
        '141' : begin
                sDataPath = '2015/02/26/20150226_110505_3820106096/'
                nWaveWin = 4
                aLineRg = [147, 177]
                aContRg = [188, 230]
              end
        '142' : begin
                sDataPath = '2015/02/26/20150226_114903_3820106096/'
                nWaveWin = 4
                aLineRg = [145, 179]
                aContRg = [185, 237]
              end
        ;'143' : begin
        ;       sDataPath = '2015/02/27/20150227_233431_3890112096/'
        ;       nWaveWin = 1
        ;       aLineRg = [0, 0]
        ;       aContRg = [0, 0]
        ;     end
        ;'144' : begin
        ;       sDataPath = '2015/02/28/20150228_133431_3890112096/'
        ;       nWaveWin = 1
        ;       aLineRg = [0, 0]
        ;       aContRg = [0, 0]
        ;     end
        ;'145' : begin
        ;       sDataPath = '2015/02/28/20150228_072133_3890112096/'
        ;       nWaveWin = 1
        ;       aLineRg = [0, 0]
        ;       aContRg = [0, 0]
        ;     end
        ;#endregion
        ;#region case 20
        ; No SIIV 1403
        ;#endregion
        ;#region case 21
        '154' : begin
                sDataPath = '2015/11/13/20151113_130505_3630088076/'
                nWaveWin = 4
                aLineRg = [297, 352]
                aContRg = [381, 463]
              end
        '155' : begin
                sDataPath = '2015/11/13/20151113_112859_3630088076/'
                nWaveWin = 4
                aLineRg = [298, 351]
                aContRg = [366, 461]
              end
        '156' : begin
                sDataPath = '2015/11/14/20151114_083509_3630008076/'
                nWaveWin = 4
                aLineRg = [292, 352]
                aContRg = [371, 478]
              end
        '157' : begin
                sDataPath = '2015/11/14/20151114_101239_3630008076/'
                nWaveWin = 4
                aLineRg = [295, 350]
                aContRg = [371, 442]
              end
        '158' : begin
                sDataPath = '2015/11/14/20151114_065738_3630008076/'
                nWaveWin = 4
                aLineRg = [290, 355]
                aContRg = [377, 490]
              end
        '159' : begin
                sDataPath = '2015/11/14/20151114_115009_3630008076/'
                nWaveWin = 4
                aLineRg = [296, 356]
                aContRg = [368, 465]
              end
        '160' : begin
                sDataPath = '2015/11/14/20151114_164420_3630088076/'
                nWaveWin = 4
                aLineRg = [294, 349]
                aContRg = [360, 430]
              end
        '161' : begin
                sDataPath = '2015/11/14/20151114_182010_3630088076/'
                nWaveWin = 4
                aLineRg = [295, 352]
                aContRg = [367, 441]
              end
        '162' : begin
                sDataPath = '2015/11/14/20151114_213511_3630088076/'
                nWaveWin = 4
                aLineRg = [293, 354]
                aContRg = [368, 425]
              end
        '163' : begin
                sDataPath = '2015/11/14/20151114_195741_3630088076/'
                nWaveWin = 4
                aLineRg = [297, 352]
                aContRg = [366, 447]
              end
        '164' : begin
                sDataPath = '2015/11/14/20151114_231241_3630088076/'
                nWaveWin = 4
                aLineRg = [295, 354]
                aContRg = [384, 458]
              end
        '165' : begin
                sDataPath = '2015/11/14/20151114_052029_3630008076/'
                nWaveWin = 4
                aLineRg = [293, 348]
                aContRg = [374, 488]
              end
        '166' : begin
                sDataPath = '2015/11/15/20151115_202020_3630008076/'
                nWaveWin = 4
                aLineRg = [295, 351]
                aContRg = [370, 490]
              end
        '167' : begin
                sDataPath = '2015/11/15/20151115_005011_3630088076/'
                nWaveWin = 4
                aLineRg = [296, 353]
                aContRg = [381, 471]
              end
        '168' : begin
                sDataPath = '2015/11/15/20151115_215744_3630008076/'
                nWaveWin = 4
                aLineRg = [295, 350]
                aContRg = [373, 465]
              end
        '169' : begin
                sDataPath = '2015/11/15/20151115_060407_3630088076/'
                nWaveWin = 4
                aLineRg = [294, 352]
                aContRg = [369, 464]
              end
        '170' : begin
                sDataPath = '2015/11/15/20151115_022838_3630088076/'
                nWaveWin = 4
                aLineRg = [293, 355]
                aContRg = [374, 459]
              end
        '171' : begin
                sDataPath = '2015/11/15/20151115_040512_3630088076/'
                nWaveWin = 4
                aLineRg = [297, 356]
                aContRg = [377, 457]
              end
        '172' : begin
                sDataPath = '2015/11/15/20151115_233514_3630008076/'
                nWaveWin = 4
                aLineRg = [279, 353]
                aContRg = [368, 470]
              end
        '173' : begin
                sDataPath = '2015/11/16/20151116_011350_3630088076/'
                nWaveWin = 4
                aLineRg = [295, 349]
                aContRg = [367, 437]
              end
        '174' : begin
                sDataPath = '2015/11/16/20151116_235746_3630088076/'
                nWaveWin = 4
                aLineRg = [295, 352]
                aContRg = [367, 449]
              end
        '175' : begin
                sDataPath = '2015/11/16/20151116_025014_3630088076/'
                nWaveWin = 4
                aLineRg = [290, 353]
                aContRg = [368, 472]
              end
        '176' : begin
                sDataPath = '2015/11/16/20151116_060515_3630088076/'
                nWaveWin = 4
                aLineRg = [294, 349]
                aContRg = [365, 456]
              end
        '177' : begin
                sDataPath = '2015/11/16/20151116_043457_3630088076/'
                nWaveWin = 4
                aLineRg = [284, 353]
                aContRg = [378, 461]
              end
        '178' : begin
                sDataPath = '2015/11/16/20151116_172823_3630088076/'
                nWaveWin = 4
                aLineRg = [290, 353]
                aContRg = [365, 451]
              end
        '179' : begin
                sDataPath = '2015/11/16/20151116_190516_3630088076/'
                nWaveWin = 4
                aLineRg = [296, 350]
                aContRg = [361, 453]
              end
        '180' : begin
                sDataPath = '2015/11/16/20151116_204246_3630088076/'
                nWaveWin = 4
                aLineRg = [296, 350]
                aContRg = [375, 465]
              end
        '181' : begin
                sDataPath = '2015/11/16/20151116_222016_3630088076/'
                nWaveWin = 4
                aLineRg = [291, 350]
                aContRg = [372, 456]
              end
        '182' : begin
                sDataPath = '2015/11/17/20151117_013516_3630088076/'
                nWaveWin = 4
                aLineRg = [288, 358]
                aContRg = [373, 460]
              end
        ;#endregion
        ;#region case 22
        '183' : begin
                sDataPath = '2015/11/18/20151118_145420_3630088076/'
                nWaveWin = 4
                aLineRg = [291, 355]
                aContRg = [380, 460]
              end
        '184' : begin
                sDataPath = '2015/11/18/20151118_163017_3630088076/'
                nWaveWin = 4
                aLineRg = [294, 355]
                aContRg = [377, 451]
              end
        '185' : begin
                sDataPath = '2015/11/19/20151119_084517_3630088076/'
                nWaveWin = 4
                aLineRg = [304, 345]
                aContRg = [358, 442]
              end
        '186' : begin
                sDataPath = '2015/11/19/20151119_070747_3630088076/'
                nWaveWin = 4
                aLineRg = [295, 353]
                aContRg = [381, 457]
              end
        '187' : begin
                sDataPath = '2015/11/19/20151119_055002_3630088076/'
                nWaveWin = 4
                aLineRg = [296, 360]
                aContRg = [379, 470]
              end
        '188' : begin
                sDataPath = '2015/11/20/20151120_171550_3630008076/'
                nWaveWin = 4
                aLineRg = [288, 356]
                aContRg = [374, 463]
              end
        '189' : begin
                sDataPath = '2015/11/20/20151120_185245_3630008076/'
                nWaveWin = 4
                aLineRg = [296, 355]
                aContRg = [373, 466]
              end
        '190' : begin
                sDataPath = '2015/11/20/20151120_203015_3630008076/'
                nWaveWin = 4
                aLineRg = [296, 356]
                aContRg = [383, 479]
              end
        '191' : begin
                sDataPath = '2015/11/22/20151122_144510_3630088076/'
                nWaveWin = 4
                aLineRg = [291, 358]
                aContRg = [376, 458]
              end
        '192' : begin
                sDataPath = '2015/11/22/20151122_130740_3630088076/'
                nWaveWin = 4
                aLineRg = [294, 355]
                aContRg = [370, 451]
              end
        '193' : begin
                sDataPath = '2015/11/22/20151122_113020_3630088076/'
                nWaveWin = 4
                aLineRg = [290, 357]
                aContRg = [374, 456]
              end
        '194' : begin
                sDataPath = '2015/11/23/20151123_101520_3630088076/'
                nWaveWin = 4
                aLineRg = [293, 353]
                aContRg = [367, 448]
              end
        '195' : begin
                sDataPath = '2015/11/23/20151123_115237_3630088076/'
                nWaveWin = 4
                aLineRg = [292, 352]
                aContRg = [370, 445]
              end
        '196' : begin
                sDataPath = '2015/11/24/20151124_023004_3630088076/'
                nWaveWin = 4
                aLineRg = [294, 355]
                aContRg = [377, 464]
              end
        '197' : begin
                sDataPath = '2015/11/24/20151124_005320_3630088076/'
                nWaveWin = 4
                aLineRg = [290, 362]
                aContRg = [374, 453]
              end
        '198' : begin
                sDataPath = '2015/11/24/20151124_121708_3630088076/'
                nWaveWin = 4
                aLineRg = [285, 360]
                aContRg = [382, 465]
              end
        '199' : begin
                sDataPath = '2015/11/24/20151124_103726_3630088076/'
                nWaveWin = 4
                aLineRg = [289, 355]
                aContRg = [376, 457]
              end
        '200' : begin
                sDataPath = '2015/11/25/20151125_060922_3630088076/'
                nWaveWin = 4
                aLineRg = [287, 355]
                aContRg = [370, 464]
              end
        '201' : begin
                sDataPath = '2015/11/25/20151125_074500_3630088076/'
                nWaveWin = 4
                aLineRg = [284, 357]
                aContRg = [371, 442]
              end
        '202' : begin
                sDataPath = '2015/11/25/20151125_092230_3630088076/'
                nWaveWin = 4
                aLineRg = [290, 358]
                aContRg = [370, 454]
              end
        ;#endregion
        ;#region case 23
        ; No SIIV 1403
        ;#endregion
        ;#region case 24
        ; No SIIV 1403
        ;#endregion
        ;#region case 25
        '264' : begin
                sDataPath = '2015/12/17/20151217_222619_3620008076/'
                nWaveWin = 4
                aLineRg = [281, 355]
                aContRg = [374, 474]
              end
        '265' : begin
                sDataPath = '2015/12/18/20151218_000419_3620008076/'
                nWaveWin = 4
                aLineRg = [285, 359]
                aContRg = [371, 458]
              end
        '266' : begin
                sDataPath = '2015/12/18/20151218_161913_3600104077/'
                nWaveWin = 3
                aLineRg = [164, 199]
                aContRg = [213, 266]
              end
        '267' : begin
                sDataPath = '2015/12/18/20151218_193313_3600104077/'
                nWaveWin = 3
                aLineRg = [170, 194]
                aContRg = [218, 272]
              end
        '268' : begin
                sDataPath = '2015/12/20/20151220_121049_3620008076/'
                nWaveWin = 4
                aLineRg = [292, 355]
                aContRg = [368, 459]
              end
        '269' : begin
                sDataPath = '2015/12/21/20151221_123319_3620008076/'
                nWaveWin = 4
                aLineRg = [294, 355]
                aContRg = [371, 451]
              end
        '270' : begin
                sDataPath = '2015/12/21/20151221_105519_3620008076/'
                nWaveWin = 4
                aLineRg = [288, 360]
                aContRg = [384, 467]
              end
        '271' : begin
                sDataPath = '2015/12/21/20151221_221819_3620008076/'
                nWaveWin = 4
                aLineRg = [296, 351]
                aContRg = [380, 487]
              end
        '272' : begin
                sDataPath = '2015/12/21/20151221_204013_3600104077/'
                nWaveWin = 3
                aLineRg = [171, 196]
                aContRg = [204, 268]
              end
        '273' : begin
                sDataPath = '2015/12/21/20151221_235519_3620008076/'
                nWaveWin = 4
                aLineRg = [285, 358]
                aContRg = [373, 461]
              end
        '274' : begin
                sDataPath = '2015/12/22/20151222_094111_3620008076/'
                nWaveWin = 4
                aLineRg = [299, 348]
                aContRg = [361, 446]
              end
        '275' : begin
                sDataPath = '2015/12/22/20151222_192611_3620008076/'
                nWaveWin = 4
                aLineRg = [288, 358]
                aContRg = [370, 450]
              end
        '276' : begin
                sDataPath = '2015/12/23/20151223_082911_3620008076/'
                nWaveWin = 4
                aLineRg = [295, 352]
                aContRg = [369, 474]
              end
        '277' : begin
                sDataPath = '2015/12/23/20151223_064911_3620008076/'
                nWaveWin = 4
                aLineRg = [299, 358]
                aContRg = [370, 462]
              end
        ;#endregion
        ;#region case 26
        '278' : begin
                sDataPath = '2015/12/24/20151224_232701_3620008076/'
                nWaveWin = 4
                aLineRg = [295, 351]
                aContRg = [377, 469]
              end
        '279' : begin
                sDataPath = '2015/12/25/20151225_104901_3620008076/'
                nWaveWin = 4
                aLineRg = [287, 352]
                aContRg = [365, 458]
              end
        '280' : begin
                sDataPath = '2015/12/25/20151225_221401_3620008076/'
                nWaveWin = 4
                aLineRg = [287, 358]
                aContRg = [371, 459]
              end
        '281' : begin
                sDataPath = '2015/12/26/20151226_111400_3620008076/'
                nWaveWin = 4
                aLineRg = [276, 369]
                aContRg = [379, 474]
              end
        '282' : begin
                sDataPath = '2015/12/27/20151227_001301_3620008076/'
                nWaveWin = 4
                aLineRg = [292, 349]
                aContRg = [363, 459]
              end
        '283' : begin
                sDataPath = '2015/12/27/20151227_113400_3620008076/'
                nWaveWin = 4
                aLineRg = [293, 356]
                aContRg = [368, 460]
              end
        '284' : begin
                sDataPath = '2015/12/27/20151227_225700_3620008076/'
                nWaveWin = 4
                aLineRg = [280, 370]
                aContRg = [385, 475]
              end
        '285' : begin
                sDataPath = '2015/12/28/20151228_214200_3620008076/'
                nWaveWin = 4
                aLineRg = [289, 352]
                aContRg = [372, 503]
              end
        '286' : begin
                sDataPath = '2016/01/02/20160102_103021_3620008076/'
                nWaveWin = 4
                aLineRg = [287, 352]
                aContRg = [363, 465]
              end
        '287' : begin
                sDataPath = '2016/01/02/20160102_071521_3620008076/'
                nWaveWin = 4
                aLineRg = [294, 359]
                aContRg = [368, 449]
              end
        '288' : begin
                sDataPath = '2016/01/02/20160102_053821_3620008076/'
                nWaveWin = 4
                aLineRg = [284, 358]
                aContRg = [368, 464]
              end
        '289' : begin
                sDataPath = '2016/01/02/20160102_085321_3620008076/'
                nWaveWin = 4
                aLineRg = [289, 356]
                aContRg = [366, 466]
              end
        '290' : begin
                sDataPath = '2016/01/02/20160102_233023_3630008076/'
                nWaveWin = 4
                aLineRg = [284, 360]
                aContRg = [374, 465]
              end
        '291' : begin
                sDataPath = '2016/01/03/20160103_010721_3630008076/'
                nWaveWin = 4
                aLineRg = [286, 355]
                aContRg = [370, 457]
              end
        ;#endregion
        ;#region case 27
        '292' : begin
                sDataPath = '2016/01/08/20160108_061411_3630008076/'
                nWaveWin = 4
                aLineRg = [289, 355]
                aContRg = [384, 473]
              end
        '293' : begin
                sDataPath = '2016/01/08/20160108_110511_3630008076/'
                nWaveWin = 4
                aLineRg = [289, 356]
                aContRg = [373, 468]
              end
        '294' : begin
                sDataPath = '2016/01/08/20160108_155811_3620008076/'
                nWaveWin = 4
                aLineRg = [286, 363]
                aContRg = [384, 470]
              end
        '295' : begin
                sDataPath = '2016/01/08/20160108_205011_3620008076/'
                nWaveWin = 4
                aLineRg = [290, 352]
                aContRg = [389, 502]
              end
        '296' : begin
                sDataPath = '2016/01/09/20160109_211211_3630008076/'
                nWaveWin = 4
                aLineRg = [294, 359]
                aContRg = [388, 520]
              end
        '297' : begin
                sDataPath = '2016/01/09/20160109_014311_3630008076/'
                nWaveWin = 4
                aLineRg = [290, 356]
                aContRg = [376, 473]
              end
        '298' : begin
                sDataPath = '2016/01/09/20160109_063511_3630008076/'
                nWaveWin = 4
                aLineRg = [289, 355]
                aContRg = [394, 477]
              end
        '299' : begin
                sDataPath = '2016/01/09/20160109_112811_3630008076/'
                nWaveWin = 4
                aLineRg = [291, 361]
                aContRg = [383, 463]
              end
        '300' : begin
                sDataPath = '2016/01/09/20160109_162011_3630008076/'
                nWaveWin = 4
                aLineRg = [287, 354]
                aContRg = [373, 465]
              end
        '301' : begin
                sDataPath = '2016/01/10/20160110_020511_3630008076/'
                nWaveWin = 4
                aLineRg = [290, 357]
                aContRg = [376, 468]
              end
        '302' : begin
                sDataPath = '2016/01/10/20160110_065711_3630008076/'
                nWaveWin = 4
                aLineRg = [298, 359]
                aContRg = [382, 489]
              end
        '303' : begin
                sDataPath = '2016/01/10/20160110_101211_3630008076/'
                nWaveWin = 4
                aLineRg = [296, 352]
                aContRg = [382, 495]
              end
        '304' : begin
                sDataPath = '2016/01/10/20160110_164211_3630008076/'
                nWaveWin = 4
                aLineRg = [286, 355]
                aContRg = [394, 504]
              end
        '305' : begin
                sDataPath = '2016/01/10/20160110_213511_3630008076/'
                nWaveWin = 4
                aLineRg = [290, 363]
                aContRg = [384, 524]
              end
        '306' : begin
                sDataPath = '2016/01/11/20160111_071911_3630008076/'
                nWaveWin = 4
                aLineRg = [302, 351]
                aContRg = [387, 498]
              end
        '307' : begin
                sDataPath = '2016/01/11/20160111_022711_3630008076/'
                nWaveWin = 4
                aLineRg = [287, 358]
                aContRg = [381, 470]
              end
        '308' : begin
                sDataPath = '2016/01/11/20160111_121211_3630008076/'
                nWaveWin = 4
                aLineRg = [290, 352]
                aContRg = [372, 461]
              end
        '309' : begin
                sDataPath = '2016/01/11/20160111_170411_3620008076/'
                nWaveWin = 4
                aLineRg = [299, 353]
                aContRg = [383, 474]
              end
        '310' : begin
                sDataPath = '2016/01/11/20160111_215711_3620008076/'
                nWaveWin = 4
                aLineRg = [300, 356]
                aContRg = [396, 529]
              end
        '311' : begin
                sDataPath = '2016/01/12/20160112_043009_3630008076/'
                nWaveWin = 4
                aLineRg = [291, 356]
                aContRg = [382, 476]
              end
        '312' : begin
                sDataPath = '2016/01/12/20160112_105909_3630008076/'
                nWaveWin = 4
                aLineRg = [297, 355]
                aContRg = [376, 464]
              end
        '313' : begin
                sDataPath = '2016/01/12/20160112_024911_3620008076/'
                nWaveWin = 4
                aLineRg = [286, 356]
                aContRg = [376, 472]
              end
        '314' : begin
                sDataPath = '2016/01/12/20160112_154909_3630008076/'
                nWaveWin = 4
                aLineRg = [295, 358]
                aContRg = [367, 427]
              end
        '315' : begin
                sDataPath = '2016/01/12/20160112_204109_3630008076/'
                nWaveWin = 4
                aLineRg = [298, 350]
                aContRg = [397, 507]
              end
        '316' : begin
                sDataPath = '2016/01/13/20160113_111909_3630008076/'
                nWaveWin = 4
                aLineRg = [290, 354]
                aContRg = [390, 468]
              end
        '317' : begin
                sDataPath = '2016/01/13/20160113_161409_3630008076/'
                nWaveWin = 4
                aLineRg = [291, 360]
                aContRg = [393, 471]
              end
        '318' : begin
                sDataPath = '2016/01/13/20160113_013409_3630008076/'
                nWaveWin = 4
                aLineRg = [275, 353]
                aContRg = [395, 466]
              end
        '319' : begin
                sDataPath = '2016/01/13/20160113_062909_3630008076/'
                nWaveWin = 4
                aLineRg = [285, 372]
                aContRg = [393, 473]
              end
        '320' : begin
                sDataPath = '2016/01/13/20160113_210409_3630008076/'
                nWaveWin = 4
                aLineRg = [296, 353]
                aContRg = [374, 517]
              end
        '321' : begin
                sDataPath = '2016/01/14/20160114_100409_3630008076/'
                nWaveWin = 4
                aLineRg = [290, 361]
                aContRg = [380, 470]
              end
        '322' : begin
                sDataPath = '2016/01/14/20160114_051409_3630008076/'
                nWaveWin = 4
                aLineRg = [293, 353]
                aContRg = [375, 457]
              end
        ;'323' : begin
        ;       sDataPath = '2016/01/14/20160114_145609_3630008076/'
        ;       nWaveWin = 4
        ;       aLineRg = [0, 0]
        ;       aContRg = [0, 0]
        ;     end
        ;'324' : begin
        ;       sDataPath = '2016/01/14/20160114_194909_3630008076/'
        ;       nWaveWin = 4
        ;       aLineRg = [0, 0]
        ;       aContRg = [0, 0]
        ;     end
        '325' : begin
                sDataPath = '2016/01/14/20160114_230409_3630008076/'
                nWaveWin = 4
                aLineRg = [288, 353]
                aContRg = [389, 464]
              end
        '326' : begin
                sDataPath = '2016/01/15/20160115_232919_3630008076/'
                nWaveWin = 4
                aLineRg = [279, 382]
                aContRg = [399, 468]
              end
        '327' : begin
                sDataPath = '2016/01/15/20160115_053419_3630008076/'
                nWaveWin = 4
                aLineRg = [280, 363]
                aContRg = [388, 466]
              end
        '328' : begin
                sDataPath = '2016/01/15/20160115_120419_3630008076/'
                nWaveWin = 4
                aLineRg = [280, 366]
                aContRg = [394, 470]
              end
        '329' : begin
                sDataPath = '2016/01/15/20160115_183419_3630008076/'
                nWaveWin = 4
                aLineRg = [277, 361]
                aContRg = [388, 461]
              end
        '330' : begin
                sDataPath = '2016/01/16/20160116_042009_3630008076/'
                nWaveWin = 4
                aLineRg = [276, 362]
                aContRg = [387, 455]
              end
        '331' : begin
                sDataPath = '2016/01/16/20160116_104709_3630008076/'
                nWaveWin = 4
                aLineRg = [278, 362]
                aContRg = [397, 466]
              end
        ;'332' : begin
        ;       sDataPath = '2016/01/16/20160116_171709_3630008076/'
        ;       nWaveWin = 4
        ;       aLineRg = [0, 0]
        ;       aContRg = [0, 0]
        ;     end
        '333' : begin
                sDataPath = '2016/01/17/20160117_110909_3630008076/'
                nWaveWin = 4
                aLineRg = [282, 357]
                aContRg = [388, 464]
              end
        ;'334' : begin
        ;       sDataPath = '2016/01/17/20160117_191909_3630008076/'
        ;       nWaveWin = 4
        ;       aLineRg = [0, 0]
        ;       aContRg = [0, 0]
        ;     end
        '335' : begin
                sDataPath = '2016/01/17/20160117_012509_3630008076/'
                nWaveWin = 4
                aLineRg = [282, 358]
                aContRg = [396, 461]
              end
        '336' : begin
                sDataPath = '2016/01/18/20160118_113409_3630008076/'
                nWaveWin = 4
                aLineRg = [283, 358]
                aContRg = [388, 457]
              end
        '337' : begin
                sDataPath = '2016/01/18/20160118_032409_3630008076/'
                nWaveWin = 4
                aLineRg = [280, 357]
                aContRg = [382, 456]
              end
        ;#endregion
        ;#region case 28
        '338' : begin
                sDataPath = '2016/01/16/20160116_154009_3630008076/'
                nWaveWin = 4
                aLineRg = [294, 357]
                aContRg = [369, 468]
              end
        '339' : begin
                sDataPath = '2016/01/16/20160116_234709_3630008076/'
                nWaveWin = 4
                aLineRg = [295, 353]
                aContRg = [387, 465]
              end
        '340' : begin
                sDataPath = '2016/01/17/20160117_093209_3630008076/'
                nWaveWin = 4
                aLineRg = [298, 352]
                aContRg = [367, 480]
              end
        '341' : begin
                sDataPath = '2016/01/17/20160117_173909_3630008076/'
                nWaveWin = 4
                aLineRg = [281, 353]
                aContRg = [363, 464]
              end
        '342' : begin
                sDataPath = '2016/01/18/20160118_095409_3630008076/'
                nWaveWin = 4
                aLineRg = [296, 349]
                aContRg = [362, 467]
              end
        '343' : begin
                sDataPath = '2016/01/18/20160118_014909_3630008076/'
                nWaveWin = 4
                aLineRg = [298, 353]
                aContRg = [371, 476]
              end
        '344' : begin
                sDataPath = '2016/01/18/20160118_211711_3630008076/'
                nWaveWin = 4
                aLineRg = [302, 344]
                aContRg = [368, 467]
              end
        '345' : begin
                sDataPath = '2016/01/19/20160119_101711_3630008076/'
                nWaveWin = 4
                aLineRg = [298, 353]
                aContRg = [370, 456]
              end
        '346' : begin
                sDataPath = '2016/01/19/20160119_034711_3630008076/'
                nWaveWin = 4
                aLineRg = [298, 352]
                aContRg = [362, 445]
              end
        '347' : begin
                sDataPath = '2016/01/19/20160119_133311_3630008076/'
                nWaveWin = 4
                aLineRg = [295, 352]
                aContRg = [389, 464]
              end
        '348' : begin
                sDataPath = '2016/01/19/20160119_003311_3630008076/'
                nWaveWin = 4
                aLineRg = [296, 353]
                aContRg = [369, 466]
              end
        '349' : begin
                sDataPath = '2016/01/19/20160119_164811_3630008076/'
                nWaveWin = 4
                aLineRg = [297, 351]
                aContRg = [365, 452]
              end
        '350' : begin
                sDataPath = '2016/01/19/20160119_231711_3630008076/'
                nWaveWin = 4
                aLineRg = [296, 352]
                aContRg = [364, 461]
              end
        '351' : begin
                sDataPath = '2016/01/20/20160120_090100_3630008076/'
                nWaveWin = 4
                aLineRg = [297, 348]
                aContRg = [375, 466]
              end
        '352' : begin
                sDataPath = '2016/01/20/20160120_023211_3630008076/'
                nWaveWin = 4
                aLineRg = [295, 353]
                aContRg = [371, 457]
              end
        '353' : begin
                sDataPath = '2016/01/20/20160120_072221_3630008076/'
                nWaveWin = 4
                aLineRg = [299, 345]
                aContRg = [368, 441]
              end
        '354' : begin
                sDataPath = '2016/01/21/20160121_011721_3620008076/'
                nWaveWin = 4
                aLineRg = [297, 348]
                aContRg = [359, 463]
              end
        '355' : begin
                sDataPath = '2016/01/21/20160121_025321_3620008076/'
                nWaveWin = 4
                aLineRg = [300, 343]
                aContRg = [360, 447]
              end
        '356' : begin
                sDataPath = '2016/01/22/20160122_094421_3620008076/'
                nWaveWin = 4
                aLineRg = [303, 345]
                aContRg = [364, 465]
              end
        ;#endregion
        ;#region case 29
        '357' : begin
                sDataPath = '2016/01/21/20160121_105921_3620008076/'
                nWaveWin = 4
                aLineRg = [291, 352]
                aContRg = [373, 470]
              end
        '358' : begin
                sDataPath = '2016/01/22/20160122_112221_3630008076/'
                nWaveWin = 4
                aLineRg = [298, 353]
                aContRg = [365, 464]
              end
        '359' : begin
                sDataPath = '2016/01/22/20160122_000121_3620008076/'
                nWaveWin = 4
                aLineRg = [296, 355]
                aContRg = [364, 464]
              end
        '360' : begin
                sDataPath = '2016/01/22/20160122_161521_3630008076/'
                nWaveWin = 4
                aLineRg = [296, 351]
                aContRg = [371, 458]
              end
        '361' : begin
                sDataPath = '2016/01/22/20160122_045221_3630008076/'
                nWaveWin = 4
                aLineRg = [288, 353]
                aContRg = [370, 467]
              end
        '362' : begin
                sDataPath = '2016/01/22/20160122_224521_3630008076/'
                nWaveWin = 4
                aLineRg = [295, 357]
                aContRg = [372, 468]
              end
        '363' : begin
                sDataPath = '2016/01/23/20160123_145921_3620008076/'
                nWaveWin = 4
                aLineRg = [298, 357]
                aContRg = [368, 464]
              end
        '364' : begin
                sDataPath = '2016/01/23/20160123_050456_3620008076/'
                nWaveWin = 4
                aLineRg = [291, 347]
                aContRg = [360, 474]
              end
        '365' : begin
                sDataPath = '2016/01/23/20160123_231519_3620008076/'
                nWaveWin = 4
                aLineRg = [294, 351]
                aContRg = [360, 460]
              end
        '366' : begin
                sDataPath = '2016/01/24/20160124_152019_3620008076/'
                nWaveWin = 4
                aLineRg = [296, 355]
                aContRg = [370, 461]
              end
        '367' : begin
                sDataPath = '2016/01/24/20160124_120519_3620008076/'
                nWaveWin = 4
                aLineRg = [297, 351]
                aContRg = [367, 466]
              end
        '368' : begin
                sDataPath = '2016/01/24/20160124_035819_3630008076/'
                nWaveWin = 4
                aLineRg = [299, 352]
                aContRg = [359, 467]
              end
        '369' : begin
                sDataPath = '2016/01/24/20160124_214959_3620008076/'
                nWaveWin = 4
                aLineRg = [299, 354]
                aContRg = [372, 475]
              end
        '370' : begin
                sDataPath = '2016/01/25/20160125_140919_3630008076/'
                nWaveWin = 4
                aLineRg = [291, 359]
                aContRg = [381, 471]
              end
        '371' : begin
                sDataPath = '2016/01/25/20160125_024319_3630008076/'
                nWaveWin = 4
                aLineRg = [291, 357]
                aContRg = [367, 470]
              end
        '372' : begin
                sDataPath = '2016/01/25/20160125_235419_3630008076/'
                nWaveWin = 4
                aLineRg = [296, 357]
                aContRg = [372, 461]
              end
        ;#endregion
        ;#region case 30
        '373' : begin
                sDataPath = '2016/01/29/20160129_104421_3630008076/'
                nWaveWin = 4
                aLineRg = [295, 352]
                aContRg = [361, 473]
              end
        '374' : begin
                sDataPath = '2016/01/29/20160129_185921_3630008076/'
                nWaveWin = 4
                aLineRg = [294, 359]
                aContRg = [382, 485]
              end
        '375' : begin
                sDataPath = '2016/01/30/20160130_092621_3630008076/'
                nWaveWin = 4
                aLineRg = [303, 350]
                aContRg = [371, 464]
              end
        '376' : begin
                sDataPath = '2016/01/30/20160130_155621_3630008076/'
                nWaveWin = 4
                aLineRg = [291, 355]
                aContRg = [366, 458]
              end
        '377' : begin
                sDataPath = '2016/01/30/20160130_025921_3630008076/'
                nWaveWin = 4
                aLineRg = [293, 351]
                aContRg = [364, 459]
              end
        '378' : begin
                sDataPath = '2016/01/31/20160131_130321_3630008076/'
                nWaveWin = 4
                aLineRg = [293, 353]
                aContRg = [365, 472]
              end
        '379' : begin
                sDataPath = '2016/01/31/20160131_014121_3630008076/'
                nWaveWin = 4
                aLineRg = [298, 352]
                aContRg = [362, 436]
              end
        '380' : begin
                sDataPath = '2016/02/01/20160201_132521_3630008076/'
                nWaveWin = 4
                aLineRg = [292, 353]
                aContRg = [375, 459]
              end
        '381' : begin
                sDataPath = '2016/02/01/20160201_020321_3630008076/'
                nWaveWin = 4
                aLineRg = [295, 351]
                aContRg = [373, 465]
              end
        '382' : begin
                sDataPath = '2016/02/02/20160202_004721_3630008076/'
                nWaveWin = 4
                aLineRg = [295, 356]
                aContRg = [363, 462]
              end
        ;#endregion
        ;#region case 31
        '383' : begin
                sDataPath = '2016/02/06/20160206_115821_3630008076/'
                nWaveWin = 4
                aLineRg = [290, 350]
                aContRg = [366, 450]
              end
        '384' : begin
                sDataPath = '2016/02/06/20160206_214251_3630008076/'
                nWaveWin = 4
                aLineRg = [289, 351]
                aContRg = [367, 453]
              end
        '385' : begin
                sDataPath = '2016/02/06/20160206_070548_3630008076/'
                nWaveWin = 4
                aLineRg = [303, 345]
                aContRg = [372, 528]
              end
        '386' : begin
                sDataPath = '2016/02/07/20160207_090521_3630008076/'
                nWaveWin = 4
                aLineRg = [293, 350]
                aContRg = [376, 487]
              end
        '387' : begin
                sDataPath = '2016/02/07/20160207_023521_3630008076/'
                nWaveWin = 4
                aLineRg = [288, 352]
                aContRg = [363, 461]
              end
        '388' : begin
                sDataPath = '2016/02/07/20160207_121956_3630008076/'
                nWaveWin = 4
                aLineRg = [286, 355]
                aContRg = [368, 467]
              end
        '389' : begin
                sDataPath = '2016/02/07/20160207_220451_3630008076/'
                nWaveWin = 4
                aLineRg = [294, 352]
                aContRg = [385, 481]
              end
        '390' : begin
                sDataPath = '2016/02/08/20160208_074923_3620008076/'
                nWaveWin = 4
                aLineRg = [296, 347]
                aContRg = [364, 473]
              end
        '391' : begin
                sDataPath = '2016/02/08/20160208_141921_3620008076/'
                nWaveWin = 4
                aLineRg = [287, 351]
                aContRg = [367, 467]
              end
        ;'392' : begin
        ;       sDataPath = '2016/02/08/20160208_204921_3620008076/'
        ;       nWaveWin = 4
        ;       aLineRg = [0, 0]
        ;       aContRg = [0, 0]
        ;     end
        ;'393' : begin
        ;       sDataPath = '2016/02/09/20160209_063401_3630008076/'
        ;       nWaveWin = 4
        ;       aLineRg = [0, 0]
        ;       aContRg = [0, 0]
        ;     end
        '394' : begin
                sDataPath = '2016/02/09/20160209_014121_3620008076/'
                nWaveWin = 4
                aLineRg = [285, 354]
                aContRg = [365, 498]
              end
        '395' : begin
                sDataPath = '2016/02/09/20160209_130351_3630008076/'
                nWaveWin = 4
                aLineRg = [295, 342]
                aContRg = [359, 502]
              end
        '396' : begin
                sDataPath = '2016/02/09/20160209_211119_3630008076/'
                nWaveWin = 4
                aLineRg = [303, 339]
                aContRg = [383, 513]
              end
        '397' : begin
                sDataPath = '2016/02/10/20160210_083249_3630008076/'
                nWaveWin = 4
                aLineRg = [290, 344]
                aContRg = [361, 463]
              end
        '398' : begin
                sDataPath = '2016/02/10/20160210_020332_3630008076/'
                nWaveWin = 4
                aLineRg = [291, 348]
                aContRg = [382, 468]
              end
        ;'399' : begin
        ;       sDataPath = '2016/02/10/20160210_150234_3630008076/'
        ;       nWaveWin = 4
        ;       aLineRg = [0, 0]
        ;       aContRg = [0, 0]
        ;     end
        '400' : begin
                sDataPath = '2016/02/10/20160210_213319_3630008076/'
                nWaveWin = 4
                aLineRg = [287, 349]
                aContRg = [365, 458]
              end
        ;'401' : begin
        ;       sDataPath = '2016/02/11/20160211_022439_3630008076/'
        ;       nWaveWin = 4
        ;       aLineRg = [0, 0]
        ;       aContRg = [0, 0]
        ;     end
        '402' : begin
                sDataPath = '2016/02/11/20160211_055900_3630008076/'
                nWaveWin = 4
                aLineRg = [288, 350]
                aContRg = [364, 458]
              end
        '403' : begin
                sDataPath = '2016/02/11/20160211_201719_3630008076/'
                nWaveWin = 4
                aLineRg = [289, 348]
                aContRg = [358, 458]
              end
        '404' : begin
                sDataPath = '2016/02/11/20160211_120919_3620008076/'
                nWaveWin = 4
                aLineRg = [285, 352]
                aContRg = [368, 460]
              end
        '405' : begin
                sDataPath = '2016/02/12/20160212_025419_3630008076/'
                nWaveWin = 4
                aLineRg = [284, 351]
                aContRg = [367, 452]
              end
        ;#endregion
        ;#region case 32
        '406' : begin
                sDataPath = '2016/02/26/20160226_054411_3620258078/'
                nWaveWin = 4
                aLineRg = [147, 179]
                aContRg = [187, 233]
              end
        '407' : begin
                sDataPath = '2016/02/26/20160226_145011_3620258078/'
                nWaveWin = 4
                aLineRg = [145, 177]
                aContRg = [196, 233]
              end
        '408' : begin
                sDataPath = '2016/02/27/20160227_074513_3620258078/'
                nWaveWin = 4
                aLineRg = [142, 180]
                aContRg = [194, 234]
              end
        '409' : begin
                sDataPath = '2016/02/27/20160227_165111_3620258078/'
                nWaveWin = 4
                aLineRg = [140, 180]
                aContRg = [197, 236]
              end
        ;'410' : begin
        ;       sDataPath = '2016/02/27/20160227_135056_3620258078/'
        ;       nWaveWin = 4
        ;       aLineRg = [0, 0]
        ;       aContRg = [0, 0]
        ;     end
        '411' : begin
                sDataPath = '2016/02/28/20160228_032041_3620258078/'
                nWaveWin = 4
                aLineRg = [142, 180]
                aContRg = [197, 235]
              end
        ;'412' : begin
        ;       sDataPath = '2016/02/28/20160228_153411_3620258078/'
        ;       nWaveWin = 4
        ;       aLineRg = [0, 0]
        ;       aContRg = [0, 0]
        ;     end
        '413' : begin
                sDataPath = '2016/02/28/20160228_094211_3620258078/'
                nWaveWin = 4
                aLineRg = [144, 179]
                aContRg = [195, 236]
              end
        ;'414' : begin
        ;       sDataPath = '2016/02/28/20160228_233811_3620258078/'
        ;       nWaveWin = 4
        ;       aLineRg = [0, 0]
        ;       aContRg = [0, 0]
        ;     end
        '415' : begin
                sDataPath = '2016/02/29/20160229_192111_3620258078/'
                nWaveWin = 4
                aLineRg = [143, 178]
                aContRg = [194, 235]
              end
        '416' : begin
                sDataPath = '2016/02/29/20160229_100511_3620258078/'
                nWaveWin = 4
                aLineRg = [146, 179]
                aContRg = [194, 230]
              end
        '417' : begin
                sDataPath = '2016/02/29/20160229_051141_3620258078/'
                nWaveWin = 4
                aLineRg = [142, 179]
                aContRg = [194, 235]
              end
        '418' : begin
                sDataPath = '2016/03/01/20160301_023441_3620258078/'
                nWaveWin = 4
                aLineRg = [146, 179]
                aContRg = [195, 231]
              end
        ;#endregion
        ;#region QS 33
        '419' : begin
            sDataPath = '2014/07/01/20140701_062609_3893012099/'
                nWaveWin = 1
                aLineRg = [1695, 1784]
                aContRg = [1152, 1364]
              end
        '420' : begin
            sDataPath = '2014/07/03/20140703_153609_3893012099/'
                nWaveWin = 1
                aLineRg = [1686, 1782]
                aContRg = [1136, 1289]
              end
        '421' : begin
            sDataPath = '2014/07/06/20140706_221109_3893012099/'
                nWaveWin = 1
                aLineRg = [1699, 1794]
                aContRg = [1131, 1288]
              end
        '422' : begin
            sDataPath = '2014/07/08/20140708_044107_3893012099/'
                nWaveWin = 1
                aLineRg = [1697, 1784]
                aContRg = [1160, 1340]
              end
        '423' : begin
            sDataPath = '2014/07/10/20140710_052016_3893012099/'
                nWaveWin = 1
                aLineRg = [1686, 1787]
                aContRg = [1168, 1411]
              end
        ;#endregion
        ;#region QS 34
        '424' : begin
            sDataPath = '2014/07/13/20140713_034539_3893012099/'
                nWaveWin = 1
                aLineRg = [1688, 1791]
                aContRg = [1149, 1367]
              end
        '425' : begin
            sDataPath = '2014/07/15/20140715_111309_3893012099/'
                nWaveWin = 1
                aLineRg = [1695, 1788]
                aContRg = [1121, 1275]
              end
        '426' : begin
            sDataPath = '2014/07/17/20140717_161109_3893012099/'
                nWaveWin = 1
                aLineRg = [1686, 1789]
                aContRg = [1115, 1389]
              end
        '427' : begin
            sDataPath = '2014/07/20/20140720_154352_3893012099/'
                nWaveWin = 1
                aLineRg = [1684, 1806]
                aContRg = [1121, 1203]
              end
        '428' : begin
            sDataPath = '2014/07/22/20140722_154407_3893012099/'
                nWaveWin = 1
                aLineRg = [1692, 1776]
                aContRg = [1149, 1412]
              end
        '429' : begin
            sDataPath = '2014/07/24/20140724_050107_3893012099/'
                nWaveWin = 1
                aLineRg = [1696, 1802]
                aContRg = [1138, 1416]
              end
        ;#endregion
        ;#region QSs 35
        '430' : begin
            sDataPath = '2014/07/27/20140727_134107_3893012099/'
                nWaveWin = 1
                aLineRg = [1691, 1790]
                aContRg = [1140, 1319]
              end
        '431' : begin
            sDataPath = '2014/07/29/20140729_054609_3893012099/'
                nWaveWin = 1
                aLineRg = [1693, 1804]
                aContRg = [1132, 1406]
              end
        '432' : begin
            sDataPath = '2015/05/10/20150510_050907_3893012099/'
                nWaveWin = 1
                aLineRg = [1695, 1782]
                aContRg = [1192, 1381]
              end
        '433' : begin
            sDataPath = '2015/05/14/20150514_045234_3893012099/'
                nWaveWin = 1
                aLineRg = [1700, 1770]
                aContRg = [1167, 1415]
              end
        '434' : begin
            sDataPath = '2015/06/09/20150609_051510_3893012099/'
                nWaveWin = 1
                aLineRg = [1688, 1787]
                aContRg = [1186, 1432]
              end
        '435' : begin
            sDataPath = '2015/06/14/20150614_150248_3893012099/'
                nWaveWin = 1
                aLineRg = [1704, 1770]
                aContRg = [1266, 1448]
              end
        '436' : begin
            sDataPath = '2016/02/23/20160223_053127_3893012099/'
                nWaveWin = 1
                aLineRg = [1696, 1789]
                aContRg = [1184, 1438]
              end
        '437' : begin
            sDataPath = '2016/03/03/20160303_051512_3893012099/'
                nWaveWin = 1
                aLineRg = [1686, 1790]
                aContRg = [1247, 1441]
              end
        '438' : begin
            sDataPath = '2016/03/05/20160305_074412_3893012099/'
                nWaveWin = 1
                aLineRg = [1697, 1773]
                aContRg = [1125, 1441]
              end
        '439' : begin
            sDataPath = '2016/03/06/20160306_081805_3893012099/'
                nWaveWin = 1
                aLineRg = [1702, 1770]
                aContRg = [1127, 1366]
              end
        '440' : begin
            sDataPath = '2016/03/27/20160327_053533_3893012099/'
                nWaveWin = 1
                aLineRg = [1696, 1774]
                aContRg = [1230, 1427]
              end
        '441' : begin
            sDataPath = '2016/04/07/20160407_050433_3893012099/'
                nWaveWin = 1
                aLineRg = [1696, 1776]
                aContRg = [1169, 1445]
              end
        '442' : begin
            sDataPath = '2016/05/10/20160510_051451_3893012099/'
                nWaveWin = 1
                aLineRg = [1703, 1787]
                aContRg = [1244, 1546]
              end
        '443' : begin
            sDataPath = '2016/05/12/20160512_054958_3893012099/'
                nWaveWin = 1
                aLineRg = [1705, 1765]
                aContRg = [1091, 1312]
              end
        '444' : begin
            sDataPath = '2016/05/15/20160515_171455_3893012099/'
                nWaveWin = 1
                aLineRg = [1698, 1788]
                aContRg = [1172, 1415]
              end
        '445' : begin
            sDataPath = '2016/05/17/20160517_051325_3893012099/'
                nWaveWin = 1
                aLineRg = [1706, 1782]
                aContRg = [1125, 1271]
              end
        ;endregion
        ;#region QS 36
        '446' : begin
            sDataPath = '2016/06/30/20160630_052003_3893012099/'
                nWaveWin = 1
                aLineRg = [1704, 1779]
                aContRg = [1154, 1417]
              end
        '447' : begin
            sDataPath = '2016/07/03/20160703_032343_3893012099/'
                nWaveWin = 1
                aLineRg = [1695, 1768]
                aContRg = [1108, 1364]
              end
        '448' : begin
            sDataPath = '2016/07/05/20160705_021533_3893012099/'
                nWaveWin = 1
                aLineRg = [1696, 1785]
                aContRg = [1115, 1336]
              end
        ;#endregion 
        ;#region QS 37
        '449' : begin
            sDataPath = '2014/07/01/20140701_062609_3893012099/'
                nWaveWin = 1
                aLineRg = [1689, 1786]
                aContRg = [1154, 1404]
              end
        '450' : begin
            sDataPath = '2014/07/03/20140703_153609_3893012099/'
                nWaveWin = 1
                aLineRg = [1698, 1777]
                aContRg = [1098, 1286]
              end
        '451' : begin
            sDataPath = '2014/07/06/20140706_221109_3893012099/'
                nWaveWin = 1
                aLineRg = [1703, 1796]
                aContRg = [1111, 1290]
              end
        '452' : begin
            sDataPath = '2014/07/08/20140708_044107_3893012099/'
                nWaveWin = 1
                aLineRg = [1693, 1777]
                aContRg = [1132, 1346]
              end
        '453' : begin
            sDataPath = '2014/07/10/20140710_052016_3893012099/'
                nWaveWin = 1
                aLineRg = [1683, 1785]
                aContRg = [1158, 1409]
              end
        '454' : begin
            sDataPath = '2014/07/13/20140713_034539_3893012099/'
                nWaveWin = 1
                aLineRg = [1685, 1785]
                aContRg = [1136, 1418]
              end
        '455' : begin
            sDataPath = '2014/07/15/20140715_111309_3893012099/'
                nWaveWin = 1
                aLineRg = [1697, 1791]
                aContRg = [1105, 1264]
              end
        '456' : begin
            sDataPath = '2014/07/17/20140717_161109_3893012099/'
                nWaveWin = 1
                aLineRg = [1681, 1780]
                aContRg = [1111, 1378]
              end
        '457' : begin
            sDataPath = '2014/07/20/20140720_154352_3893012099/'
                nWaveWin = 1
                aLineRg = [1689, 1799]
                aContRg = [1110, 1200]
              end
        '458' : begin
            sDataPath = '2014/07/22/20140722_154407_3893012099/'
                nWaveWin = 1
                aLineRg = [1697, 1781]
                aContRg = [1153, 1431]
              end
        '459' : begin
            sDataPath = '2014/07/24/20140724_050107_3893012099/'
                nWaveWin = 1
                aLineRg = [1705, 1798]
                aContRg = [1155, 1409]
              end
        '460' : begin
            sDataPath = '2014/07/27/20140727_134107_3893012099/'
                nWaveWin = 1
                aLineRg = [1700, 1786]
                aContRg = [1125, 1309]
              end
        '461' : begin
            sDataPath = '2014/07/29/20140729_054609_3893012099/'
                nWaveWin = 1
                aLineRg = [1702, 1795]
                aContRg = [1114, 1306]
              end
        ;#endregion
        else : message, 'Do not exist this event number: ' + sEvtNum
      endcase
  endif $
  else begin
      message, 'No such line ID: ' + sLineID
  endelse
  
end

