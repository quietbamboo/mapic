cd ..
#working dir /
for i in pet background baby ah
do
#push files from template to sub projects
cp template/*.m $i/
#cp template/*.h $i/
cp -r template/Classes/ $i/Classes/

done
