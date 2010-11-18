#!/bin/bash

localdir=/tmp/fclose.com
testurl=http://fclose.com/b/
testfile=index.html

testfileaddr=${localdir}/${testfile}
mkdir -p $localdir
rm -f ${localdir}/${testfile}

wget --tries=3 --timeout=10 ${testurl} -O ${testfileaddr}

if [[ -f ${testfileaddr}  ]]
then
    date;
    echo "ok";
else
    date | mailx -S smtp="smtp://smtp.ust.hk" -s "pkill.info test
    failed." -r "admin@fclose.com" admin@fclose.com
fi

