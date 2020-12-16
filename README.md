# README
Last updated by Olivia Kim on December 16, 2020

## Description of this repository
This repository contains scripts for extracting eyelid traces from eyelid data collected with Neuroblinks. These scripts follow the analysis strategy described in [Heiney et al., 2014 - URL](https://www.jneurosci.org/content/34/45/14845.short), and assume that you have recorded video data using the Prosilica GE680 (Allied Vision Technologies).

This repository also contains data from an example session so you can check whether the scripts are working on your computer before trying things out on brand new data. I just grabbed an early session from a random mouse -- this is NOT examplary performance, but the videos are decent and should give you a sense for how this script works.


## How do these scripts work?
Basically, the scripts will run some mild filtering to elimnate some salt-and-pepper noise and then convert the grayscale video data into a binary image. This should cause the eye to appear "black" in the binary images, and the fur to appear "white". Then, based on the user's definitions of the eyelid being fully open and closed (i.e., the beginning of the calibration trial and the peak eyelid closure after the airpuff during the calibration trial) during that session in Neuroblinks, the script uses the number of black pixels in the image to compute the fraction eyelid closure.

This strategy for measuring eyelid position relies on good lighting conditions in the experimental chamber. If there are shadows on the mouse's face that cross the eye, this script may return bad values. Therefore, it is very important to perform sanity checks when you start collecting data and when you make changes to the layout of the rigs. Please make sure to compare the fraction eyelid closure values that this script outputs with visual inspection of the corresponding video frames. If the data don't match, please look at the binary images that this script generates in order to ascertain whether shadows in your apparatus are generating noise that interferes with eyelid position measurements.

This script relies on the user-defined eyelid open and eyelid closed measurements collected during the training session, and it will return bad values if the calibration trial is triggered when the mouse is squinty/the airpuff on the calibration trial doesn't cause complete eyelid closure.

For more detail, please see [Heiney et al., 2014 - URL](https://www.jneurosci.org/content/34/45/14845.short) or [Heiney et al., 2018 - URL](https://link.springer.com/protocol/10.1007/978-1-4939-7549-5_3).
You can also email me at kim.olivia.a@gmail.com if you are still confused about this.


## Compatibility
Last known to work in Matlab 2018a on a Windows 8 PC. This should work on different operating systems. We haven't had problems running these scripts across versions of Matlab, either, but sometimes Mathworks changes the name of some basic functions and this could in principle cause compatibility issues.