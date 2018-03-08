#!/usr/bin/env bash

for dir in ExtraLight Light Regular Medium SemiBold Bold Heavy; do

cd $dir

### Command lines for building the region-specific subset OTFs
makeotf -f cidfont.ps.CN -omitMacNames -ff features.CN -fi cidfontinfo.CN -mf ../FontMenuNameDB.SUBSET -r -nS -cs 25 -ch ../UniSourceHanSerifCN-UTF32-H -ci ../SourceHanSerif_CN_sequences.txt

makeotf -f cidfont.ps.TW -omitMacNames -ff features.TW -fi cidfontinfo.TW -mf ../FontMenuNameDB.SUBSET -r -nS -cs 2 -ch ../UniSourceHanSerifTW-UTF32-H -ci ../SourceHanSerif_TW_sequences.txt

makeotf -f cidfont.ps.JP -omitMacNames -ff features.JP -fi cidfontinfo.JP -mf ../FontMenuNameDB.SUBSET -r -nS -cs 1 -ch ../UniSourceHanSerifJP-UTF32-H -ci ../SourceHanSerif_JP_sequences.txt

makeotf -f cidfont.ps.KR -omitMacNames -ff features.KR -fi cidfontinfo.KR -mf ../FontMenuNameDB.SUBSET -r -nS -cs 3 -ch ../UniSourceHanSerifKR-UTF32-H -ci ../SourceHanSerif_KR_sequences.txt

cd OTC

### Command lines for building the language-specific OTFs
makeotf -f cidfont.ps.OTC.SC -omitMacNames -ff features.OTC.SC -fi cidfontinfo.OTC.SC -mf ../../FontMenuNameDB -r -nS -cs 25 -ch ../../UniSourceHanSerifCN-UTF32-H -ci ../../SourceHanSerif_CN_sequences.txt

makeotf -f cidfont.ps.OTC.TC -omitMacNames -ff features.OTC.TC -fi cidfontinfo.OTC.TC -mf ../../FontMenuNameDB -r -nS -cs 2 -ch ../../UniSourceHanSerifTW-UTF32-H -ci ../../SourceHanSerif_TW_sequences.txt

makeotf -f cidfont.ps.OTC.J -omitMacNames -ff features.OTC.J -fi cidfontinfo.OTC.J -mf ../../FontMenuNameDB -r -nS -cs 1 -ch ../../UniSourceHanSerifJP-UTF32-H -ci ../../SourceHanSerif_JP_sequences.txt

makeotf -f cidfont.ps.OTC.K -omitMacNames -ff features.OTC.K -fi cidfontinfo.OTC.K -mf ../../FontMenuNameDB -r -nS -cs 3 -ch ../../UniSourceHanSerifKR-UTF32-H -ci ../../SourceHanSerif_KR_sequences.txt

### Command line for building the OTCs
otf2otc -t 'CFF '=0 -o SourceHanSerif-$dir.ttc SourceHanSerif-$dir.otf SourceHanSerifK-$dir.otf SourceHanSerifSC-$dir.otf SourceHanSerifTC-$dir.otf

sfntedit -x CFF=CFF.J SourceHanSerif-$dir.otf
cp SourceHanSerif-$dir.otf SourceHanSerif-$dir.otf.tmp
cp SourceHanSerifK-$dir.otf SourceHanSerifK-$dir.otf.tmp
cp SourceHanSerifSC-$dir.otf SourceHanSerifSC-$dir.otf.tmp
cp SourceHanSerifTC-$dir.otf SourceHanSerifTC-$dir.otf.tmp
sfntedit -a CFF=CFF.J SourceHanSerifK-$dir.otf.tmp
sfntedit -a CFF=CFF.J SourceHanSerifSC-$dir.otf.tmp
sfntedit -a CFF=CFF.J SourceHanSerifTC-$dir.otf.tmp
sfntedit -d DSIG SourceHanSerif-$dir.otf.tmp
sfntedit -d DSIG SourceHanSerifK-$dir.otf.tmp
sfntedit -d DSIG SourceHanSerifSC-$dir.otf.tmp
sfntedit -d DSIG SourceHanSerifTC-$dir.otf.tmp

cd ../../

done

otf2otc -o SourceHanSerif.ttc ExtraLight/OTC/SourceHanSerif-ExtraLight.otf.tmp ExtraLight/OTC/SourceHanSerifK-ExtraLight.otf.tmp ExtraLight/OTC/SourceHanSerifSC-ExtraLight.otf.tmp ExtraLight/OTC/SourceHanSerifTC-ExtraLight.otf.tmp Light/OTC/SourceHanSerif-Light.otf.tmp Light/OTC/SourceHanSerifK-Light.otf.tmp Light/OTC/SourceHanSerifSC-Light.otf.tmp Light/OTC/SourceHanSerifTC-Light.otf.tmp Regular/OTC/SourceHanSerif-Regular.otf.tmp Regular/OTC/SourceHanSerifK-Regular.otf.tmp Regular/OTC/SourceHanSerifSC-Regular.otf.tmp Regular/OTC/SourceHanSerifTC-Regular.otf.tmp Medium/OTC/SourceHanSerif-Medium.otf.tmp Medium/OTC/SourceHanSerifK-Medium.otf.tmp Medium/OTC/SourceHanSerifSC-Medium.otf.tmp Medium/OTC/SourceHanSerifTC-Medium.otf.tmp SemiBold/OTC/SourceHanSerif-SemiBold.otf.tmp SemiBold/OTC/SourceHanSerifK-SemiBold.otf.tmp SemiBold/OTC/SourceHanSerifSC-SemiBold.otf.tmp SemiBold/OTC/SourceHanSerifTC-SemiBold.otf.tmp Bold/OTC/SourceHanSerif-Bold.otf.tmp Bold/OTC/SourceHanSerifK-Bold.otf.tmp Bold/OTC/SourceHanSerifSC-Bold.otf.tmp Bold/OTC/SourceHanSerifTC-Bold.otf.tmp Heavy/OTC/SourceHanSerif-Heavy.otf.tmp Heavy/OTC/SourceHanSerifK-Heavy.otf.tmp Heavy/OTC/SourceHanSerifSC-Heavy.otf.tmp Heavy/OTC/SourceHanSerifTC-Heavy.otf.tmp
