% pseudo code:
% the data update section is omitted.

1:initial

2:initial: Set threshold
inRangePhasepeak = @(x)((x>-0.7)&(x<-0.03));  % Phase range of peak stimulation
inRangeamppeak = @(x)(x>2);   % Amplitude threshold for peak stimulation
inRangePhasetrough = @(x)(x>2.5)|(x<-3);   % Phase range of trough stimulation
inRangeamptrough = @(x)(x<-2);   % Amplitude threshold for trough stimulation

3: data processing 
theta0=filter(filter4_12, [flip(LFP);zeros(220,1)+LFP(end)]); 
theta= theta0 (221:end);  % zero phase filtering
z1 = hilbert(theta0);
r=real(z1);
i=imag(z1);
Phase=atan2(i,r);

4: stimulus detection
if i50>flag  % Delay flag
if inRangePhasepeak(Phase(496)) % phase judgment for peak stimulus
    if inRangeamppeak(ex(496)) % Threshold judgment for amplitude
    fprintf(DG2000, ':SOUR1:BURS:TRIG' ); % Trigger 
flag=i50+4; % Delay 100ms for next detection
end
end
end

5:end
