pro irisARLwEchWthVaryAR

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
  @test/include/irisARLwTestDirs2.in
  
  file_mkdir, sEchWthVarImgDir
  sEchWthVarImgFile = sEchWthVarImgDir + 'width_AR.eps' 

  uImgPars = { $
     sTitle : 'Width of average of individual spectrums in AR' $
  }
  
  nTheoryWidth0 = 20D
  
  irisARLwEchWthVary, nStCaseNum, nEdCaseNum, 'EchWthSP_EachSpWidth', sEchARFitTauSavDir, $
                      sEchWthVarImgFile, sLineID, uImgPars, nTheoryWidth0
                        
  mo_done
  
end