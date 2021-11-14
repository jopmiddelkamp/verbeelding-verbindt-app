DART_DEFINE=""
for varname in ${!DART_DEFINE_*}
do
    DART_DEFINE="$DART_DEFINE --dart-define "${varname/DART_DEFINE_/}"=${!varname}"
done
envman add --key DART_DEFINE --value "$DART_DEFINE" --sensitive