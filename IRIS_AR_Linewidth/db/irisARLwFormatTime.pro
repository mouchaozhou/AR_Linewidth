function irisARLwFormatTime, sTime

  nSkipChar = 0
  sYear = strmid(sTime, nSkipChar, 4)  
  nSkipChar += 4
  sMonth = strmid(sTime, nSkipChar, 2)
  nSkipChar += 2
  sDay = strmid(sTime, nSkipChar, 2)
  nSkipChar += 3
  
  ; Get the hour, minute, second   
  sHour = strmid(sTime, nSkipChar , 2)
  nSkipChar += 2
  sMinute = strmid(sTime, nSkipChar, 2)
  nSkipChar += 2
  sSecond = strmid(sTime, nSkipChar, 2)

  return, sYear + '-' + sMonth + '-' + sDay + ' ' + sHour + ':' + sMinute + ':' + sSecond 
  
  
end