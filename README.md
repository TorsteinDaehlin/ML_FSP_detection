# A KNN classifer for automatic classification of foot strike patterns
This repositor contains a trained k nearest neighbors (KNN) classifier that can be used to classify foot strike patterns based on the angle of the foot at initial foot-ground contact (foot strike angle). Additionally, the repository contains an example script demonstrating how the classifier may be used to predict foot strike patterns from known foot strike angles.

If you have questions about the enclosed code, please email [Dr. Torstein E. Dæhlin](mailto:daehlin@usf.edu).

## Publication
Stay tuned for details.

## Using the classifier
### Requirements
The classifier was created using MATLAB(R) R2022b and their Statistics and Machine Learning Toolbox(TM). The enclosed code may not work with previous versions of MATLAB(R) or without the Statistics and Machine Learning Toolbox(TM). 

### Usage
1. Fork and clone this repository to your machine.
2. Open MATLAB(R) and navigate to your cloned repository.
3. Execute `ClassificationExample.m`. This script generates a set of 100 normally distributed example foot strike angles with a realistic mean and standard deviation, and uses the KNN model to classify the individual observations as either "Rearfoot", "Midfoot", or "Forefoot" strikes. A plot is generated to illustrate the resulting classifications. **Please note** that **input data** generated in and used for this example are fictitous and do not correspond to real data collected for this study. It is for illustration purposes only. However, the KNN classification model provided in `knn_fsp_classifier.mat` is trained on real-world data and validated against criterion data obtained by visual classification of foot strike patterns. 

## License
The KNN classifier and example code is provided under an Apache-2.0 license. Please view the [`LICENSE`](https://github.com/TorsteinDaehlin/KNNfootstrikepattern/blob/main/LICENSE) file in this repository for details.

## Disclaimer
This work is provided on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied, including, without limitation, any warranties or conditions of TITLE, NON-INFRINGEMENT MERCHANTABILITY, or FITNESS FOR A PARTICULAR PURPOSE. You are solely responsible for determining the appropriateness of using or redistributing this work and assume any risks associated with your exercise of permissions under this License.
