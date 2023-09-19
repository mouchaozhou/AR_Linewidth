pro irisARLwAvgWthVaryBG

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
  sAvgWthVarImgFile = sAvgWthVarImgDir + 'width_BG.eps' 

  uImgPars = { $
     sTitle : 'Width of average spectrum in BG' $
  }
  
  nTheoryWidth0 = 20D
  
  irisARLwAvgWthVary, nStCaseNum, nEdCaseNum, 'AvgWthBG_AverageBgWidth', sAvgBGFitTauSavDir, $
                      sAvgWthVarImgFile, sLineID, uImgPars, nTheoryWidth0
                        
  mo_done
  
end