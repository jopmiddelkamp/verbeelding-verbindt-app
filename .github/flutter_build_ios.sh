while getopts t:f: flag
do
    case "${flag}" in
        t) target=${OPTARG};;
        f) flavor=${OPTARG};;
    esac
done
cd bootstrap
flutter build ios --release --no-codesign --target=$target --flavor $flavor
cd ..
