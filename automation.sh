echo "Student - Achin Kumar Ror"
echo " Present working directory"
pwd


echo " Student -Achin Kumar Ror"
echo " Present working directory"
pwd

# Update  package
echo "Update Package"
sudo apt update -y

# Is Apache2 server already installed?
dpkg -s apache2

# Install Apache2:
if [ $? -eq 0 ]
then
    echo "Apache2 server is already installed."
else
    echo "Install Apache2 Server"
    sudo apt install apache2 -y
fi


# Check Apache2 service status:
sudo systemctl is-active --quiet apache2


# Check Apache2 service status:
sudo systemctl is-active --quiet apache2

if [ $? -eq 0 ]
then
    echo "Apache2 service is already running."
else
    echo "Starting Apache2 service"
    sudo service apache2 start
fi


# Check Apache2 service on reboot:
sudo systemctl is-enabled apache2
        
if [ $? -eq 0 ]
then
    echo "Apache2 service is already enabled."
else
    echo "Enabling Apache2 service..."
    sudo service apache2 enable
fi
		
	
# Variable Declaration:
s3_bckt="upgrad-achin"
timestamp=$(date '+%d%m%Y-%H%M%S')
myname='achin'


# Create tar file from the Apache2 server logs:
echo "Creating archive of Apache2 log files..."

filename="$myname-httpd-logs-$timestamp.tar.gz"

current_dir=$(pwd)
cd /var/log/apache2

sudo tar -czf $filename *.log

sudo mv $filename /tmp/
cd $current_dir


# Check if AWS-CLI is installed:
dpkg -s awscli
if [ $? -eq 0 ]
then 
    echo "AWS-CLI is already installed."
else 
    echo "Install AWS-CLI"
    sudo apt install awscli -y
fi


# Upload archived file to AWS S3 bucket:
echo "Uploading file to S3 bucket S3 bucket"

aws s3 cp /tmp/$filename s3://$s3_bckt//$filename
