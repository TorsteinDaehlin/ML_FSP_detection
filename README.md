# ML classifers for automatic classification of foot strike patterns
This repositor contains three trained machine learning (ML) classifiers that can be used to classify foot strike patterns based on the angle of the foot at initial foot-ground contact (foot strike angle), foot strike angle and foot angular excusion from inital foot contact until peak knee flexion (proxy for midstance), or foot strike angle, foot angular excursion, and average foot angular velocity over the excursion range. Additionally, the repository contains an example script demonstrating how the classifiers may be used to predict foot strike patterns from known foot strike angles, excursions, and velocities.

If you have questions about the enclosed code, please email [Dr. Torstein E. Dæhlin](mailto:daehlin@usf.edu).

## Publication
Stay tuned for details.

## Using the classifier
### Requirements
The classifiers were created using MATLAB&reg; R2022b and their Statistics and Machine Learning Toolbox&trade;. The enclosed code may not work with previous versions of MATLAB&reg; or without the Statistics and Machine Learning Toolbox&trade;. 

### Usage
1. Fork and clone this repository to your machine.
2. Open MATLAB&reg; and navigate to your cloned repository.
3. Execute `ClassificationExample.m`. This script generates a set of 1000 multimodallu distributed example foot strike angles based on experimental means and standard deviations, and uses the trained machine learning models to classify the individual observations as either "Rearfoot", "Midfoot", or "Forefoot" strikes. A plot is generated to illustrate the resulting classifications. **Please note** that **input data** generated in and used for this example are fictitous and do not correspond to real data collected for this study. It is for illustration purposes only. However, the classifiers provided in `fsp_classifiers.mat` are trained on real-world data and validated against criterion data obtained by visual classification of foot strike patterns. 

## License
The ML classifiers and example code is provided under an Apache-2.0 license. Please view the [`LICENSE`](https://github.com/TorsteinDaehlin/KNNfootstrikepattern/blob/main/LICENSE) file in this repository for details.

## Disclaimer
This work is provided on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied, including, without limitation, any warranties or conditions of TITLE, NON-INFRINGEMENT MERCHANTABILITY, or FITNESS FOR A PARTICULAR PURPOSE. You are solely responsible for determining the appropriateness of using or redistributing this work and assume any risks associated with your exercise of permissions under this License.
