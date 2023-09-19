pro irisARLwPaperImgAR

  ; Include the header file
  @irisARLw.in
  
  nStCaseNum = 1
  nEdCaseNum = 32 

  ; Include all the paths                   
  @include/irisARLwDirs2.in
  @include/irisARLwDirs3.in
  @test/include/irisARLwTestDirs2.in
  
  ; Output file
  file_mkdir, sAvgPaperImgDir
  sAvgPaperImgFile = sAvgPaperImgDir + 'paper_image_AR.eps'
  
  nTheoryWidth0 = 22D
  sTitle = 'Active Region'
  
  irisARLwPaperImg, nStCaseNum, nEdCaseNum, sLineID, sAvgPaperImgFile, 'AvgWthSP_AverageSpWidth', $
                    'EchWthSP_EachSpWidth', sAvgARFitTauSavDir, nTheoryWidth0, sTitle, /bAR
  
  mo_done

end