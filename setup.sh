sudo apt-get update -y; # patch linux
sudo apt-get install -y curl; sudo apt-get install -y unzip # install unix tools
sudo apt install -y net-tools # install unix netwoking tools
sudo apt install -y openjdk-11-jdk # install java
sudo curl -L "http://mirrors.ukfast.co.uk/sites/ftp.apache.org/avro/stable/java/avro-tools-1.9.1.jar" -o ./avro-tools-1.9.1.jar # install java avro > json
sudo apt-get install -y python3-pip # install python
sudo pip3 install csvkit # install python json > csv
git clone https://github.com/implydata/candidate-exercises-public # fetch imply dataset
cp candidate-exercises-public/Customer\ Success/SA/DataEngineeringProject/Applicant/DataSets/* . # copy files
uptime # show start time on clean vm
java -jar ./avro-tools-1.9.1.jar tojson CityListB.avro > CityListB.json # convert avro to json
in2csv CityListA.json > CityListA.csv # convert json to csv
in2csv --format ndjson CityListB.json > CityListB.csv # convert json to csv
cat *.csv | grep -v Population | sort -u > dataset.csv # combine csv stripping headers
echo "Total Row Count"
cat dataset.csv | wc -l # show total rows
echo "Largest Population"
cat dataset.csv | sort -n -t "," -k3,3 | tail -1 # show largest city
echo "Total Population in Brazilian Cities"
cat dataset.csv | grep BRA | awk -F ',' '{sum+=$NF} END {print sum}' # BRA cities total population
echo "Genetate Dataset - dataset.csv.gz"
gzip dataset.csv # zip dataset
ls -l dataset.csv.gz # show zip file timestamps
uptime # show start time on clean vm
