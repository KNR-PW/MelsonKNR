% Close port
closePort(port_num_485);
closePort(port_num_TTL);


% Unload Library
unloadlibrary(lib_name);

clear lib_name port_num_485 port_num_TTL PROTOCOL_VERSION;
