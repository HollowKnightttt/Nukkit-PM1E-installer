mkdir nukkit-pm1e
cd nukkit-pm1e

wget https://github.com/PetteriM1/NukkitPetteriM1Edition/releases/download/4567/Nukkit-PM1E.jar

echo "please wait for 10 second and it will start installing"

java -jar Nukkit-PM1E.jar

sleep 10

stop

RANDOM_PORT=$((RANDOM % 90000 + 10000))

sed -i 's/webrtc-port=19132/webrtc-port=$RANDOM_PORT/g' server.properties

cd plugins

wget https://github.com/HollowKnightttt/worldgeneratorextension-v1.9.0/releases/download/Ramz--network/WorldGeneratorExtension-1.9.0.jar

sleep 3

cd nukkit-pm1e

java -jar Nukkit-PM1E.jar
