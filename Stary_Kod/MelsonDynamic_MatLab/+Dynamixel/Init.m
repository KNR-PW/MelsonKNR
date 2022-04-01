
%% Initialize connection with dynamixels via USB2Dynamixel
if strcmp(computer, 'PCWIN')
  lib_name = 'dxl_x86_c';
elseif strcmp(computer, 'PCWIN64')
  lib_name = 'dxl_x64_c';
elseif strcmp(computer, 'GLNX86')
  lib_name = 'libdxl_x86_c';
elseif strcmp(computer, 'GLNXA64')
  lib_name = 'libdxl_x64_c';
end

% Load Libraries
if ~libisloaded(lib_name)
    [notfound,warnings] = loadlibrary(lib_name, 'dynamixel_sdk.h', 'addheader', 'port_handler.h', 'addheader', 'packet_handler.h', 'addheader', 'group_bulk_read.h', 'addheader', 'group_sync_read.h', 'addheader', 'group_sync_write.h');
end

% Protocol version
global PROTOCOL_VERSION;
PROTOCOL_VERSION            = 1.0;          % See which protocol version is used in the Dynamixel

% Default setting

BAUDRATE                    = 1000000;
DEVICENAME_485                  = 'COM9';       % Check which port is being used on your controller
                                            % ex) Windows: "COM1"   Linux: "/dev/ttyUSB0"
DEVICENAME_TTL                  = 'COM8';       % Check which port is being used on your controller
                                         % ex) Windows: "COM1"   Linux: "/dev/ttyUSB0"


% Initialize PortHandler Structs
% Set the port path
% Get methods and members of PortHandlerLinux or PortHandlerWindows
global port_num_485;
global port_num_TTL;


port_num_485 = portHandler(DEVICENAME_485);
port_num_TTL = portHandler(DEVICENAME_TTL);


% Initialize PacketHandler Structs
packetHandler();

% Open port
if (openPort(port_num_485))
    fprintf('Succeeded to open the port!\n');
else
    unloadlibrary(lib_name);
    fprintf('Failed to open the port!\n');
    input('Press any key to terminate...\n');
    return;
end

if (openPort(port_num_TTL))
    fprintf('Succeeded to open the port!\n');
else
    unloadlibrary(lib_name);
    fprintf('Failed to open the port!\n');
    input('Press any key to terminate...\n');
    return;
end


% Set port baudrate
if (setBaudRate(port_num_485, BAUDRATE))
    fprintf('Succeeded to change the baudrate!\n');
else
    unloadlibrary(lib_name);
    fprintf('Failed to change the baudrate!\n');
    input('Press any key to terminate...\n');
    return;
end

% Set port baudrate
if (setBaudRate(port_num_TTL, BAUDRATE))
    fprintf('Succeeded to change the baudrate!\n');
else
    unloadlibrary(lib_name);
    fprintf('Failed to change the baudrate!\n');
    input('Press any key to terminate...\n');
    return;
end






clear i ans; 
clear BAUDRATE DEVICENAME_485 DEVICENAME_TTL;
clear group_num;
clear notfound warnings;



