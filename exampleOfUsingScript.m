% navigate to the directory that you saved this git repo to
gitDirectory = 'C:\Users\kimol\Documents\GitHub\blinkVideoDataExample'; % change the string here as appropriate
cd(gitDirectory)

videoDirectory = strcat(gitDirectory, '\example eyeblink data\OK135\170304\compressed'); % name of the directory with the videos that you want to process
calibLocation = strcat(videoDirectory, '\OK135_170304_s01_calib.mp4'); % directory with the videos that you want to process, and the name of the calibration video for this session
    % WARNING: This script expects your calibration file and the rest of
    % the video files you want to analyze to start with the same string.
    % So, for this example, the script expects each trial's video file to
    % be named 'OK135_170304_s01_###.mp4' and the metadata file to be named
    % 'OK135_170304_s01_###_meta.mat' where ### is replaced by the trial
    % number.
    
trials = processTrials(videoDirectory, calibLocation);
    % we usually save this output as its own mat file

% Figure showing the eyelid traces from the example session
figure
plot(trials.tm', trials.eyelidpos')
hold on
plot(trials.tm(1,:), mean(trials.eyelidpos), 'Color', 'k', 'linewidth', 2)
xlabel('Time from Tone (s)')
ylabel('Fraction Eyelid Closure (FEC)')