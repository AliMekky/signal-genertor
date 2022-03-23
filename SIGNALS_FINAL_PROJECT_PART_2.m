DC=1;
ramp=2;
polynomial=3;
exponential=4;
sinusoidal=5;
%to check the user input (used in switch case)



new_line = sprintf('\n');
disp('Welcome to general signal generator');

%taking sample frequency as input from the user
%error handling for sample frequency:
%1- sampling frequency should be greater than 1 (no. of samples in one sec)
%2- should be a number
fs = str2double(input('Enter sampling frequency: ','s'));
while(fs < 1 || isnan(fs))
    fs = str2double(input('Enter a valid value for sampling frequency: ','s'));
end
disp(new_line);



%taking start time of the function from the user
t_start = str2double(input('Enter start time of signal: ','s'));
while(isnan(t_start))
    t_start = str2double(input('Enter a valid start time(number): ','s'));
end
disp(new_line);



%taking end time of the function from the user:
%end time of the function should be greater than the start time.
t_end = str2double(input('Enter end time of signal: ','s'));
while(t_end <= t_start )
    t_end = str2double(input('Enter end time greater than start time of signal: ','s'));
end
while(isnan(t_end))
    t_end = str2double(input('Enter a valid end time(number): ','s'));
end
disp(new_line);



%taking number of break points from the user.
%number of break points should be greater than or equal zero.
num_breakpoints = str2double(input('Enter number of breakpoint: ','s'));
while( (num_breakpoints< 0) || isnan(num_breakpoints))
    num_breakpoints = str2double(input('Enter a valid value for number of breakpoints: ','s'));
end
disp(new_line);


breakpoints = [t_start]; %vector to store start-time breakpoints and end-time
breakpoints_type=[]; %vector to store the type of the function after each breakpoint
lastposition = t_start; %variable to store value of last breakpoint
function_specs = []; %vector to store the characteristics of each function



%for loop to take from the user positions of each break point and type of
%function after each breakpoint.
for i=1:num_breakpoints
    position = input(['Enter position ' num2str(i) ' (should be in order): '],'s');
    position = str2double(position);
    %position of each breakpoint should lie between start-time and
    %end-time,, and should be greater than the previous breakpoint.
    while((position >= t_end) || (position <= t_start) || (isnan(position) || (position<lastposition)))
        position = str2double(input(['Enter a valid position ' num2str(i) ':'],'s'));
    end
    disp(new_line);
    lastposition = position; %updating the value of last entered breakpoint
    breakpoints = [breakpoints position]; %concatenating the breakpoint to the breakpoints vector
    disp(['choose signal after this breakpoint' new_line '1-DC signal' new_line '2-ramp signal' new_line '3-polynomial signal' new_line '4-exponential signals' new_line '5-sinusoidal signal' new_line]);
    type = str2double(input('your choice: ','s'));
    while(type < 1 || type > 5 || isnan(type)) %type value should be from choices (1 to 5)
        type = str2double(input('your choice: ','s'));
    end
    disp(new_line);
    breakpoints_type = [breakpoints_type type]; %concatenating the type of the function to the vector of functions' types
    
    
    %switch case to check the user input and take the characteristics of
    %the chosen function
    switch type
        case DC
            amplitude = str2double(input('Enter DC amplitude: ','s'));
            while(isnan(amplitude))
                amplitude = str2double(input('Enter a valid DC amplitude: ','s'));
            end
            function_specs = [function_specs amplitude];
        case ramp
            slope = str2double(input('Enter ramp slope: ','s'));
            while(isnan(slope))
                slope = str2double(input('Enter a valid ramp slope: ','s'));
            end
            function_specs = [function_specs slope];
            intercept = str2double(input('Enter ramp intercept: ','s'));
            while(isnan(intercept))
                intercept = str2double(input('Enter a valid ramp intercept: ','s'));
            end
            function_specs = [function_specs intercept];
        case polynomial
            power =     str2double(input('Enter highest power: ','s'));
            while(isnan(power))
                power = str2double(input('Enter a valid power: ','s'));
            end
            function_specs = [function_specs power];
            for i = power:-1:0
                power =  str2double(input(['Enter coeff of ' num2str(i) ' power : '],'s'));
                while(isnan(power))
                    power = str2double(input('Enter a valid coeff: ','s'));
                end
                function_specs = [function_specs power];
            end
        case exponential
            amplitude = str2double(input('Enter exponential amplitude: ','s'));
            while(isnan(amplitude))
                amplitude = str2double(input('Enter a valid exponential amplitude: ','s'));
            end
            function_specs = [function_specs amplitude];
            exponent = str2double(input('Enter exponential exponent: ','s'));
            while(isnan(exponent))
                exponent = str2double(input('Enter a valid exponential exponent: ','s'));
            end
            function_specs = [function_specs exponent];
        case sinusoidal
            amplitude = str2double(input('Enter sinusoidal amplitude: ','s'));
            while(isnan(amplitude))
                amplitude = str2double(input('Enter a valid sinusoidal amplitude: ','s'));
            end
            function_specs = [function_specs amplitude];
            frequency = str2double(input('Enter sinusoidal frequency: ','s'));
            while(isnan(frequency))
                frequency = str2double(input('Enter a valid sinusoidal frequency: ','s'));
            end
            function_specs = [function_specs frequency];
            phase = str2double(input('Enter sinusoidal phase in degrees: ','s'));
            while(isnan(phase))
                phase = str2double(input('Enter a valid sinusoidal phase in degrees: ','s'));
            end
            function_specs = [function_specs phase];
            
    end
