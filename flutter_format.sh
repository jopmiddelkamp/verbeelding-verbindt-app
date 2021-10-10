FVM=$(which fvm)
if [ -z "$FVM" ]
then
  echo "fvm not found"
  flutter format .
  flutter format core
  flutter format data
  flutter format presentation
else
  echo "fvm found"
  fvm flutter format .
  fvm flutter format core
  fvm flutter format data
  fvm flutter format presentation
fi