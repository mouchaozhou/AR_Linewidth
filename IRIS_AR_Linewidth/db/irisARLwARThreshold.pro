function irisARLwARThreshold, sEvtNum, sLineID 

  if (sLineID eq 'SIIV1394') then begin
      switch sEvtNum of
        ;1
        '1' : 
        '2' :
        '3' :
        '4' :
        '5' :
        '6' :
        '7' :
        '8' :
        '9' :   
        '10' : 
        ;2
        '11' :
        '12' :
        '13' :
        '14' :
        '15' :
        '16' :
        '17' :
        '18' : 
        ;3
        '19' :
        '20' :
        '21' :
        '22' :
        '23' : 
        ;4
        '24' :
        '25' : 
        '26' : 
        '27' :
        '28' : return,1100
        ;5
        '29' :
        '30' : 
        '31' : 
        '32' : 
        '33' : return,600
        ;6   
        '34' : 
        '35' : 
        '36' : 
        '37' : 
        '38' : return,1000
        ;7
        '39' : 
        '40' : 
        '41' : 
        '42' : 
        '43' : 
        ;8
        '44' : 
        '45' : 
        '46' : 
        '47' : 
        '48' : return,600
        ;9
        '49' : 
        '50' : 
        '51' : 
        '52' : 
        '53' : return,1000
        ;10
        '54' : 
        '55' : 
        '56' : 
        '57' : 
        '58' : 
        '59' : 
        ;11
        '60' : 
        '61' : 
        '62' : 
        '63' : 
        '64' : 
        '65' : 
        '66' : 
        ;12
        '67' : 
        '68' : 
        '69' : 
        '70' : 
        '71' : 
        ;13
        '72' : 
        '73' : 
        '74' : 
        '75' : 
        '76' : return,600
        ;14
        '77' : 
        '78' : 
        '79' : 
        '80' : 
        '81' : 
        '82' : 
        '83' : 
        '84' : 
        '85' : return,800
        ;15
        '86' : 
        '87' : 
        '88' : 
        '89' : 
        '90' : 
        '91' : 
        '92' : 
        '93' : return,2400
        ;16
        '94' : 
        '95' : 
        '96' : 
        '97' : 
        '98' : 
        '99' : 
        '100' : 
        '101' : 
        '102' : 
        '103' : 
        '104' : 
        '105' : 
        '106' :  
        ;17
        '107' : 
        '108' : 
        '109' : 
        '110' : return,1200
        ;18
        '111' : 
        '112' : 
        '113' : 
        '114' : 
        '115' : 
        '116' : 
        '117' : return,800
        ;19
        '118' : 
        '119' : 
        '120' : 
        '121' : 
        '122' : 
        '123' : 
        '124' : 
        '125' : 
        '126' : 
        '127' : 
        '128' : return,400
        '129' : return,200
        '130' : 
        '131' : 
        '132' : 
        '133' : 
        '134' : 
        '135' : 
        '136' : 
        '137' : 
        '138' : 
        '139' : 
        '140' : 
        '141' : 
        '142' : return,200
        '143' : 
        '144' : 
        '145' : return,800
        ;20
        '146' : 
        '147' : 
        '148' : 
        '149' : 
        '150' : 
        '151' : 
        '152' : 
        '153' : return,2400
        ;21
        '154' : 
        '155' : 
        '156' : 
        '157' : 
        '158' : 
        '159' : 
        '160' : 
        '161' : 
        '162' : 
        '163' : 
        '164' : 
        '165' : 
        '166' : 
        '167' : 
        '168' : 
        '169' : 
        '170' : 
        '171' : 
        '172' : 
        '173' : 
        '174' : 
        '175' : 
        '176' : 
        '177' : 
        '178' : 
        '179' : 
        '180' : 
        '181' : 
        '182' :
        ;22
        '183' : 
        '184' : 
        '185' : 
        '186' : 
        '187' : 
        '188' : 
        '189' : 
        '190' : 
        '191' : 
        '192' : 
        '193' : 
        '194' : 
        '195' : 
        '196' : 
        '197' : 
        '198' : 
        '199' : 
        '200' : 
        '201' : 
        '202' :
        ;23
        '203' : 
        '204' : 
        '205' : 
        '206' : 
        '207' : 
        '208' : 
        '209' : 
        '210' : 
        '211' : 
        '212' : 
        '213' : 
        '214' : 
        '215' : 
        '216' : 
        '217' : 
        '218' : 
        '219' : 
        '220' : 
        '221' : 
        '222' : 
        '223' : 
        '224' : 
        '225' : 
        '226' : 
        '227' : 
        '228' : 
        '229' : 
        '230' : 
        '231' : 
        '232' : 
        '233' : 
        '234' : 
        '235' : 
        '236' : 
        '237' : 
        '238' : 
        '239' : 
        '240' : 
        '241' : 
        '242' : 
        '243' : 
        '244' : 
        '245' : 
        '246' : return,800
        ;24
        '247' : 
        '248' : 
        '249' : 
        '250' : 
        '251' : 
        '252' : 
        '253' : 
        '254' : 
        '255' : 
        '256' : 
        '257' : 
        '258' : 
        '259' : 
        '260' : 
        '261' : 
        '262' : 
        '263' : return,600
        ;25
        '264' : return,1600
        '265' : 
        '266' : 
        '267' : 
        '268' : 
        '269' : 
        '270' : 
        '271' : 
        '272' : 
        '273' : return,200
        '274' : 
        '275' : 
        '276' : 
        '277' : return,600
        ;26
        '278' : 
        '279' : return,400
        '280' : 
        '281' : return,2600
        '282' : 
        '283' : 
        '284' : 
        '285' : 
        '286' :  
        '287' : 
        '288' : return,400
        '289' : return,800
        '290' : 
        '291' : return,400
        ;27
        '292' : 
        '293' : 
        '294' : 
        '295' : 
        '296' : 
        '297' : 
        '298' : 
        '299' : 
        '300' : 
        '301' : 
        '302' : 
        '303' : 
        '304' : 
        '305' : 
        '306' : 
        '307' : 
        '308' : 
        '309' : 
        '310' : 
        '311' : 
        '312' : 
        '313' : 
        '314' : 
        '315' : 
        '316' : 
        '317' : 
        '318' : 
        '319' : 
        '320' : 
        '321' : 
        '322' : 
        '323' : 
        '324' : 
        '325' : return,400
        '326' : return,2400
        '327' : return,800
        '328' : 
        '329' : return,2400
        '330' : 
        '331' : 
        '332' : 
        '333' : 
        '334' : 
        '335' : 
        '336' : 
        '337' : return,800
        ;28
        '338' : 
        '339' : 
        '340' : 
        '341' : 
        '342' : 
        '343' : 
        '344' : 
        '345' : 
        '346' : 
        '347' : 
        '348' : 
        '349' : 
        '350' : 
        '351' : 
        '352' : 
        '353' : 
        '354' : 
        '355' : 
        '356' : 
        ;29
        '357' :
        '358' : 
        '359' : 
        '360' : 
        '361' : 
        '362' : 
        '363' : 
        '364' : 
        '365' : 
        '366' : 
        '367' : 
        '368' : 
        '369' : 
        '370' : 
        '371' : 
        '372' : 
        ;30
        '373' : 
        '374' : 
        '375' : 
        '376' : 
        '377' : 
        '378' : 
        '379' : 
        '380' : 
        '381' : 
        '382' : 
        ;31
        '383' : return,400
        '384' : return,800
        '385' : return,200
        '386' : 
        '387' : 
        '388' : 
        '389' : 
        '390' : 
        '391' : 
        '392' : 
        '393' : 
        '394' : return,400
        '395' : 
        '396' : return,200
        '397' : return,400
        '398' : return,300
        '399' : 
        '400' : 
        '401' : 
        '402' : 
        '403' : 
        '404' : 
        '405' : 
        ;32
        '406' : 
        '407' : 
        '408' : 
        '409' : 
        '410' : 
        '411' : 
        '412' : 
        '413' : 
        '414' : 
        '415' : 
        '416' : 
        '417' : 
        '418' : return,400
        ;33
        '419' :
        '420' :
        '421' :
        '422' :
        '423' :
        ;34
        '424' :
        '425' :
        '426' :
        '427' :
        '428' :
        '429' :
        ;35
        '430' :
        '431' : 
        '432' :
        '433' :
        '434' :
        '435' :
        '436' :
        '437' :
        '438' :
        '439' :
        '440' :
        '441' :
        '442' :
        '443' :
        '444' :
        '445' :
        ;36
        '446' :
        '447' :
        '448' :
        ;37
        '449' :
        '450' :
        '451' :
        '452' :
        '453' :
        '454' :
        '455' :
        '456' :
        '457' :
        '458' :
        '459' :
        '460' :
        '461' : return, 0
        else : message, 'No such event' + sEvtNum
      endswitch 
  endif $
  else if (sLineID eq 'SIIV1403') then begin
      switch sEvtNum of
        ;15
        '86' : 
        '87' : 
        '88' : 
        '89' : 
        '90' : 
        '91' : 
        '92' : 
        '93' : return, 1200
        ;16
        '94' : 
        '95' : 
        '96' : 
        '97' : 
        '98' : 
        '99' : 
        '100' : 
        '101' : 
        '102' : 
        '103' : 
        '104' : 
        '105' : 
        '106' :  
        ;17
        '107' : 
        '108' : 
        '109' : 
        '110' : return,600
        ;18
        '111' : 
        '112' : 
        '113' : 
        '114' : 
        '115' : 
        '116' : 
        '117' : 
        ;19
        '118' : 
        '119' : 
        '120' : 
        '121' : 
        '122' : 
        '123' : 
        '124' : 
        '125' : 
        '126' : 
        '127' : 
        '128' : return,200
        '129' : return,100
        '130' : 
        '131' : 
        '132' : 
        '133' : 
        '134' : 
        '135' : 
        '136' : 
        '137' : 
        '138' : 
        '139' : 
        '140' : 
        '141' : 
        '142' : return,100
        '143' : 
        '144' : 
        '145' : return,400
        ;20
        '146' : 
        '147' : 
        '148' : 
        '149' : 
        '150' : 
        '151' : 
        '152' : 
        '153' : return,1200
        ;21
        '154' : 
        '155' : 
        '156' : 
        '157' : 
        '158' : 
        '159' : 
        '160' : 
        '161' : 
        '162' : 
        '163' : 
        '164' : 
        '165' : 
        '166' : 
        '167' : 
        '168' : 
        '169' : 
        '170' : 
        '171' : 
        '172' : 
        '173' : 
        '174' : 
        '175' : 
        '176' : 
        '177' : 
        '178' : 
        '179' : 
        '180' : 
        '181' : 
        '182' :
        ;22
        '183' : 
        '184' : 
        '185' : 
        '186' : 
        '187' : 
        '188' : 
        '189' : 
        '190' : 
        '191' : 
        '192' : 
        '193' : 
        '194' : 
        '195' : 
        '196' : 
        '197' : 
        '198' : 
        '199' : 
        '200' : 
        '201' : 
        '202' :
        ;23
        '203' : 
        '204' : 
        '205' : 
        '206' : 
        '207' : 
        '208' : 
        '209' : 
        '210' : 
        '211' : 
        '212' : 
        '213' : 
        '214' : 
        '215' : 
        '216' : 
        '217' : 
        '218' : 
        '219' : 
        '220' : 
        '221' : 
        '222' : 
        '223' : 
        '224' : 
        '225' : 
        '226' : 
        '227' : 
        '228' : 
        '229' : 
        '230' : 
        '231' : 
        '232' : 
        '233' : 
        '234' : 
        '235' : 
        '236' : 
        '237' : 
        '238' : 
        '239' : 
        '240' : 
        '241' : 
        '242' : 
        '243' : 
        '244' : 
        '245' : 
        '246' : return,400
        ;24
        '247' : 
        '248' : 
        '249' : 
        '250' : 
        '251' : 
        '252' : 
        '253' : 
        '254' : 
        '255' : 
        '256' : 
        '257' : 
        '258' : 
        '259' : 
        '260' : 
        '261' : 
        '262' : 
        '263' : return,300
        ;25
        '264' : return,800
        '265' : 
        '266' : 
        '267' : 
        '268' : 
        '269' : 
        '270' : 
        '271' : 
        '272' : 
        '273' : return,100
        '274' : 
        '275' : 
        '276' : 
        '277' : return,300
        ;26
        '278' : 
        '279' : return,200
        '280' : 
        '281' : return,1300
        '282' : 
        '283' : 
        '284' : 
        '285' : 
        '286' :  
        '287' : 
        '288' : return,200
        '289' : return,400
        '290' : 
        '291' : return,200
        ;27
        '292' : 
        '293' : 
        '294' : 
        '295' : 
        '296' : 
        '297' : 
        '298' : 
        '299' : 
        '300' : 
        '301' : 
        '302' : 
        '303' : 
        '304' : 
        '305' : 
        '306' : 
        '307' : 
        '308' : 
        '309' : 
        '310' : 
        '311' : 
        '312' : 
        '313' : 
        '314' : 
        '315' : 
        '316' : 
        '317' : 
        '318' : 
        '319' : 
        '320' : 
        '321' : 
        '322' : 
        '323' : 
        '324' : 
        '325' : return,200
        '326' : return,1200
        '327' : return,400
        '328' : 
        '329' : return,1200
        '330' : 
        '331' : 
        '332' : 
        '333' : 
        '334' : 
        '335' : 
        '336' : 
        '337' : return,400
        ;28
        '338' : 
        '339' : 
        '340' : 
        '341' : 
        '342' : 
        '343' : 
        '344' : 
        '345' : 
        '346' : 
        '347' : 
        '348' : 
        '349' : 
        '350' : 
        '351' : 
        '352' : 
        '353' : 
        '354' : 
        '355' : 
        '356' : 
        ;29
        '357' :
        '358' : 
        '359' : 
        '360' : 
        '361' : 
        '362' : 
        '363' : 
        '364' : 
        '365' : 
        '366' : 
        '367' : 
        '368' : 
        '369' : 
        '370' : 
        '371' : 
        '372' : 
        ;30
        '373' : 
        '374' : 
        '375' : 
        '376' : 
        '377' : 
        '378' : 
        '379' : 
        '380' : 
        '381' : 
        '382' : 
        ;31
        '383' : return,200
        '384' : return,400
        '385' : return,100
        '386' : 
        '387' : 
        '388' : 
        '389' : 
        '390' : 
        '391' : 
        '392' : 
        '393' : 
        '394' : return,200
        '395' : 
        '396' : return,100
        '397' : return,200
        '398' : return,150
        '399' : 
        '400' : 
        '401' : 
        '402' : 
        '403' : 
        '404' : 
        '405' : 
        ;32
        '406' : 
        '407' : 
        '408' : 
        '409' : 
        '410' : 
        '411' : 
        '412' : 
        '413' : 
        '414' : 
        '415' : 
        '416' : 
        '417' : 
        '418' : return,200
        ;33
        '419' :
        '420' :
        '421' :
        '422' :
        '423' :
        ;34
        '424' :
        '425' :
        '426' :
        '427' :
        '428' :
        '429' :
        ;35
        '430' :
        '431' : 
        '432' :
        '433' :
        '434' :
        '435' :
        '436' :
        '437' :
        '438' :
        '439' :
        '440' :
        '441' :
        '442' :
        '443' :
        '444' :
        '445' :
        ;36
        '446' :
        '447' :
        '448' :
        ;37
        '449' :
        '450' :
        '451' :
        '452' :
        '453' :
        '454' :
        '455' :
        '456' :
        '457' :
        '458' :
        '459' :
        '460' :
        '461' : return, 0
        else : message, 'No such event' + sEvtNum
      endswitch 
  endif $
  else begin
      message, 'No such line ID: ' + sLineID
  endelse

end