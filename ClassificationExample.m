% ClassificationExample.m ------------------------------------------------ %
%                                                                          %
% Copyright 2024 Torstein E. Dæhlin, PhD                                   %
%                                                                          %
% Licensed under the Apache License, Version 2.0 (the "License");          %
% you may not use this file except in compliance with the License.         %
% You may obtain a copy of the License at                                  %
%                                                                          %
%     http://www.apache.org/licenses/LICENSE-2.0                           %
%                                                                          %
% Unless required by applicable law or agreed to in writing, software      %
% distributed under the License is distributed on an "AS IS" BASIS,        %
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. %
% See the License for the specific language governing permissions and      %
% limitations under the License.                                           %
% ------------------------------------------------------------------------ %
%                                                                          %
% ClassificationExample.m creates a sample of normally distributed "dummy" %
% foot strike angles and uses these values to illustrate how the KNN       %
% classifier in knn_fsp_classifier.mat can be used to classify foot strike %
% patterns. The funcition takes no input and produces a grouped scatter    %
% plot to illustrate the results of the classification example as output.  %
% ------------------------------------------------------------------------ %

function ClassificationExample()

% Set seed for reproducibility
rng('default');

% Create normally distributed example data
x_bar = 11.8; % Mean foot strike angle
x_sd = 8.1; % Standard deviation
fsa = normrnd(x_bar, x_sd, [100 1]);

% Load classifier
load('knn_fsp_classifier.mat','mdl');

% Predict foot strike patterns
fsp = mdl.predict(fsa);

% Plot results
figure();
mrk_color = [0.239 0.149 0.659; 0.153 0.588 0.922; 0.502 0.796 0.345];
mrk_shape = 'os^';
h = gscatter(fsa,fsa,fsp,'k',mrk_shape);
for i = 1: length(h)
    h(i).MarkerFaceColor = mrk_color(i,:);
end

% Annotate plot
title('Foot strike classification', 'Interpreter', 'latex');
xlabel('Foot strike angle $(^{\circ})$', 'Interpreter', 'latex');
ylabel('Foot strike angle $(^{\circ})$', 'Interpreter', 'latex');

end