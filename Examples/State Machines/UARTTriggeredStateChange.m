% Example state matrix: Switches states when byte 0x3 arrives from
% EchoModule1. To make an EchoModule, add a Bpod Arudino Shield to an
% Arduino M0 or Due, and load the EchoModule firmware from the repository.
% You can send the '3' manually, from the Arduino application's serial terminal
% (in which case it will be passed to the state machine),
% or from the Bpod console's EchoModule override tab with 'Bytes' mode selected,
% (in which case the byte will be sent from the state machine to the echo module,
% and echoed back as an incoming event).

sma = NewStateMachine;

sma = AddState(sma, 'Name', 'Port1LightOn', ...
    'Timer', 1,...
    'StateChangeConditions', {'EchoModule1_3', 'Port3LightOn'},...
    'OutputActions', {'PWM1', 255});
sma = AddState(sma, 'Name', 'Port3LightOn', ...
    'Timer', 1,...
    'StateChangeConditions', {'Tup', 'exit'},...
    'OutputActions', {'PWM3', 255});