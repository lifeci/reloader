#!/bin/sh

files_pattern=$FILES_PATTERN;
action=$ACTION;
check_interval=$CHECK_INTERVAL

if [ -z $files_pattern ] || [ -z $action ]; then
  echo "ERROR: [ files_pattern: $files_pattern || action: $action ]";
  exit 1
fi;

if [ -z $check_interval ]; then
  check_interval=1;
  echo "check_interval was set to default: $check_interval";
fi

get_sha(){
  cat $files_pattern | sha256sum | cut -f 1 -d " "
}

sum_current=`get_sha $files_pattern`;

echo "I'll monitor every check_interval=$check_interval files_pattern=$files_pattern";
echo "in case if it will be changed => apply action=$action";

while true
do

  sum_check=`get_sha $files_pattern`;

  if [ "$sum_current" != "$sum_check" ]; then
    echo "`date` :: executing: $action";
    `$action`
    sum_current=$sum_check;
  else
    echo "nothing to do";
  fi;

  sleep $check_interval;

done
