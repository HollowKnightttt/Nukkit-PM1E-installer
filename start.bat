@echo off

mkdir "-p" "nukkit-pm1e"
cd "nukkit-pm1e"

echo "Downloading Nukkit-PM1E..."
wget "-q" "--show-progress" "https://github.com/PetteriM1/NukkitPetteriM1Edition/releases/download/4567/Nukkit-PM1E.jar"

echo "Starting server to generate configuration files..."
java "-jar" "Nukkit-PM1E.jar"
SET "SERVER_PID=%!%"

REM Wait for the server to boot and generate server.properties
sleep "12"

REM Gracefully stop the server so we can edit properties
echo "Stopping server to apply configuration..."
kill "-15" "%SERVER_PID%"
wait "%SERVER_PID%" REM UNKNOWN: {"type":"Redirect","op":{"text":">","type":"great"},"file":{"text":"/dev/null","type":"Word"},"numberIo":{"text":"2","type":"io_number"}}

REM Generate a valid random port (between 10000 and 65535)
SET "RANDOM_PORT=$((RANDOM % 55535 + 10000))"
echo "Assigned port: %RANDOM_PORT%"

REM Use double quotes for variable expansion and correct property name
echo "server port and webrtc port cant not be same unless you set the raknet to off"
sed "-i" "s/server-port=19132/server-port=%RANDOM_PORT%/g" "server.properties"

echo "Downloading WorldGeneratorExtension plugin..."
mkdir "-p" "plugins"
cd "plugins"
wget "-q" "--show-progress" "https://github.com/HollowKnightttt/worldgeneratorextension-v1.9.0/releases/download/Ramz--network/WorldGeneratorExtension-1.9.0.jar"

REM Return to root server directory
cd ".."

echo "Starting Nukkit server with plugins..."
java "-jar" "Nukkit-PM1E.jar"
