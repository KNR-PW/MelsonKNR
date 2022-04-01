%% Inicjalizacja Kinecta

vid = videoinput('kinect',2);
src = getselectedsource(vid);
src.SkeletonsToTrack =1;

vid.TriggerRepeat = 20000;
vid.FramesPerTrigger = 1;
triggerconfig(vid, 'manual');

src.TrackingMode = 'Skeleton'
