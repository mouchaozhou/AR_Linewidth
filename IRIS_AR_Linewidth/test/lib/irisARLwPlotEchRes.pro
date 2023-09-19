pro irisARLwPlotEchRes, aData, sEchWthImgFile, uImgPars

  ; Get the mean value of data
  nMeanData = mean(aData)
  
  ; Get the median value of data
  nMedianData = median(aData)
    
  ; Calculate the histogram yourself, in order to get the value on the abscissa at the peak (maximum) of the histogram
  aDataHist = histogram(aData, binsize=uImgPars.nBinsize)
  ; Get the maximum value of the histogram
  nMaxHist = max(aDataHist)
  ; Get the index on the abscissa at the peak (maximum) of the histogram
  nMaxHistXId = (where(aDataHist eq nMaxHist))[0]   

  ; Create the x-axis of the histograms
  aHistX = lindgen(n_elements(aDataHist)) * uImgPars.nBinsize + min(aData)
  
  ; Get the value on the abscissa at the peak (maximum) of the histogram
  nMaxHistX = aHistX[nMaxHistXId]
  
  ; Get the FWHM of the histogram
  ; FWHM = 2 * sqrt(alog(2)/!PI) * area/peak
  nHistFWHM = 0.939 * uImgPars.nBinsize * total(aDataHist) / nMaxHist 

  ; Following parts just for plotting the FWHM, two points for plotting the FWHM of the histogram
  aDiff = abs(aDataHist[0 : nMaxHistXId] - 0.5*nMaxHist)
  aPt1FWHMId = where(aDiff eq min(aDiff))  
  aPt1FWHM = [aHistX[aPt1FWHMId], aDataHist[aPt1FWHMId]]

  aDiff = abs(aDataHist[nMaxHistXId : n_elements(aDataHist)-1] - 0.5*nMaxHist)
  aPt2FWHMId = where(aDiff eq min(aDiff)) + nMaxHistXId
  aPt2FWHM = [aHistX[aPt2FWHMId], aDataHist[aPt2FWHMId]]
  
  mo_openPS, sEchWthImgFile, ys=uImgPars.nDfPSY
  
  ; The y maximum for plotting 
  nYMax = nMaxHist * 1.03
  
  ; Plot the histogram of the FWHM
  mo_plotHist, aData, binsize=uImgPars.nBinsize, /xstyle, /ystyle, position=uImgPars.aDfImgPosition, $
    xtitle=uImgPars.sXTitle, ytitle=uImgPars.sXTitle, yrange=[0, nYMax], $
    xrange=[min(aHistX)-uImgPars.nBinsize, max(aHistX)+2*uImgPars.nBinsize]
          
  ; Load some colors
  aColors = [mo_loadColour('Red'), mo_loadColour('Blue'), mo_loadColour('Yellow'), mo_loadColour('Green')]

  ; Plot the mean value
  plots, replicate(nMeanData, 2), [0, nYMax],color=aColors[0]
  ; Plot the median value
  plots,replicate(nMedianData,2), [0, nYMax],color=aColors[1]
  ; Plot the peak value
  plots,replicate(nMaxHistX,2), [0, nYMax],color=aColors[2]
  ; Plot the FWHM of the histogram
  plots, [aPt1FWHM[0], aPt2FWHM[0]], replicate(0.5*nMaxHist,2), color=aColors[3]

  ; Plot the legend
  saItems = [ 'mean: ' + num2str(nMeanData, format=uImgPars.sFormat), 'median: ' + num2str(nMedianData, format=uImgPars.sFormat), $
              'peak: ' + num2str(nMaxHistX, format=uImgPars.sFormat), 'FWHM: '   + num2str(nHistFWHM, format=uImgPars.sFormat)     ]
  aLineStyle = intarr(n_elements(saItems))
  legends, saItems, linestyle=aLineStyle, colors=aColors, charsize=0.9, /normal, charthick=3, thick=3, $
    pos=[uImgPars.aDfImgPosition[2]-0.23, uImgPars.aDfImgPosition[3]-0.03] ; The up left coordinate

  ; Reset the color table
  loadct, 0

  mo_closePS

end