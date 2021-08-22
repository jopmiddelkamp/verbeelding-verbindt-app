while getopts t:f: flag
do
    case "${flag}" in
        t) target=${OPTARG};;
        f) flavor=${OPTARG};;
    esac
done
echo "target: $target"
echo "flavor: $flavor"
exit 0;
cd bootstrap
flutter build apk --target=$target --flavor $flavor --release
cd ..
