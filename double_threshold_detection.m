% pseudo code:
% the data update section is omitted.

1:initial

2:initial:
2.1:Set threshold
inRangePhasepeak = @(x)((x>-0.7)&(x<-0.03));  % Phase range of peak stimulation
inRangeamppeak = @(x)(x>2);   % Amplitude threshold for peak stimulation
inRangePhasetrough = @(x)(x>2.5)|(x<-3);   % Phase range of trough stimulation
inRangeamptrough = @(x)(x<-2);   % Amplitude threshold for trough stimulation
2.2:Set Filter
N    = 826;Fc1  = 4;Fc2  = 12;Fs=500;
flag = 'scale';win = hamming(N+1); 
b1  = fir1(N, [Fc1 Fc2]/(Fs/2), 'bandpass', win, flag); 
filter4_12 = dfilt.dffir(b1); 

3: data processing 
theta0=filter(filter4_12, [LFP;zeros(413,1)]); 
theta= theta0 (414:end);  % zero phase filtering
z1 = hilbert(theta);
r=real(z1);
i=imag(z1);
Phase=atan2(i,r);

4: stimulus detection
if i50>flag  % Delay flag
if find(inRangePhasepeak(Phase(495:497)),1) % phase judgment for peak stimulus
    if find(inRangeamppeak(ex(495:497)),1) % Threshold judgment for amplitude
    fprintf(DG2000, ':SOUR1:BURS:TRIG' ); % Trigger 
    flag=i50+4; % Delay 100ms for next detection
    end
end
end

5:end
