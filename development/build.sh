cd ..
npm run-script build
cd development
mkdir app
cp -r ../package.json ../src ../public ../build app
vagrant up --provision
