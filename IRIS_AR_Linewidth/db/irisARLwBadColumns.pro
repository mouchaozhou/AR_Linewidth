function irisARLwBadColumns, sEvtNum, sLineID, nMaxColumn

  if (sLineID eq 'SIIV1394') then begin
      case sEvtNum of 
        '5' : aDelColumns = mo_gradeArray(4,1,6)
        '10' : aDelColumns = mo_gradeArray(16,1,nMaxColumn)
        '15' : aDelColumns = [mo_gradeArray(0,1,10), mo_gradeArray(46,1,nMaxColumn)]
        '24' : aDelColumns = mo_gradeArray(2,1,4)
        '26' : aDelColumns = mo_gradeArray(0,1,9)
        '27' : aDelColumns = mo_gradeArray(38,1,40)
        '34' : aDelColumns = mo_gradeArray(38,1,40)
        '36' : aDelColumns = mo_gradeArray(62,1,nMaxColumn)
        '39' : aDelColumns = mo_gradeArray(45,1,47)
        '43' : aDelColumns = mo_gradeArray(40,1,42)
        '44' : aDelColumns = [mo_gradeArray(42,1,44), mo_gradeArray(53,1,55)]
        '52' : aDelColumns = mo_gradeArray(7,1,10)
        '54' : aDelColumns = mo_gradeArray(44,1,47)
        '56' : aDelColumns = mo_gradeArray(47,1,49)
        '57' : aDelColumns = mo_gradeArray(30,1,32)
        '64' : aDelColumns = mo_gradeArray(43,1,45)
        '66' : aDelColumns = mo_gradeArray(34,1,36)
        '68' : aDelColumns = mo_gradeArray(4,1,6)
        '72' : aDelColumns = mo_gradeArray(41,1,43)
        '73' : aDelColumns = mo_gradeArray(17,1,19)
        '77' : aDelColumns = mo_gradeArray(54,1,56)
        '78' : aDelColumns = mo_gradeArray(62,1,nMaxColumn)
        '83' : aDelColumns = mo_gradeArray(10,1,12)
        '84' : aDelColumns = mo_gradeArray(31,1,33)
        '89' : aDelColumns = [mo_gradeArray(19,1,22), mo_gradeArray(125,1,150), mo_gradeArray(312,1,331)]
        '90' : aDelColumns = [mo_gradeArray(64,1,93), mo_gradeArray(255,1,270), mo_gradeArray(331,1,338)]
        '91' : aDelColumns = mo_gradeArray(23,1,27)
        '108' : aDelColumns = [mo_gradeArray(56,1,59), mo_gradeArray(280,1,283)]
        '109' : aDelColumns = [mo_gradeArray(0,1,15), mo_gradeArray(288,1,291)]
        '110' : aDelColumns = mo_gradeArray(30,1,33)
        '111' : aDelColumns = [mo_gradeArray(145,1,148), mo_gradeArray(200,1,203)]
        '112' : aDelColumns = mo_gradeArray(36,1,40)
        '113' : aDelColumns = mo_gradeArray(251,1,255)
        '115' : aDelColumns = mo_gradeArray(80,1,83)
        '116' : aDelColumns = mo_gradeArray(262,1,265)
        '121' : aDelColumns = [mo_gradeArray(68,1,71), mo_gradeArray(304,1,344)]
        '122' : aDelColumns = mo_gradeArray(208,1,253)
        '123' : aDelColumns = [mo_gradeArray(24,1,27), mo_gradeArray(127,1,168)]
        '125' : aDelColumns = mo_gradeArray(61,1,72)
        '126' : aDelColumns = mo_gradeArray(26,1,29)
        '127' : aDelColumns = mo_gradeArray(0,1,40) 
        '130' : aDelColumns = mo_gradeArray(0,1,143)
        '139' : aDelColumns = mo_gradeArray(40,1,43)
        '140' : aDelColumns = mo_gradeArray(0,1,97)
        '143' : aDelColumns = mo_gradeArray(98,1,101)
        '144' : aDelColumns = mo_gradeArray(120,1,123)
        '145' : aDelColumns = [mo_gradeArray(53,1,72), mo_gradeArray(239,1,259)]
        '146' : aDelColumns = [mo_gradeArray(35,1,38), mo_gradeArray(140,1,165)]
        '148' : aDelColumns = [mo_gradeArray(105,1,108), mo_gradeArray(149,1,152), mo_gradeArray(160,1,178), mo_gradeArray(293,1,296)]
        '149' : aDelColumns = [mo_gradeArray(155,1,177), mo_gradeArray(195,1,198)]
        '150' : aDelColumns = [mo_gradeArray(17,1,20), mo_gradeArray(156,1,170)]
        '151' : aDelColumns = [mo_gradeArray(12,1,15), mo_gradeArray(96,1,99), mo_gradeArray(171,1,187), mo_gradeArray(206,1,221)]
        '152' : aDelColumns = [mo_gradeArray(39,1,42), mo_gradeArray(98,1,101)]
        '153' : aDelColumns = [mo_gradeArray(39,1,47), mo_gradeArray(108,1,130)]
        '155' : aDelColumns = [mo_gradeArray(29,1,32), mo_gradeArray(36,1,46), mo_gradeArray(215,1,219)]
        '156' : aDelColumns = mo_gradeArray(204,1,281)
        '157' : aDelColumns = mo_gradeArray(203,1,271)
        '158' : aDelColumns = [mo_gradeArray(7,1,12), mo_gradeArray(13,1,17), mo_gradeArray(20,1,26), mo_gradeArray(34,1,39), mo_gradeArray(44,1,53), mo_gradeArray(77,1,81), $
                              mo_gradeArray(99,1,103), mo_gradeArray(118,1,121), mo_gradeArray(216,1,279)]
        '160' : aDelColumns = mo_gradeArray(70,1,88)
        '161' : aDelColumns = [mo_gradeArray(4,1,46), mo_gradeArray(118,1,121), mo_gradeArray(126,1,129), mo_gradeArray(161,1,164), mo_gradeArray(266,1,269), mo_gradeArray(272,1,275)]
        '162' : aDelColumns = mo_gradeArray(0,1,55)
        '163' : aDelColumns = [mo_gradeArray(-1,1,59), mo_gradeArray(175,1,178)]
        '164' : aDelColumns = mo_gradeArray(240,1,243)
        '165' : aDelColumns = [mo_gradeArray(15,1,24), mo_gradeArray(52,1,59), mo_gradeArray(170,1,187), mo_gradeArray(225,1,251), mo_gradeArray(305,1,309)]
        '166' : aDelColumns = mo_gradeArray(0,1,55)
        '167' : aDelColumns = [mo_gradeArray(194,1,197), mo_gradeArray(202,1,207)]
        '168' : aDelColumns = [mo_gradeArray(0,1,48), mo_gradeArray(62,1,65), mo_gradeArray(192,1,234)]
        '169' : aDelColumns = [mo_gradeArray(0,1,140), mo_gradeArray(168,1,186), mo_gradeArray(226,1,266)]
        '170' : aDelColumns = mo_gradeArray(0,1,9)
        '171' : aDelColumns = [mo_gradeArray(27,1,45), mo_gradeArray(177,1,192)]
        '172' : aDelColumns = mo_gradeArray(244,1,247)
        '175' : aDelColumns = mo_gradeArray(267,1,nMaxColumn)
        '176' : aDelColumns = [mo_gradeArray(165,1,183), mo_gradeArray(228,1,264)]
        '177' : aDelColumns = [mo_gradeArray(-1,1,50), mo_gradeArray(174,1,190), mo_gradeArray(230,1,248)]
        '178' : aDelColumns = [mo_gradeArray(6,1,28), mo_gradeArray(82,1,97)]
        '179' : aDelColumns = mo_gradeArray(0,1,48)
        '180' : aDelColumns = [mo_gradeArray(0,1,58), mo_gradeArray(206,1,210)]
        '181' : aDelColumns = [mo_gradeArray(0,1,39), mo_gradeArray(203,1,207)]
        '183' : aDelColumns = mo_gradeArray(88,1,104)
        '184' : aDelColumns = mo_gradeArray(107,1,128)
        '185' : aDelColumns = mo_gradeArray(234,1,309)
        '186' : aDelColumns = mo_gradeArray(245,1,314)
        '187' : aDelColumns = [mo_gradeArray(0,1,128), mo_gradeArray(259,1,284)]
        '188' : aDelColumns = [mo_gradeArray(33,1,56), mo_gradeArray(107,1,118)]
        '189' : aDelColumns = [mo_gradeArray(19,1,76), mo_gradeArray(122,1,125), mo_gradeArray(155,1,160)]
        '190' : aDelColumns = [mo_gradeArray(12,1,83), mo_gradeArray(149,1,152)]
        '192' : aDelColumns = mo_gradeArray(97,1,100)
        '194' : aDelColumns = mo_gradeArray(230,1,294)
        '198' : aDelColumns = mo_gradeArray(185,1,188)
        '199' : aDelColumns = mo_gradeArray(243,1,295)
        '200' : aDelColumns = mo_gradeArray(241,1,278)
        '201' : aDelColumns = mo_gradeArray(238,1,299)
        '202' : aDelColumns = mo_gradeArray(230,1,304)
        '204' : aDelColumns = mo_gradeArray(31,1,55)
        '205' : aDelColumns = mo_gradeArray(15,1,nMaxColumn)
        '206' : aDelColumns = mo_gradeArray(208,1,211)
        '207' : aDelColumns = mo_gradeArray(0,1,39)
        '208' : aDelColumns = mo_gradeArray(12,1,49)
        '209' : aDelColumns = [mo_gradeArray(25,1,36), mo_gradeArray(39,1,51), mo_gradeArray(256,1,259)]
        '210' : aDelColumns = mo_gradeArray(290,1,293)
        '214' : aDelColumns = mo_gradeArray(0,1,71)
        '216' : aDelColumns = mo_gradeArray(223,1,297)
        '217' : aDelColumns = mo_gradeArray(105,1,169)
        '219' : aDelColumns = [mo_gradeArray(29,1,51), mo_gradeArray(98,1,117), mo_gradeArray(205,1,208)]
        '220' : aDelColumns = [mo_gradeArray(22,1,68), mo_gradeArray(180,1,183)]
        '221' : aDelColumns = mo_gradeArray(0,1,78)
        '222' : aDelColumns = [mo_gradeArray(0,1,71), mo_gradeArray(156,1,160)]
        '223' : aDelColumns = mo_gradeArray(227,1,278)
        '225' : aDelColumns = [mo_gradeArray(167,1,170), mo_gradeArray(279,1,282)]
        '226' : aDelColumns = [mo_gradeArray(90,1,109), mo_gradeArray(296,1,299)]
        '229' : aDelColumns = mo_gradeArray(233,1,236)
        '231' : aDelColumns = mo_gradeArray(8,1,50)
        '232' : aDelColumns = mo_gradeArray(86,1,89)
        '233' : aDelColumns = mo_gradeArray(107,1,110)
        '234' : aDelColumns = mo_gradeArray(216,1,296)
        '235' : aDelColumns = mo_gradeArray(194,1,197)
        '236' : aDelColumns = mo_gradeArray(22,1,65)
        '237' : aDelColumns = mo_gradeArray(0,1,77)
        '238' : aDelColumns = mo_gradeArray(69,1,72)
        '239' : aDelColumns = [mo_gradeArray(42,1,45), mo_gradeArray(245,1,271)]
        '240' : aDelColumns = mo_gradeArray(226,1,300)
        '241' : aDelColumns = [mo_gradeArray(18,1,68), mo_gradeArray(269,1,274)]
        '242' : aDelColumns = [mo_gradeArray(99,1,102), mo_gradeArray(233,1,236)]
        '244' : aDelColumns = [mo_gradeArray(31,1,34), mo_gradeArray(208,1,214)]
        '245' : aDelColumns = mo_gradeArray(0,1,77)
        '246' : aDelColumns = mo_gradeArray(11,1,69)
        '248' : aDelColumns = mo_gradeArray(238,1,290)
        '249' : aDelColumns = mo_gradeArray(0,1,159)
        '250' : aDelColumns = mo_gradeArray(222,1,304)
        '251' : aDelColumns = mo_gradeArray(138,1,141)
        '252' : aDelColumns = [mo_gradeArray(86,1,115), mo_gradeArray(209,1,289)]
        '253' : aDelColumns = mo_gradeArray(73,1,82)
        '254' : aDelColumns = mo_gradeArray(0,1,54)
        '255' : aDelColumns = mo_gradeArray(0,1,58)
        '256' : aDelColumns = [mo_gradeArray(80,1,83), mo_gradeArray(216,1,294)]
        '258' : aDelColumns = mo_gradeArray(88,1,91)
        '259' : aDelColumns = mo_gradeArray(0,1,79)
        '260' : aDelColumns = [mo_gradeArray(0,1,72), mo_gradeArray(263,1,280)]
        '261' : aDelColumns = [mo_gradeArray(103,1,106), mo_gradeArray(248,1,264)]
        '262' : aDelColumns = [mo_gradeArray(138,1,144), mo_gradeArray(267,1,273)]
        '263' : aDelColumns = [mo_gradeArray(0,1,68), mo_gradeArray(92,1,95)]
        '264' : aDelColumns = mo_gradeArray(4,1,62)
        '265' : aDelColumns = mo_gradeArray(239,1,242)
        '266' : aDelColumns = mo_gradeArray(184,1,187)
        '267' : aDelColumns = mo_gradeArray(28,1,212)
        '268' : aDelColumns = mo_gradeArray(142,1,145)
        '269' : aDelColumns = mo_gradeArray(33,1,36)
        '270' : aDelColumns = [mo_gradeArray(118,1,121), mo_gradeArray(256,1,278)]
        '271' : aDelColumns = mo_gradeArray(3,1,58)
        '272' : aDelColumns = mo_gradeArray(9,1,229)
        '273' : aDelColumns = mo_gradeArray(82,1,85)
        '274' : aDelColumns = [mo_gradeArray(34,1,38), mo_gradeArray(211,1,288)]
        '275' : aDelColumns = [mo_gradeArray(0,1,66), mo_gradeArray(130,1,133)]
        '276' : aDelColumns = mo_gradeArray(199,1,278)
        '277' : aDelColumns = [mo_gradeArray(27,1,30), mo_gradeArray(228,1,285)]
        '278' : aDelColumns = mo_gradeArray(92,1,95)
        '279' : aDelColumns = mo_gradeArray(236,1,265)
        '280' : aDelColumns = [mo_gradeArray(0,1,28), mo_gradeArray(54,1,57)]
        '282' : aDelColumns = mo_gradeArray(41,1,44)
        '285' : aDelColumns = [mo_gradeArray(0,1,49), mo_gradeArray(77,1,86)]
        '286' : aDelColumns = mo_gradeArray(225,1,288)
        '287' : aDelColumns = mo_gradeArray(231,1,300)
        '288' : aDelColumns = mo_gradeArray(245,1,269)
        '289' : aDelColumns = mo_gradeArray(222,1,289)
        '292' : aDelColumns = [mo_gradeArray(183,1,199), mo_gradeArray(240,1,284)]
        '293' : aDelColumns = mo_gradeArray(230,1,233)
        '295' : aDelColumns = mo_gradeArray(0,1,79)
        '296' : aDelColumns = mo_gradeArray(0,1,83)
        '297' : aDelColumns = mo_gradeArray(124,1,127)
        '298' : aDelColumns = mo_gradeArray(243,1,295)
        '302' : aDelColumns = [mo_gradeArray(177,1,207), mo_gradeArray(240,1,312)]
        '303' : aDelColumns = mo_gradeArray(226,1,300)
        '304' : aDelColumns = [mo_gradeArray(35,1,56), mo_gradeArray(68,1,71), mo_gradeArray(103,1,125)]
        '305' : aDelColumns = mo_gradeArray(0,1,78)
        '306' : aDelColumns = [mo_gradeArray(74,1,77), mo_gradeArray(242,1,306)]
        '307' : aDelColumns = mo_gradeArray(139,1,142)
        '309' : aDelColumns = [mo_gradeArray(43,1,54), mo_gradeArray(96,1,132)]
        '310' : aDelColumns = [mo_gradeArray(0,1,73), mo_gradeArray(206,1,209)]
        '311' : aDelColumns = [mo_gradeArray(64,1,68), mo_gradeArray(238,1,249)]
        '313' : aDelColumns = mo_gradeArray(113,1,116)
        '315' : aDelColumns = mo_gradeArray(0,1,90)
        '318' : aDelColumns = mo_gradeArray(32,1,35)
        '319' : aDelColumns = mo_gradeArray(229,1,280)
        '320' : aDelColumns = [mo_gradeArray(0,1,84), mo_gradeArray(223,1,226)]
        '321' : aDelColumns = mo_gradeArray(228,1,297)
        '322' : aDelColumns = mo_gradeArray(234,1,262)
        '325' : aDelColumns = [mo_gradeArray(19,1,42), mo_gradeArray(306,1,309)]
        '327' : aDelColumns = mo_gradeArray(251,1,273)
        '329' : aDelColumns = mo_gradeArray(26,1,58)
        '330' : aDelColumns = mo_gradeArray(255,1,258)
        '331' : aDelColumns = mo_gradeArray(272,1,275)
        '333' : aDelColumns = mo_gradeArray(86,1,89)
        '339' : aDelColumns = mo_gradeArray(256,1,259)
        '340' : aDelColumns = mo_gradeArray(233,1,310)
        '341' : aDelColumns = [mo_gradeArray(40,1,70), mo_gradeArray(171,1,174)]
        '342' : aDelColumns = [mo_gradeArray(195,1,198), mo_gradeArray(238,1,305)]
        '343' : aDelColumns = [mo_gradeArray(201,1,204), mo_gradeArray(256,1,259)]
        '344' : aDelColumns = mo_gradeArray(0,1,91)
        '345' : aDelColumns = mo_gradeArray(231,1,296)
        '347' : aDelColumns = [mo_gradeArray(9,1,12), mo_gradeArray(226,1,229)]
        '348' : aDelColumns = mo_gradeArray(225,1,228)
        '349' : aDelColumns = [mo_gradeArray(31,1,47), mo_gradeArray(178,1,181)]
        '351' : aDelColumns = mo_gradeArray(236,1,312)
        '353' : aDelColumns = mo_gradeArray(249,1,nMaxColumn)
        '356' : aDelColumns = mo_gradeArray(239,1,316)
        '357' : aDelColumns = mo_gradeArray(163,1,166)
        '360' : aDelColumns = mo_gradeArray(136,1,139)
        '362' : aDelColumns = mo_gradeArray(21,1,64)
        '364' : aDelColumns = mo_gradeArray(56,1,nMaxColumn)
        '368' : aDelColumns = [mo_gradeArray(72,1,75), mo_gradeArray(164,1,167)]
        '369' : aDelColumns = mo_gradeArray(25,1,100)
        '371' : aDelColumns = mo_gradeArray(151,1,154)
        '372' : aDelColumns = mo_gradeArray(46,1,49)
        '373' : aDelColumns = mo_gradeArray(251,1,283)
        '374' : aDelColumns = [mo_gradeArray(0,1,33), mo_gradeArray(146,1,149)]
        '375' : aDelColumns = [mo_gradeArray(242,1,nMaxColumn), mo_gradeArray(147,1,150)]
        '377' : aDelColumns = mo_gradeArray(158,1,161)
        '378' : aDelColumns = mo_gradeArray(76,1,79)
        '379' : aDelColumns = mo_gradeArray(66,1,69)
        '380' : aDelColumns = mo_gradeArray(78,1,81)
        '381' : aDelColumns = mo_gradeArray(32,1,35)
        '382' : aDelColumns = mo_gradeArray(7,1,10)
        '383' : aDelColumns = mo_gradeArray(34,1,37)
        '384' : aDelColumns = [mo_gradeArray(54,1,121), mo_gradeArray(160,1,163), mo_gradeArray(235,1,238)]
        '385' : aDelColumns = mo_gradeArray(283,1,nMaxColumn)
        '386' : aDelColumns = mo_gradeArray(268,1,nMaxColumn)
        '388' : aDelColumns = mo_gradeArray(297,1,300)
        '389' : aDelColumns = mo_gradeArray(51,1,117)
        '390' : aDelColumns = mo_gradeArray(276,1,nMaxColumn)
        '391' : aDelColumns = mo_gradeArray(283,1,286)
        '396' : aDelColumns = mo_gradeArray(53,1,130)
        '397' : aDelColumns = mo_gradeArray(282,1,nMaxColumn)
        '400' : aDelColumns = mo_gradeArray(51,1,129)
        '402' : aDelColumns = [mo_gradeArray(133,1,136), mo_gradeArray(191,1,218)]
        '403' : aDelColumns = mo_gradeArray(59,1,137)
        '404' : aDelColumns = mo_gradeArray(164,1,167)
        '405' : aDelColumns = mo_gradeArray(84,1,92)
        '406' : aDelColumns = mo_gradeArray(229,1,232)
        '411' : aDelColumns = [mo_gradeArray(147,1,150), mo_gradeArray(240,1,243)]
        '415' : aDelColumns = mo_gradeArray(347,1,350)
        '416' : aDelColumns = mo_gradeArray(266,1,269)
        '439' : aDelColumns = mo_gradeArray(2,1,4)
        '442' : aDelColumns = mo_gradeArray(0,1,9)
        '443' : aDelColumns = [mo_gradeArray(0,1,5), mo_gradeArray(15,1,nMaxColumn)]
        else : return, -1
      endcase
  endif $
  else if (sLineID eq 'SIIV1403') then begin
      case sEvtNum of 
        '89' : aDelColumns = [mo_gradeArray(19,1,22), mo_gradeArray(125,1,150), mo_gradeArray(312,1,331)]
        '90' : aDelColumns = [mo_gradeArray(64,1,93), mo_gradeArray(255,1,270), mo_gradeArray(331,1,338)]
        '91' : aDelColumns = mo_gradeArray(23,1,27)
        '109' : aDelColumns = [mo_gradeArray(0,1,15), mo_gradeArray(288,1,291)]
        '110' : aDelColumns = mo_gradeArray(30,1,33)
        '111' : aDelColumns = [mo_gradeArray(145,1,148), mo_gradeArray(200,1,203)]
        '112' : aDelColumns = mo_gradeArray(36,1,40)
        '113' : aDelColumns = mo_gradeArray(251,1,255)
        '115' : aDelColumns = mo_gradeArray(80,1,83)
        '116' : aDelColumns = mo_gradeArray(262,1,265)
        '121' : aDelColumns = [mo_gradeArray(68,1,71), mo_gradeArray(304,1,344)]
        '122' : aDelColumns = mo_gradeArray(208,1,253)
        '123' : aDelColumns = [mo_gradeArray(24,1,27), mo_gradeArray(127,1,168)]
        '125' : aDelColumns = mo_gradeArray(61,1,72)
        '126' : aDelColumns = mo_gradeArray(26,1,29)
        '127' : aDelColumns = mo_gradeArray(0,1,40) 
        '130' : aDelColumns = mo_gradeArray(0,1,143)
        '139' : aDelColumns = mo_gradeArray(40,1,43)
        '140' : aDelColumns = mo_gradeArray(0,1,97)
        '155' : aDelColumns = [mo_gradeArray(29,1,32), mo_gradeArray(36,1,46), mo_gradeArray(215,1,219)]
        '156' : aDelColumns = mo_gradeArray(204,1,281)
        '157' : aDelColumns = mo_gradeArray(203,1,271)
        '158' : aDelColumns = [mo_gradeArray(2,1,6), mo_gradeArray(15,1,19), mo_gradeArray(24,1,33), mo_gradeArray(35,1,39), mo_gradeArray(64,1,69), mo_gradeArray(79,1,85), $
                              mo_gradeArray(91,1,95), mo_gradeArray(116,1,121), mo_gradeArray(221,1,276)]
        '160' : aDelColumns = mo_gradeArray(70,1,88)
        '161' : aDelColumns = [mo_gradeArray(4,1,46), mo_gradeArray(118,1,121), mo_gradeArray(126,1,129), mo_gradeArray(161,1,164), mo_gradeArray(266,1,269), mo_gradeArray(272,1,275)]
        '162' : aDelColumns = mo_gradeArray(0,1,55)
        '163' : aDelColumns = [mo_gradeArray(-1,1,59), mo_gradeArray(175,1,178)]
        '164' : aDelColumns = mo_gradeArray(240,1,243)
        '165' : aDelColumns = [mo_gradeArray(15,1,24), mo_gradeArray(52,1,59), mo_gradeArray(170,1,187), mo_gradeArray(225,1,251), mo_gradeArray(305,1,309)]
        '166' : aDelColumns = mo_gradeArray(0,1,55)
        '167' : aDelColumns = [mo_gradeArray(194,1,197), mo_gradeArray(202,1,207)]
        '168' : aDelColumns = [mo_gradeArray(0,1,48), mo_gradeArray(62,1,65), mo_gradeArray(192,1,234)]
        '169' : aDelColumns = [mo_gradeArray(0,1,140), mo_gradeArray(168,1,186), mo_gradeArray(226,1,266)]
        '170' : aDelColumns = mo_gradeArray(0,1,9)
        '171' : aDelColumns = [mo_gradeArray(27,1,45), mo_gradeArray(177,1,192)]
        '172' : aDelColumns = mo_gradeArray(244,1,247)
        '175' : aDelColumns = mo_gradeArray(267,1,nMaxColumn)
        '176' : aDelColumns = [mo_gradeArray(165,1,183), mo_gradeArray(228,1,264)]
        '177' : aDelColumns = [mo_gradeArray(-1,1,50), mo_gradeArray(174,1,190), mo_gradeArray(230,1,248)]
        '178' : aDelColumns = [mo_gradeArray(6,1,28), mo_gradeArray(82,1,97)]
        '179' : aDelColumns = mo_gradeArray(0,1,48)
        '180' : aDelColumns = [mo_gradeArray(0,1,58), mo_gradeArray(206,1,210)]
        '181' : aDelColumns = [mo_gradeArray(0,1,39), mo_gradeArray(203,1,207)]
        '183' : aDelColumns = mo_gradeArray(88,1,104)
        '184' : aDelColumns = mo_gradeArray(107,1,128)
        '185' : aDelColumns = mo_gradeArray(234,1,309)
        '186' : aDelColumns = mo_gradeArray(245,1,314)
        '187' : aDelColumns = [mo_gradeArray(0,1,128), mo_gradeArray(259,1,284)]
        '188' : aDelColumns = [mo_gradeArray(33,1,56), mo_gradeArray(107,1,118)]
        '189' : aDelColumns = [mo_gradeArray(19,1,76), mo_gradeArray(122,1,125), mo_gradeArray(155,1,160)]
        '190' : aDelColumns = [mo_gradeArray(12,1,83), mo_gradeArray(149,1,152)]
        '192' : aDelColumns = mo_gradeArray(97,1,100)
        '194' : aDelColumns = mo_gradeArray(230,1,294)
        '198' : aDelColumns = mo_gradeArray(185,1,188)
        '199' : aDelColumns = mo_gradeArray(243,1,295)
        '200' : aDelColumns = mo_gradeArray(241,1,278)
        '201' : aDelColumns = mo_gradeArray(238,1,299)
        '202' : aDelColumns = mo_gradeArray(230,1,304)
        '264' : aDelColumns = mo_gradeArray(4,1,62)
        '265' : aDelColumns = mo_gradeArray(239,1,242)
        '266' : aDelColumns = mo_gradeArray(184,1,187)
        '267' : aDelColumns = mo_gradeArray(28,1,212)
        '268' : aDelColumns = mo_gradeArray(142,1,145)
        '269' : aDelColumns = mo_gradeArray(33,1,36)
        '270' : aDelColumns = [mo_gradeArray(118,1,121), mo_gradeArray(256,1,278)]
        '271' : aDelColumns = mo_gradeArray(3,1,58)
        '272' : aDelColumns = mo_gradeArray(9,1,229)
        '273' : aDelColumns = mo_gradeArray(82,1,85)
        '274' : aDelColumns = [mo_gradeArray(34,1,38), mo_gradeArray(211,1,288)]
        '275' : aDelColumns = [mo_gradeArray(0,1,66), mo_gradeArray(130,1,133)]
        '276' : aDelColumns = mo_gradeArray(199,1,278)
        '277' : aDelColumns = [mo_gradeArray(27,1,30), mo_gradeArray(228,1,285)]
        '278' : aDelColumns = mo_gradeArray(92,1,95)
        '279' : aDelColumns = mo_gradeArray(236,1,265)
        '280' : aDelColumns = [mo_gradeArray(0,1,28), mo_gradeArray(54,1,57)]
        '282' : aDelColumns = mo_gradeArray(41,1,44)
        '285' : aDelColumns = [mo_gradeArray(0,1,49), mo_gradeArray(77,1,86)]
        '286' : aDelColumns = mo_gradeArray(225,1,288)
        '287' : aDelColumns = mo_gradeArray(231,1,300)
        '288' : aDelColumns = mo_gradeArray(245,1,269)
        '289' : aDelColumns = mo_gradeArray(222,1,289)
        '292' : aDelColumns = [mo_gradeArray(183,1,199), mo_gradeArray(240,1,284)]
        '293' : aDelColumns = mo_gradeArray(230,1,233)
        '295' : aDelColumns = mo_gradeArray(0,1,79)
        '296' : aDelColumns = mo_gradeArray(0,1,83)
        '297' : aDelColumns = mo_gradeArray(124,1,127)
        '298' : aDelColumns = mo_gradeArray(243,1,295)
        '302' : aDelColumns = [mo_gradeArray(177,1,207), mo_gradeArray(240,1,312)]
        '303' : aDelColumns = mo_gradeArray(226,1,300)
        '304' : aDelColumns = [mo_gradeArray(35,1,56), mo_gradeArray(68,1,71), mo_gradeArray(103,1,125)]
        '305' : aDelColumns = mo_gradeArray(0,1,78)
        '306' : aDelColumns = [mo_gradeArray(74,1,77), mo_gradeArray(242,1,306)]
        '307' : aDelColumns = mo_gradeArray(139,1,142)
        '309' : aDelColumns = [mo_gradeArray(43,1,54), mo_gradeArray(96,1,132)]
        '310' : aDelColumns = [mo_gradeArray(0,1,73), mo_gradeArray(206,1,209)]
        '311' : aDelColumns = [mo_gradeArray(64,1,68), mo_gradeArray(238,1,249)]
        '313' : aDelColumns = mo_gradeArray(113,1,116)
        '315' : aDelColumns = mo_gradeArray(0,1,90)
        '318' : aDelColumns = mo_gradeArray(32,1,35)
        '319' : aDelColumns = mo_gradeArray(229,1,280)
        '320' : aDelColumns = [mo_gradeArray(0,1,84), mo_gradeArray(223,1,226)]
        '321' : aDelColumns = mo_gradeArray(228,1,297)
        '322' : aDelColumns = mo_gradeArray(234,1,262)
        '325' : aDelColumns = [mo_gradeArray(19,1,42), mo_gradeArray(306,1,309)]
        '327' : aDelColumns = mo_gradeArray(251,1,273)
        '329' : aDelColumns = mo_gradeArray(26,1,58)
        '330' : aDelColumns = mo_gradeArray(255,1,258)
        '331' : aDelColumns = mo_gradeArray(272,1,275)
        '333' : aDelColumns = mo_gradeArray(86,1,89)
        '339' : aDelColumns = mo_gradeArray(256,1,259)
        '340' : aDelColumns = mo_gradeArray(233,1,310)
        '341' : aDelColumns = [mo_gradeArray(40,1,70), mo_gradeArray(171,1,174)]
        '342' : aDelColumns = [mo_gradeArray(195,1,198), mo_gradeArray(238,1,305)]
        '343' : aDelColumns = [mo_gradeArray(201,1,204), mo_gradeArray(256,1,259)]
        '344' : aDelColumns = mo_gradeArray(0,1,91)
        '345' : aDelColumns = mo_gradeArray(231,1,296)
        '347' : aDelColumns = [mo_gradeArray(9,1,12), mo_gradeArray(226,1,229)]
        '348' : aDelColumns = mo_gradeArray(225,1,228)
        '349' : aDelColumns = [mo_gradeArray(31,1,47), mo_gradeArray(178,1,181)]
        '351' : aDelColumns = mo_gradeArray(236,1,312)
        '353' : aDelColumns = mo_gradeArray(249,1,nMaxColumn)
        '356' : aDelColumns = mo_gradeArray(239,1,316)
        '357' : aDelColumns = mo_gradeArray(163,1,166)
        '360' : aDelColumns = mo_gradeArray(136,1,139)
        '362' : aDelColumns = mo_gradeArray(21,1,64)
        '364' : aDelColumns = mo_gradeArray(56,1,nMaxColumn)
        '368' : aDelColumns = [mo_gradeArray(72,1,75), mo_gradeArray(164,1,167)]
        '369' : aDelColumns = mo_gradeArray(25,1,100)
        '371' : aDelColumns = mo_gradeArray(151,1,154)
        '372' : aDelColumns = mo_gradeArray(46,1,49)
        '373' : aDelColumns = mo_gradeArray(251,1,283)
        '374' : aDelColumns = [mo_gradeArray(0,1,33), mo_gradeArray(146,1,149)]
        '375' : aDelColumns = [mo_gradeArray(242,1,nMaxColumn), mo_gradeArray(147,1,150)]
        '377' : aDelColumns = mo_gradeArray(158,1,161)
        '378' : aDelColumns = mo_gradeArray(76,1,79)
        '379' : aDelColumns = mo_gradeArray(66,1,69)
        '380' : aDelColumns = mo_gradeArray(78,1,81)
        '381' : aDelColumns = mo_gradeArray(32,1,35)
        '382' : aDelColumns = mo_gradeArray(7,1,10)
        '383' : aDelColumns = mo_gradeArray(34,1,37)
        '384' : aDelColumns = [mo_gradeArray(54,1,121), mo_gradeArray(160,1,163), mo_gradeArray(235,1,238)]
        '385' : aDelColumns = mo_gradeArray(283,1,nMaxColumn)
        '386' : aDelColumns = mo_gradeArray(268,1,nMaxColumn)
        '388' : aDelColumns = mo_gradeArray(297,1,300)
        '389' : aDelColumns = mo_gradeArray(51,1,117)
        '390' : aDelColumns = mo_gradeArray(276,1,nMaxColumn)
        '391' : aDelColumns = mo_gradeArray(283,1,286)
        '396' : aDelColumns = mo_gradeArray(53,1,130)
        '397' : aDelColumns = mo_gradeArray(282,1,nMaxColumn)
        '400' : aDelColumns = mo_gradeArray(51,1,129)
        '402' : aDelColumns = [mo_gradeArray(133,1,136), mo_gradeArray(191,1,218)]
        '403' : aDelColumns = mo_gradeArray(59,1,137)
        '404' : aDelColumns = mo_gradeArray(164,1,167)
        '405' : aDelColumns = mo_gradeArray(84,1,92)
        '406' : aDelColumns = mo_gradeArray(229,1,232)
        '411' : aDelColumns = [mo_gradeArray(147,1,150), mo_gradeArray(240,1,243)]
        '415' : aDelColumns = mo_gradeArray(347,1,350)
        '416' : aDelColumns = mo_gradeArray(266,1,269)
        '419' : aDelColumns = [mo_gradeArray(11,1,12), mo_gradeArray(15,1,16)]
        '420' : aDelColumns = [2,4,8,10]
        '422' : aDelColumns = [0,1,8,14]
        '423' : aDelColumns = [mo_gradeArray(6,1,8), mo_gradeArray(1,1,2), mo_gradeArray(12,1,16)]
        '424' : aDelColumns = mo_gradeArray(13,1,15)
        '425' : aDelColumns = [1,8]
        '426' : aDelColumns = [7,12,15,16]
        '427' : aDelColumns = [2,7,13,14]
        '428' : aDelColumns = [4,10,15]
        '429' : aDelColumns = [3,6,7,16]
        '430' : aDelColumns = [9,13]
        '432' : aDelColumns = [7,8,12]
        '433' : aDelColumns = [4]
        '434' : aDelColumns = mo_gradeArray(10,1,16)
        '435' : aDelColumns = [4,5,10,12,16]
        '436' : aDelColumns = [mo_gradeArray(6,1,7), mo_gradeArray(11,1,13)]
        '437' : aDelColumns = [0,7,13]
        '438' : aDelColumns = [5]
        '439' : aDelColumns = [mo_gradeArray(2,1,4), mo_gradeArray(12,1,13)]
        ;'440' : aDelColumns = [3,7,12]
        '441' : aDelColumns = [2,3,11,16]
        '442' : aDelColumns = [mo_gradeArray(0,1,12), mo_gradeArray(16,1,17)]
        '443' : aDelColumns = [mo_gradeArray(0,1,5), mo_gradeArray(7,1,8), mo_gradeArray(14,1,nMaxColumn)]
        '444' : aDelColumns = [mo_gradeArray(1,1,4), mo_gradeArray(12,1,14), mo_gradeArray(17, 1,nMaxColumn)]
        '445' : aDelColumns = [mo_gradeArray(3,1,8), mo_gradeArray(10,1,14)]
        '446' : aDelColumns = [mo_gradeArray(5,1,6), mo_gradeArray(13,1,14)]
        '447' : aDelColumns = [mo_gradeArray(13,1,14), 16]
        ;'448' : aDelColumns = [0,5,11]
        '449' : aDelColumns = [11,15]
        '450' : aDelColumns = [2,4,10]
        '452' : aDelColumns = [mo_gradeArray(0,1,2), mo_gradeArray(14,1,15)]
        '453' : aDelColumns = [mo_gradeArray(0,1,2), mo_gradeArray(11,1,12), mo_gradeArray(15,1,nMaxColumn)]
        '454' : aDelColumns = [mo_gradeArray(1,1,2), mo_gradeArray(13,1,15)]
        '455' : aDelColumns = mo_gradeArray(8,1,9)
        '456' : aDelColumns = [mo_gradeArray(5,1,7), mo_gradeArray(11,1,12), mo_gradeArray(14,1,17)]
        '457' : aDelColumns = [mo_gradeArray(1,1,3), mo_gradeArray(13,1,14)]
        '458' : aDelColumns = [mo_gradeArray(4,1,5), mo_gradeArray(10,1,11)]
        '459' : aDelColumns = [mo_gradeArray(3,1,4), mo_gradeArray(6,1,7), mo_gradeArray(16,1,nMaxColumn)]
        '460' : aDelColumns = mo_gradeArray(12,1,14)
        '461' : aDelColumns = mo_gradeArray(0,1,1)
        else : return, -1 
      endcase
  endif $
  else begin
      message, 'No such line ID: ' + sLineID
  endelse

  return, aDelColumns
  
end
