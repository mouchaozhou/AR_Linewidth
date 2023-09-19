;+
; :Description:
;    Get the start and end num of one case.
;
; :Author: mcz
;-

function irisARLwCase2Events, sCaseNum
	
	case sCaseNum of 
  		'1' : return, [1, 10]
  		'2' : return, [11, 18]
  		'3' : return, [19, 23]
  		'4' : return, [24, 28]
  		'5' : return, [29, 33]
  		'6' : return, [34, 38]
  		'7' : return, [39, 43]
  		'8' : return, [44, 48]
  		'9' : return, [49, 53]
  		'10' : return, [54, 59]
  		'11' : return, [60, 66]
  		'12' : return, [67, 71]
  		'13' : return, [72, 76]
  		'14' : return, [77, 85]
  		'15' : return, [86, 93]
  		'16' : return, [94, 106]
  		'17' : return, [107, 110]
  		'18' : return, [111, 117]
  		'19' : return, [118, 145]
  		'20' : return, [146, 153]
  		'21' : return, [154, 182]
  		'22' : return, [183, 202]
  		'23' : return, [203, 246]
  		'24' : return, [247, 263]
  		'25' : return, [264, 277]
  		'26' : return, [278, 291]
  		'27' : return, [292, 337]
  		'28' : return, [338, 356]
  		'29' : return, [357, 372]
  		'30' : return, [373, 382]
  		'31' : return, [383, 405]
  		'32' : return, [406, 418]
  		'33' : return, [419, 423]
  		'34' : return, [424, 429]
  		'35' : return, [430, 445]
  		'36' : return, [446, 448]
  		'37' : return, [449, 461]
  		else : message, 'No such case number!'
	endcase

end