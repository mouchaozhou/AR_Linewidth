function irisARLwLineID, nLineNum 

  case nLineNum of
      1 : return, 'SIIV1394'  
      2 : return, 'SIIV1403'
      else : message, 'No such line number: ' + num2str(nLineNum)
  endcase
  
end