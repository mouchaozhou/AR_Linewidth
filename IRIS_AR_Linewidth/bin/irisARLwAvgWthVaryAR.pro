pro irisARLwAvgWthVaryAR

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
  sAvgWthVarImgFile = sAvgWthVarImgDir + 'width_AR.eps' 

  uImgPars = { $
     sTitle : 'Width of average spectrum in AR' $
  }
  
  nTheoryWidth0 = 22D
  
  irisARLwAvgWthVary, nStCaseNum, nEdCaseNum, 'AvgWthSP_AverageSpWidth', sAvgARFitTauSavDir, $
                      sAvgWthVarImgFile, sLineID, uImgPars, nTheoryWidth0
                        
  mo_done
  
end