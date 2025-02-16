node dist/app.js &
echo waiting...
sleep 5
echo wait done!
testy=$(curl http://localhost:3000 -s)
echo \"🐐 got this result.... $testy\"
echo "testy=$testy" >> $GITHUB_ENV