end









%Determining the signal before the first breakpoint
disp(['choose signal before first breakpoint(if there is)' new_line '1-DC signal' new_line '2-ramp signal' new_line '3-polynomial signal' new_line '4-exponential signals' new_line '5-sinusoidal signal']);
type = str2double(input('your choice: ','s'));
while(type < 1 || type > 5 || isnan(type))
    type = str2double(input('your choice: ','s'));
end
disp(new_line);
breakpoints_type = [type breakpoints_type];
switch type
    case DC
        amplitude = str2double(input('Enter DC amplitude: ','s'));
        while(isnan(amplitude))
            amplitude = str2double(input('Enter a valid DC amplitude: ','s'));
        end
        function_specs = [amplitude function_specs];
    case ramp
        slope = str2double(input('Enter ramp slope: ','s'));
        while(isnan(slope))
            slope = str2double(input('Enter a valid ramp slope: ','s'));
        end
        %function_specs = [slope function_specs];
        intercept = str2double(input('Enter ramp intercept: ','s'));
        while(isnan(intercept))
            intercept = str2double(input('Enter a valid ramp intercept: ','s'));
        end
        
        function_specs = [slope intercept function_specs];
    case polynomial
        power =     str2double(input('Enter highest power: ','s'));
        while(isnan(power))
            power = str2double(input('Enter a valid power: ','s'));
        end
        %function_specs = [function_specs power];
        for i = 0:1:power
            coeff =  str2double(input(['Enter coeff of ' num2str(i) ' power : '],'s'));
            while(isnan(coeff))
                coeff = str2double(input('Enter a valid ceff: ','s'));
            end
            function_specs = [coeff function_specs];
        end
        function_specs = [power function_specs];
    case exponential
        amplitude = str2double(input('Enter exponential amplitude: ','s'));
        while(isnan(amplitude))
            amplitude = str2double(input('Enter a valid exponential amplitude: ','s'));
        end
        %function_specs = [amplitude function_specs];
        exponent = str2double(input('Enter exponential exponent: ','s'));
        while(isnan(exponent))
            exponent = str2double(input('Enter a valid exponential exponent: ','s'));
        end
        function_specs = [amplitude exponent function_specs];
    case sinusoidal
        amplitude = str2double(input('Enter sinusoidal amplitude: ','s'));
        while(isnan(amplitude))
            amplitude = str2double(input('Enter a valid sinusoidal amplitude: ','s'));
        end
        %function_specs = [amplitude function_specs];
        frequency = str2double(input('Enter sinusoidal frequency: ','s'));
        while(isnan(frequency))
            frequency = str2double(input('Enter a valid sinusoidal frequency: ','s'));
        end
        %function_specs = [frequency function_specs];
        phase = str2double(input('Enter sinusoidal phase in degrees: ','s'));
        while(isnan(phase))
            phase = str2double(input('Enter a valid sinusoidal phase in degrees: ','s'));
        end
        function_specs = [amplitude frequency phase function_specs];
        
end

%function_specs
breakpoints = [breakpoints t_end];
f = [];
specs_count = 1;

