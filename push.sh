git add .
git commit -m "update"
git push -u origin main

here=$(pwd)

cd /Users/emrekasgur/Desktop/testgenie/v2/testgenie-runner

bash build.sh  && bash run.sh

cd here