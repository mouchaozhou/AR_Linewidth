pro irisARLwEchWth, sEchWthSavDir, sEchWthImgDir, uEchFitRes, nXCen, nYCen, oIrisObj, nWaveWin

  ; Some default image parameters
  @include/irisARLwDfImgPars.in

  ; #region variables

  ; Create the output dirs
  file_mkdir, sEchWthSavDir, sEchWthImgDir
  
  ; Resolve object methods
  resolve_object, oIrisObj
  
  ; Calculate μ
  nMu = mo_mu(nXCen, nYCen)
  
  mEchWth = uEchFitRes.tFitPars[*, *, 1]
  mEchWthErr = uEchFitRes.tParCErrs[*, *, 1]
  
  mEchInty = uEchFitRes.tFitPars[*, *, 2]
  mEchIntyErr = uEchFitRes.tParCErrs[*, *, 2]
  
  aEchWthThresh = [6D, 30D]
  ; Make some width and width error and area which deviate too far zero
  mEchWth[where((mEchWth lt aEchWthThresh[0]) or (mEchWth gt aEchWthThresh[1]) or (mEchWthErr ge 21D) $
      or (mEchInty gt 3*stddev(mEchInty)))] = 0
  
  ; Non-zero width indexs
  aNonZeroId = where(mEchWth gt 0)
  
  ; Non-zero wdith and error
  aEchWth = mEchWth[aNonZeroId]
  aEchWthErr = mEchWthErr[aNonZeroId]
  
  ; ============================================================================================================
  
  ; Calculate the total Intensity （平均值）
  aEchInty = mEchInty[aNonZeroId]
  nEchInty = mean(aEchInty)
  aEchIntyErr = mEchIntyErr[aNonZeroId]      

  ; Calculate the nonthermal width （平均值）
  aEchNothmWth = mo_irisNonthermalWidth(oIrisObj, nWaveWin, mo_width2EWidth(aEchWth))
  nEchNothmWth = mean(aEchNothmWth) ; ❤
  nEchNothmWthErr = 3 * mean(aEchWthErr)  ; ❤
  
  ; Calculate the Peak Intensity （平均值）
  aEchPkInty = aEchInty / (sqrt(2*!DPI) *  aEchWth)
  nEchPkInty = mean(aEchPkInty) ; ❤ 
  aEchPkIntyErr = aEchPkInty * (aEchWthErr / aEchNothmWth + aEchIntyErr / aEchInty)
  nEchPkIntyErr = 3 * mean(aEchPkIntyErr) ; ☆
  nEchPkIntyErrDivInty = mean(aEchPkIntyErr / aEchPkInty) ; ❤
  
  ; #summary
  ;   Save all the variables
  ;   nMu: the μ value
  ;   nEchNothmWth: the nonthermal width
  ;   nEchNothmWthErr: the nonthermal width error 
  ;   nEchPkInty: the peak intensity
  ;   nEchPkIntyErr: the peak intensity error
  ;   nEchInty: the total intensity
  ;   nEchIntyErr: the total intensity error
  ;   nEchPkIntyErrDivInty: the peak intensity error over intensity, used for peak intensity ratio error
  ; #endsum
  save, nMu, nEchNothmWth, nEchNothmWthErr, nEchPkInty, nEchPkIntyErr, nEchInty, nEchIntyErr, nEchPkIntyErrDivInty, $
      filename=sEchWthSavDir + 'results.sav'
  ; #endregion  

  ; #region images
  ; ============================================================================================================
  ; Plot the nonthermal width histogram 

  uImgPars = { $
    nBinsize : 1, $
    sXTitle : 'Nonthermal width (km/s)', $
    sYTitle : 'Numbers (count)', $
    nDfPSY : nDfPSY, $
    aDfImgPosition : aDfImgPosition, $
    sFormat : '(f6.2)' $
  }
  
  sEchWthImgFile = sEchWthImgDir + 'nonthermalWidth_frequency_hist.eps'
  
  irisARLwPlotEchRes, aEchNothmWth, sEchWthImgFile, uImgPars  
  ; ============================================================================================================
  ; Plot the Area histogram 
  
  uImgPars = { $
    nBinsize : 500, $
    sXTitle : 'Area', $
    sYTitle : 'Numbers (count)', $
    nDfPSY : nDfPSY, $
    aDfImgPosition : aDfImgPosition, $
    sFormat : '(d15.0)' $
  }
  
  sEchWthImgFile = sEchWthImgDir + 'area_frequency_hist.eps'
   
  irisARLwPlotEchRes, aEchInty, sEchWthImgFile, uImgPars
  ;============================================================================================================
  ; Plot the width image

  mo_openPS, sEchWthImgDir + 'linewidth_image.eps', ys=nDfPSY
  mo_plotImage, transpose(mEchWth), /bPix, aThreshold=aEchWthThresh, position=aDfImgWithBarPos, $
      /bColorBar, aBarPosition=aDfBarPosition
  mo_closePS

  ;=============================================================================================================
  ; Plot the nonthermal width error histogram 

  uImgPars = { $
    nBinsize : 0.01, $
    sXTitle : 'Nonthermal width error (km/s)', $
    sYTitle : 'Numbers (count)', $
    nDfPSY : nDfPSY, $
    aDfImgPosition : aDfImgPosition, $
    sFormat : '(f6.3)' $
  }
  
  sEchWthImgFile = sEchWthImgDir + 'nonthermalWidthErr_frequency_hist.eps'
  
  irisARLwPlotEchRes, aEchWthErr, sEchWthImgFile, uImgPars  
  ; ============================================================================================================
  ; Plot the Peak intensity error histogram 
  
  uImgPars = { $
    nBinsize : 0.01, $
    sXTitle : 'Peak intensity error', $
    sYTitle : 'Numbers (count)', $
    nDfPSY : nDfPSY, $
    aDfImgPosition : aDfImgPosition, $
    sFormat : '(d15.6)' $
  }
  
  sEchWthImgFile = sEchWthImgDir + 'peakIntensityErr_frequency_hist.eps'
   
  irisARLwPlotEchRes, aEchPkIntyErr, sEchWthImgFile, uImgPars
  ;============================================================================================================
  ; #endregion
  
end