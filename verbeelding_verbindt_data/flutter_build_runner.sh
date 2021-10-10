#!/bin/bash
FVM=$(which fvm)
if [ "$1" == "build" ]
then
  if [ -z "$FVM" ]
  then
    echo "fvm not found"
    flutter pub run build_runner build --delete-conflicting-outputs
  else
    echo "fvm found"
    fvm flutter pub run build_runner build --delete-conflicting-outputs
  fi
else
  if [ -z "$FVM" ]
  then
    echo "fvm not found"
    flutter pub run build_runner watch --delete-conflicting-outputs
  else
    echo "fvm found"
    fvm flutter pub run build_runner watch --delete-conflicting-outputs
  fi
fi
