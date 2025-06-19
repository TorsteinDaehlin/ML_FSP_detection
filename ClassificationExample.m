% ClassificationExample.m ------------------------------------------------ %
%                                                                          %
% Copyright 2025 Torstein E. Dæhlin, PhD                                   %
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
% ClassificationExample.m creates a sample of multimodally distributed     %
% example foot strike angles based on experimental means and standard      % 
% deviations and uses these values to illustrate how the machine learning  %
% classifiers in fsp_classifiers.mat can be used to classify foot strike   % 
% patterns. The funcition takes no input and produces a grouped scatter    %
% plot to illustrate the results of the classification example as output.  %
% -------------------------------------------------------------------------%

function ClassificationExample()

% The seed of the random number generator is set for reproducibility
rng(123);

% We create a multimodal distribution of example data using experimental
% means (x_bar), standard deviations (sd), and proportions (w).
n = 1000;
w1 = 0.083; % Fraction FFS
w2 = 0.043; % Fraction MFS
w3 = 0.874; % Fraction RFS

% Foot strike angles [FFS; MFS; RFS] 
fsa_x_bar = [-5.8; 2.2; 13.9];
fsa_x_sd = [3.6; 3.9; 5.9];
fsa = [normrnd(fsa_x_bar(1), fsa_x_sd(1), [round(w1*n) 1]); ...
    normrnd(fsa_x_bar(2), fsa_x_sd(2), [round(w2*n) 1]); ...
    normrnd(fsa_x_bar(3), fsa_x_sd(3), [round(w3*n) 1])];

% Excursion
excursion_x_bar = [-0.3; -6.7; -17.2];
excursion_sd = [3.5; 3.6; 5.0];
excursion = [normrnd(excursion_x_bar(1), excursion_sd(1), [round(w1*n) 1]); ...
    normrnd(excursion_x_bar(2), excursion_sd(2), [round(w2*n) 1]); ...
    normrnd(excursion_x_bar(3), excursion_sd(3), [round(w3*n) 1])];

% Velocity
velocity_x_bar = [-1.7; -57.9; -136.4];
velocity_sd = [31.2; 23.3; 37.5];
velocity = [normrnd(velocity_x_bar(1), velocity_sd(1), [round(w1*n) 1]); ...
    normrnd(velocity_x_bar(2), velocity_sd(2), [round(w2*n) 1]); ...
    normrnd(velocity_x_bar(3), velocity_sd(3), [round(w3*n) 1])];

% The trained classifiers are stored in the file named 'fsp_classifiers.mat'
load('fsp_classifiers.mat');

% Predict foot strike patterns
fsp_fsa = ML_tree_fsa.predict(fsa);
fsp_fsa_excursion = ML_knn_fsa_excursion.predict([fsa excursion]);
fsp_all = ML_knn_all.predict([fsa excursion velocity]);

% We store all variables in a table to facilitate vizualization
tbl = table(fsa, excursion, velocity, fsp_fsa, fsp_fsa_excursion, fsp_all);

% Plot results
figure('Units', 'normalized', 'Position', [0.1 0.3 0.7 0.4]);
tiledlayout(4,3);
nexttile();
scatter(tbl, 'fsa', 'fsa', 'filled', 'ColorVariable', 'fsp_fsa', ...
    'MarkerEdgeColor', 'k');
xlabel('Angle $(^{\circ})$', 'Interpreter', 'latex');
ylabel('Angle $(^{\circ})$', 'Interpreter', 'latex');

nexttile;
scatter(tbl,'fsa','excursion','filled','ColorVariable','fsp_fsa_excursion', ...
    'MarkerEdgeColor', 'k');
xlabel('Angle $(^{\circ})$', 'Interpreter', 'latex');
ylabel('Excursion $(^{\circ})$', 'Interpreter', 'latex');

nexttile;
scatter3(tbl,'fsa','excursion','velocity','filled','ColorVariable','fsp_all', ......
    'MarkerEdgeColor', 'k');
xlabel('Angle $(^{\circ})$', 'Interpreter', 'latex');
ylabel('Excursion $(^{\circ})$', 'Interpreter', 'latex');
zlabel('Angular velocity $(deg \cdot s^{-1})$', 'Interpreter', 'latex');
end