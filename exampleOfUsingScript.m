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
    % description of the fields in this structure:
    %   eyelidpos   - FEC in each video frame
    %   tm          - time in s of each video frame relative to CS onset
    %   fnames      - filename that these data came from
    %   c_isi       - inter-stimulus interval (in ms) between the time that
    %                   the CS and US are triggered
    %   c_csnum     - neuroblinks code number corresponding to the CS that
    %                   you used
    %   c_csdur     - trigger duration of the CS in ms
    %   c_usnum     - neuroblinks code number corresponding to the US that
    %                   you used
    %   c_usdur     - trigger duration of the US in ms
    %   trialnum    - trial number in the neuroblinks session
    %   session_of_day - session number you entered into neuroblinks
    %
    % we usually save this output as its own mat file for analysis later

% Figure showing the eyelid traces from the example session
figure
plot(trials.tm', trials.eyelidpos')
hold on
plot(trials.tm(1,:), mean(trials.eyelidpos), 'Color', 'k', 'linewidth', 2)
xlabel('Time from Tone (s)')
ylabel('Fraction Eyelid Closure (FEC)')