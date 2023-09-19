pro irisARLwAvgPkIntyRatioAll

  ; Include the header file
  @irisARLw.in
  
  nStCaseNum = 15
  nEdCaseNum = 32 
  
  ; Include all the paths                   
  @include/irisARLwDirs2.in
  
  file_mkdir, sAvgPkIntyRatVarImgDir
  sAvgPkIntyRatVarImgFile = sAvgPkIntyRatVarImgDir + 'peak_intensity_ratio_All.eps'
  
  irisARLwAvgPkIntyRatio, nStCaseNum, nEdCaseNum, 'AvgWthAll_AverageAllWidth', sAvgPkIntyRatVarImgFile, $
                          sAvgAllFitTauSavDir

  mo_done
  
end