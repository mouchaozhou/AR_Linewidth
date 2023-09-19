function irisARLwSortTimeIndex, saTimeArr

  nYear0 = julday(1, 1, 2014, 0, 0, 0)

  saTimeArr = str_replace(saTimeArr, '-', ' ')
  saTimeArr = str_replace(saTimeArr, ':', ' ')

  szTimeArr = n_elements(saTimeArr)

  ; Save the splitted elements of time
  aSecArr = dblarr(szTimeArr)

  for i = 0, szTimeArr - 1 do begin
      aTimeEleArr = strsplit(saTimeArr[i], /extract)
	  
	  aSecArr[i] = julday(aTimeEleArr[1], aTimeEleArr[2], aTimeEleArr[0], $
						  aTimeEleArr[3], aTimeEleArr[4], aTimeEleArr[5]) - nYear0
  endfor

  return, sort(aSecArr)

end
