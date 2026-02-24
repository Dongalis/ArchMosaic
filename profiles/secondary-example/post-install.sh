echo "This is command from profile \"secondary-example\" running post-install part"
echo "removing deployed files as part of post-install"
rm -f ~/testfile.txt
sudo rm -f /tmp/testfile.txt
