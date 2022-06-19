AD-FCM
======
This project contains MATLAB code for Ambiguity-Driven Fuzzy C-Means clustering.

Fuzzy C-Means (FCM) allows each input sample to belong to more than one cluster, providing more flexibility than non-fuzzy clustering methods. However, the accuracy of FCM is subject to false detections caused by noisy records, weak feature selection and low certainty of the algorithm in some cases. The false detections are very important in some decision-making application domains like network security and medical diagnosis, where weak decisions based on such false detections may lead to catastrophic outcomes.

We propose a method for detecting such ambiguous records in FCM by introducing a certainty factor to decrease invalid detections. This approach enables us to send the detected ambiguous records to another discrimination method for a deeper investigation, thus increasing the accuracy by lowering the error rate. Most of the records are still processed quickly and with low error rate which prevents performance loss compared to similar hybrid methods. Experimental results of applying the proposed method on several datasets from different domains show a significant decrease in error rate as well as improved sensitivity of the algorithm.


Please cite to:

Ghaffari, Meysam, and Nasser Ghadiri. "Ambiguity-driven fuzzy C-means clustering: how to detect uncertain clustered records." Applied Intelligence 45.2 (2016): 293-304.
[Link](https://link.springer.com/article/10.1007/s10489-016-0759-1) | 
[PDF](https://arxiv.org/pdf/1409.2821)
