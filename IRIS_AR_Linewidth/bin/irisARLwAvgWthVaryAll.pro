pro irisARLwAvgWthVaryAll

  ; Include the header file
  @irisARLw.in
  
  if (sLineID eq 'SIIV1394') then begin
      nStCaseNum = 1
  endif $
  else begin
      nStCaseNum = 15
  endelse
  nEdCaseNum = 32 
  
  ; Include all the paths                   
  @include/irisARLwDirs2.in
  
  file_mkdir, sAvgWthVarImgDir
  sAvgWthVarImgFile = sAvgWthVarImgDir + 'width_All.eps' 

  uImgPars = { $
     sTitle : 'Width of average spectrum in All' $
  }
  
  nTheoryWidth0 = 22D
  
  irisARLwAvgWthVary, nStCaseNum, nEdCaseNum, 'AvgWthAll_AverageAllWidth', sAvgAllFitTauSavDir, $
                      sAvgWthVarImgFile, sLineID, uImgPars, nTheoryWidth0
                        
  mo_done
  
end