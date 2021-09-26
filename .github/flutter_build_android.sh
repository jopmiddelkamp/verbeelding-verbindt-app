while getopts target:flavor:build-name:build-number: flag
do
    case "${flag}" in
        target) target=${OPTARG};;
        flavor) flavor=${OPTARG};;
        build-name) build-name=${OPTARG};;
        build-number) build-number=${OPTARG};;
    esac
done
echo "target: $target"
echo "flavor: $flavor"
exit 0;
cd bootstrap
flutter build appbundle --target=$target --flavor $flavor --release
cd ..
