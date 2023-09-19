pro irisARLwAvgWthVaryQS

  ; Include the header file
  @irisARLw.in

  nStCaseNum = 33
  nEdCaseNum = 37 
  
  ; Include all the paths                   
  @include/irisARLwDirs2.in
  
  file_mkdir, sAvgWthVarImgDir
  sAvgWthVarImgFile = sAvgWthVarImgDir + 'width_QS.eps' 

  uImgPars = { $
     sTitle : 'Width of average spectrum in QS' $
  }
  
  nTheoryWidth0 = 22D
  
  irisARLwAvgWthVary, nStCaseNum, nEdCaseNum, 'AvgWthSP_AverageSpWidth', sAvgQSFitTauSavDir, $
                      sAvgWthVarImgFile, sLineID, uImgPars, nTheoryWidth0
                        
  mo_done
  
end