pro irisARLwAvgPkIntyRatioBG

  ; Include the header file
  @irisARLw.in
  
  nStCaseNum = 15
  nEdCaseNum = 32 
  
  ; Include all the paths                   
  @include/irisARLwDirs2.in
  
  file_mkdir, sAvgPkIntyRatVarImgDir
  sAvgPkIntyRatVarImgFile = sAvgPkIntyRatVarImgDir + 'peak_intensity_ratio_BG.eps'
  
  irisARLwAvgPkIntyRatio, nStCaseNum, nEdCaseNum, 'AvgWthBG_AverageBgWidth', sAvgPkIntyRatVarImgFile, $
                          sAvgBGFitTauSavDir

  mo_done
  
end