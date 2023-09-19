pro irisARLwEchPkIntyRatioAll

  ; Include the header file
  @irisARLw.in
  
  nStCaseNum = 15
  nEdCaseNum = 32 
  
  ; Include all the paths                   
  @test/include/irisARLwTestDirs2.in
  
  file_mkdir, sEchPkIntyRatVarImgDir
  sEchPkIntyRatVarImgFile = sEchPkIntyRatVarImgDir + 'peak_intensity_ratio_All.eps'
  
  irisARLwEchPkIntyRatio, nStCaseNum, nEdCaseNum, 'EchWthAll_EachAllWidth', sEchPkIntyRatVarImgFile, $
                          sEchAllFitTauSavDir

  mo_done
  
end