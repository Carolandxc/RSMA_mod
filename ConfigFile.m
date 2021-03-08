function [ out ] = ConfigFile( caseName, checkFlag)
% �������ݺ�case���ּ��
% ��flagΪtrue����caseName�Ƿ���ȷ������0/1
% ���򣨻���ֻ���뵥�����������������ݣ�����config�ṹ��

if nargin==1
    checkFlag = 'false';
end

caseSet = {'debug'};

if strcmpi(checkFlag, 'true')
    out = ismember(caseName, caseSet);
else
    % common parameters
    config.snr_dB_vec = 20; % 0: 5: 30;
    config.Nuser = 2; % number of users
    config.weight = [1, 0.001];
    
    % parameters for each case
    switch char(caseName)
        case 'debug'
            config.tx = 4;
            config.rx = 1;
            config.userRelativeStrength = 1; % user k to user 1
            config.txRelativeAngle = pi / 9;
        otherwise
            config = -1;
    end
    
    % derived parameters
    config.snr_vec = db2pow(config.snr_dB_vec);
    
    % return
    out = config;
end
    
end