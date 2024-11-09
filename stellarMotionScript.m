% This code loads the data and defines measurement parameters.

load starData
nObs = size(spectra,1)
lambdaStart = 630.02
lambdaDelta = 0.14

% lambdaEnd - Calculated end wavelength using following equation:
%             lambdaStart + (nObs−1)lambdaDelta
% lambda - vector containing wavelengths of spectrum from
%          lambdaStart-lambdaEnd in steps of lambdaDelta
lambdaEnd = lambdaStart + (nObs-1)*lambdaDelta
lambda = (lambdaStart:lambdaDelta:lambdaEnd)

% spectra - Retrieved from loaded 'starData'. Each column is the spectrum
%           of a different star. Default is set to 6th column, which is
%           star HD94028 (aka Constellation Leo). 
% Abstraction is added here by allowing user to calculate speed of any star
% within spectra by modifying the column number to extract to 's'.
s = spectra(:,2)

% Plotting spectrum (s) as a function of wavelength (lambda) using point
% markers and solid line for maximum clarity. 
plot(lambda,s,".-")
xlabel("Wavelength")
ylabel("Intensity")

% sHa - Minimum light intensity value
% idx - Index of min light intensity value
% lambdaHa - Wavelength corresponding to minimum light intensity
% The point (lambdaHa,sHa) is the location of the hydrogen-alpha line where
% light intensity dips because this is Hydrogen aborption point
[sHa,idx] = min(s)
lambdaHa = lambda(idx)

% Adding hydrogen-alpha point to existing graph as a red square with
% increased marker size for visibility
hold on
plot(lambdaHa,sHa,"rs",MarkerSize=8)
hold off

% redshiftFactor - Speed of star Relative to earth, found using the
%                  following formula:
%                  RedshiftFactor =
%                  (minIntensityWavelength / HydrogenAbsorptionPoint) - 1
% speed - Speed of Star itself, found by multiplying Redshift Factor by
%         speed of light (299792.458 km/s)
redshiftFactor = lambdaHa/656.28 - 1
speed = redshiftFactor*299792.458