for i = 1:1:num_breakpoints+1
    switch breakpoints_type(i)
        case DC
            f_temp = function_specs(specs_count)*ones(1,fs*(breakpoints(i+1)-breakpoints(i)));
            specs_count = specs_count + 1;
            f = [f f_temp];
        case ramp
            t = linspace(breakpoints(i),breakpoints(i+1),fs*(breakpoints(i+1)-breakpoints(i)));
            f_temp = function_specs(specs_count)*t + function_specs(specs_count+1);
            specs_count = specs_count+2;
            f = [f f_temp];
        case polynomial
            f_temp = 0;
            t = linspace(breakpoints(i),breakpoints(i+1),fs*(breakpoints(i+1)-breakpoints(i)));
            for j = 0:1:function_specs(specs_count)
                f_temp = f_temp + (function_specs(specs_count+j+1))*t.^(function_specs(specs_count)-j);
            end
            specs_count = specs_count + function_specs(specs_count)+2;
            f = [f f_temp];
        case exponential
            t = linspace(breakpoints(i),breakpoints(i+1),fs*(breakpoints(i+1)-breakpoints(i)));
            f_temp = function_specs(specs_count)*exp(function_specs(specs_count+1)*t);
            specs_count = specs_count+2;
            f = [f f_temp];
        case sinusoidal
            t = linspace(breakpoints(i),breakpoints(i+1),fs*(breakpoints(i+1)-breakpoints(i)));
            f_temp = function_specs(specs_count)*sin(2*pi*function_specs(specs_count+1)*t+(function_specs(specs_count+2))*pi/180);
            specs_count = specs_count+3;
            f = [f f_temp];
    end
end


t_function = linspace(breakpoints(1),breakpoints(length(breakpoints)),(breakpoints(length(breakpoints))-breakpoints(1))*fs);
subplot(1,2,1)
plot(t_function,f)
title('originl function')
subplot(1,2,2)
plot(t_function,f)
title('function after operation')
f_new = f;
t_function_new = t_function;

none = 0;
while(none == 0)
    disp('Do you want to perform any operations on the signal?');
    disp(new_line);
    disp(['1.Amplitude Scaling' new_line '2.Time Reversal' new_line '3.Time shift' new_line '4.Expand the signal' new_line '5.Compress the signal' new_line '6.vertical shift' new_line '7.None']);
    operation = str2double(input('Enter your choice: ','s'));
    while(operation > 7 || operation < 1 || isnan(operation))
        operation = str2double(input('Enter your choice: ','s'));
    end
    switch operation
        case 1
            amp = str2double(input('Enter amplitude scaling: ','s'));
            f_new = amp*f_new;
            subplot(1,2,2)
            plot(t_function_new,f_new);
            title('function after operation')
        case 2
            t_function_new = t_function_new * -1;
            subplot(1,2,2)
            plot(t_function_new,f_new);
            title('function after operation')
        case 3
            shift = str2double(input('Enter value for shifting(+ve right,-ve left): ','s'));
            while(isnan(shift))
                shift = str2double(input('Enter a valid value for shifting: ','s'));
            end
            t_function_new = t_function_new + shift;
            subplot(1,2,2)
            plot(t_function_new,f_new);
            title('function after operation')
        case 4
            val = str2double(input('Enter value of expansion: ','s'));
            while(val<=0 || isnan(val))
                val = str2double(input('Enter a valid value of expansion: ','s'));
            end
            t_function_new = t_function_new*val;
            subplot(1,2,2)
            plot(t_function_new,f_new);
            title('function after operation')
        case 5
            val = str2double(input('Enter value of compression: ','s'));
            while(val<=0 || isnan(val) || val>1)
                val = str2double(input('Enter a valid value of compression: ','s'));
            end
            t_function_new = t_function_new*val;
            subplot(1,2,2)
            plot(t_function_new,f_new);
            title('function after operation')
        case 6
            val = str2double(input('Enter value of vertical shifting: ','s'));
            while(isnan(val))
                val = str2double(input('Enter a valid value of vertical shifting: ','s'));
            end
            f_new = f_new + val;
            subplot(1,2,2)
            plot(t_function_new,f_new);
            title('function after operation')
        case 7
            none = 1;
            disp('THANK YOU FOR USING OUR SIGNAL GENERATOR');
    end
    
end
    
            
            
            
    
                
                
            
            
    


