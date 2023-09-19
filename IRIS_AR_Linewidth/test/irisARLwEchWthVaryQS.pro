pro irisARLwEchWthVaryQS

  ; Include the header file
  @irisARLw.in

  nStCaseNum = 33
  nEdCaseNum = 37 
  
  ; Include all the paths                   
  @test/include/irisARLwTestDirs2.in
  
  file_mkdir, sEchWthVarImgDir
  sEchWthVarImgFile = sEchWthVarImgDir + 'width_QS.eps' 

  uImgPars = { $
     sTitle : 'Width of average of individual spectrums in QS' $
  }
  
  nTheoryWidth0 = 20D
  
  irisARLwEchWthVary, nStCaseNum, nEdCaseNum, 'EchWthSP_EachSpWidth', sEchQSFitTauSavDir, $
                      sEchWthVarImgFile, sLineID, uImgPars, nTheoryWidth0
                        
  mo_done
  
end