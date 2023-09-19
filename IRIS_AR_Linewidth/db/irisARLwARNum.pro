function irisARLwARNum, sCaseNum

  case sCaseNum of
      ; AR
      '1' : return, 'AR12268'
      '2' : return, 'AR12230'
      '3' : return, 'AR12289'
      '4' : return, 'AR12297'
      '5' : return, 'AR12318'
      '6' : return, 'AR12325'
      '7' : return, 'AR12356'
      '8' : return, 'AR12386'
      '9' : return, 'AR12396'
      '10' : return, 'AR12405'
      '11' : return, 'AR12454'
      '12' : return, 'AR12459'
      '13' : return, 'AR12465'
      '14' : return, 'AR12209'
      ; AR: High resolution data
      '15' : return, 'AR12104'
      '16' : return, 'AR11944'
      '17' : return, 'AR12139'
      '18' : return, 'AR12282'
      '19' : return, 'AR12289'
      '20' : return, 'AR12420'
      '21' : return, 'AR12449'
      '22' : return, 'AR12454'
      '23' : return, 'AR12458'
      '24' : return, 'Unnamed AR'
      '25' : return, 'AR12470'
      '26' : return, 'AR12473'
      '27' : return, 'AR12480'
      '28' : return, 'AR12485'
      '29' : return, 'AR12487'
      '30' : return, 'AR12489'
      '31' : return, 'AR12494'
      '32' : return, 'AR12506'
      ; QS
      '33' : return, 'QS     '
      '34' : return, 'QS     '
      '35' : return, 'QS     '
      '36' : return, 'QS     '
      '37' : return, 'QS     '
      else : message, 'No such case number!'
  endcase

end